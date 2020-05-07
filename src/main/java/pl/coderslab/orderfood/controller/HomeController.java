package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.orderfood.bean.Cart;
import pl.coderslab.orderfood.bean.CartItem;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Item;
import pl.coderslab.orderfood.entity.Order;
import pl.coderslab.orderfood.entity.OrderItem;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;
import pl.coderslab.orderfood.repository.OrderItemRepository;
import pl.coderslab.orderfood.repository.OrderRepository;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final Cart cart;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    public HomeController(ItemRepository itemRepository, CategoryRepository categoryRepository, Cart cart, OrderRepository orderRepository, OrderItemRepository orderItemRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.cart = cart;
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("allItems")
    public List<Item> items() {
        return itemRepository.findAll();
    }

    @ModelAttribute("cart")
    public List<CartItem> cartItems() {
        return cart.getCartItems();
    }

    @ModelAttribute("totalPrice")
    public double totalPrice() {
        List<CartItem> cartItems = cart.getCartItems();
        double totalPrice = 0;

        for (CartItem cartItem : cartItems) {
            totalPrice += cartItem.getProduct().getPrice() * cartItem.getQuantity();
        }
        return totalPrice;
    }

    @GetMapping("")
    public String home(Model model) {
        model.addAttribute("items", itemRepository.findAll());
        return "index";
    }

    @GetMapping("/menu/{id}")
    public String homeMenu(@PathVariable long id, Model model) {
        List<Item> items = itemRepository.findAllByCategoryId(id);
        model.addAttribute("items", items);
        return "index";
    }

    @GetMapping("addToCart/{id}/{quantity}")
    public String addToCart(@PathVariable long id, @PathVariable int quantity, Model model) {
        Item item = itemRepository.findById(id).get();
        List<CartItem> cartItems = cart.getCartItems();

        for (CartItem cartItem : cartItems) {
            if (cartItem.getProduct().getId() == id) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                return "redirect:/";
            }
        }
        cartItems.add(new CartItem(item, quantity));
        return "redirect:/";
    }

    @GetMapping("/cart")
    public String cart() {
        return "cart";
    }

    @GetMapping("/removeFromCart/{id}")
    public String removeFromCart(@PathVariable long id, Model model) {
        List<CartItem> cartItems = cartItems();

        cartItems.removeIf(cartItem -> cartItem.getProduct().getId() == id);

        return "redirect:/cart";
    }

    @PostMapping("/placeOrder")
    public String placeOrder(HttpSession session, @ModelAttribute Order userData, Model model) {
        List<CartItem> cartItems = cartItems();
        List<OrderItem> orderItems = new ArrayList<>();
        Order order = new Order();

        order.setAddress(userData.getAddress());
        order.setEmail(userData.getEmail());
        order.setName(userData.getName());
        order.setPhone(userData.getPhone());

        order.setTotalPrice(totalPrice());

        for (CartItem cartItem : cartItems) {

            Item item = cartItem.getProduct();
            int quantity = cartItem.getQuantity();
            OrderItem orderItem = new OrderItem();

            orderItem.setItem(item);
            orderItem.setQuantity(quantity);

            orderItems.add(orderItem);
            orderItemRepository.save(orderItem);
        }
        order.setOrderItems(orderItems);
        orderRepository.save(order);

        session.invalidate();

        model.addAttribute("order", order);
        return "ordered";
    }

    @GetMapping("/order")
    public String order(Model model) {
        model.addAttribute("order", new Order());
        return "place-order";
    }

}