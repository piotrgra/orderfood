package pl.coderslab.orderfood.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.bean.Cart;
import pl.coderslab.orderfood.bean.CartItem;
import pl.coderslab.orderfood.enmu.PaymentMethod;
import pl.coderslab.orderfood.entity.*;
import pl.coderslab.orderfood.repository.*;

import javax.validation.Valid;
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
    private final DeliveryMethodRepository deliveryMethodRepository;

    public HomeController(ItemRepository itemRepository, CategoryRepository categoryRepository, Cart cart, OrderRepository orderRepository, OrderItemRepository orderItemRepository, StatusRepository statusRepository, DeliveryMethodRepository deliveryMethodRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.cart = cart;
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;
        this.statusRepository = statusRepository;
        this.deliveryMethodRepository = deliveryMethodRepository;
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryRepository.findAll(Sort.by(Sort.Direction.ASC, "categoryOrder"));
    }

    @ModelAttribute("paymentMethods")
    public List<String> paymentMethods() {

        PaymentMethod[] values = PaymentMethod.values();
        List<String> allPaymentMethods = new ArrayList<>();

        for (PaymentMethod payment : values) {
            allPaymentMethods.add(payment.name());
        }

        return allPaymentMethods;
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

        return Math.round(totalPrice * 100.0) / 100.0;
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
    public String removeFromCart(@PathVariable long id) {
        List<CartItem> cartItems = cartItems();

        cartItems.removeIf(cartItem -> cartItem.getProduct().getId() == id);

        return "redirect:/cart";
    }

    @PostMapping("/checkout")
    public String placeOrder(@Valid @ModelAttribute Order order, BindingResult bindingResult, Model model) {

        if (!bindingResult.hasErrors()) {
            List<CartItem> cartItems = cartItems();
            List<OrderItem> orderItems = new ArrayList<>();

            order.setStatus(setStatus(1));
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

            if (order.getPaymentMethod() == PaymentMethod.DOTPAY) {
                StringBuilder chk = new StringBuilder();
                chk.append("qCkaA4PFfngrb0moFzBJEfg0y69f2aOl"); //PIN
                chk.append("764501");// ID
                chk.append(order.getTotalPrice()); // AMOUNT
                chk.append("PLN"); //CURRENCY
                chk.append("test"); // DESCRIPTION


                System.out.println(chk);
                String hashed = DigestUtils.sha256Hex(chk.toString());
                System.out.println(hashed);
                model.addAttribute("chk", hashed);
            }


            return "summary";
        } else {

            model.addAttribute("deliveryMethods", deliveryMethodRepository.findAll());
            return "checkout";
        }

    }

    @GetMapping("/order")
    public String order(Model model) {
        List<CartItem> cartItems = cartItems();

        if (!cartItems.isEmpty()) {
            model.addAttribute("order", new Order());
            model.addAttribute("deliveryMethods", deliveryMethodRepository.findAll());
            return "checkout";
        } else {
            return "cart";
        }

    }

    @GetMapping("/ordered")
    public String ordered(@RequestParam String orderId) {
        System.out.println(orderId);
        return "ordered";
    }

    public Status setStatus(long id) {
        return statusRepository.findById(id).get();
    }

}
