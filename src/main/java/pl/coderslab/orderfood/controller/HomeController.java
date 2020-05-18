package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.bean.Cart;
import pl.coderslab.orderfood.bean.CartItem;
import pl.coderslab.orderfood.entity.*;
import pl.coderslab.orderfood.repository.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class HomeController {
    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final Cart cart;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final StatusRepository statusRepository;

    public HomeController(ItemRepository itemRepository, CategoryRepository categoryRepository, Cart cart, OrderRepository orderRepository, OrderItemRepository orderItemRepository, StatusRepository statusRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.cart = cart;
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;
        this.statusRepository = statusRepository;
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

    @GetMapping("/menu")
    public String homeMenu(@RequestParam long categoryId, Model model) {

        List<Item> items = itemRepository.findAllByCategoryId(categoryId);
        model.addAttribute("items", items);
        return "index";
    }

    @GetMapping("/addToCart")
    public String addToCart(@RequestParam long id, @RequestParam int quantity, Model model) {
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

    @PostMapping("/checkout")
    public String placeOrder(@ModelAttribute Order userData, Model model) {
        List<CartItem> cartItems = cartItems();
        List<OrderItem> orderItems = new ArrayList<>();
        Order order = new Order();

        order.setStatus(setStatus(1));
        order.setFirstName(userData.getFirstName());
        order.setLastName(userData.getLastName());
        order.setAddress(userData.getAddress());
        order.setZip(userData.getZip());
        order.setEmail(userData.getEmail());
        order.setDeliveryMethod(userData.getDeliveryMethod());
        order.setPaymentMethod(userData.getPaymentMethod());
        order.setPhone(userData.getPhone());
        order.setCity(userData.getCity());
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

        cartItems.clear();

        model.addAttribute("order", order);
        return "ordered";
    }

    @GetMapping("/order")
    public String order(Model model) {
        model.addAttribute("order", new Order());
        return "checkout";
    }

    public Status setStatus(long id) {
        return statusRepository.findById(id).get();
    }

}