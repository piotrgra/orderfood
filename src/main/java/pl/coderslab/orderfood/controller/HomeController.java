package pl.coderslab.orderfood.controller;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.bean.Cart;
import pl.coderslab.orderfood.bean.CartItem;
import pl.coderslab.orderfood.enmu.DeliveryMethod;
import pl.coderslab.orderfood.enmu.PaymentMethod;
import pl.coderslab.orderfood.enmu.PaymentState;
import pl.coderslab.orderfood.entity.*;
import pl.coderslab.orderfood.repository.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
public class HomeController {
    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final Cart cart;
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;
    private final StatusRepository statusRepository;
    private final ShopRepository shopRepository;

    public HomeController(ItemRepository itemRepository, CategoryRepository categoryRepository, Cart cart, OrderRepository orderRepository, OrderItemRepository orderItemRepository, StatusRepository statusRepository, ShopRepository shopRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.cart = cart;
        this.orderItemRepository = orderItemRepository;
        this.orderRepository = orderRepository;
        this.statusRepository = statusRepository;
        this.shopRepository = shopRepository;
    }

    @ModelAttribute("shop")
    public ShopSetting shopModel() {

        ShopSetting shopSetting = null;
        List<ShopSetting> all = shopRepository.findAll();
        if (all.size() > 0) {
            shopSetting = all.get(0);
        }

        return shopSetting;
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

    @ModelAttribute("deliveryMethods")
    public List<String> deliveryMethods() {
        DeliveryMethod[] values = DeliveryMethod.values();
        List<String> allDeliveryMethods = new ArrayList<>();

        for (DeliveryMethod deliveryMethod : values) {
            allDeliveryMethods.add(deliveryMethod.name());
        }
        return allDeliveryMethods;
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

        Optional<Item> getItem = itemRepository.findById(id);
        if (getItem.isPresent()) {
            Item item = getItem.get();
            List<CartItem> cartItems = cart.getCartItems();

            for (CartItem cartItem : cartItems) {
                if (cartItem.getProduct().getId() == id) {
                    cartItem.setQuantity(cartItem.getQuantity() + quantity);
                    return "redirect:/";
                }
            }
            cartItems.add(new CartItem(item, quantity));

        }

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

            if (order.getPaymentMethod() == PaymentMethod.PRZY_ODBIORZE) {
                order.setPaymentStatus(PaymentState.POBRANIE);
            }
            if (order.getPaymentMethod() == PaymentMethod.DOTPAY) {
                order.setPaymentStatus(PaymentState.OCZEKUJE);
            }

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

            String hashed = "brak";
            if (order.getPaymentMethod() == PaymentMethod.DOTPAY) {
                StringBuilder chk = new StringBuilder();
                chk.append("qCkaA4PFfngrb0moFzBJEfg0y69f2aOl"); //PIN
                chk.append("764501");// ID
                chk.append(order.getTotalPrice()); // AMOUNT
                chk.append("PLN"); //CURRENCY
                chk.append("Zamówienie #" + order.getId()); // DESCRIPTION
                chk.append("http://localhost:8080/thanks?id=" + order.getId());
                chk.append("0");
                chk.append("Wróć do sklepu");

                hashed = DigestUtils.sha256Hex(chk.toString());

            }

            return "redirect:/summary?orderId=" + order.getId() + "&chk=" + hashed;
        } else {

            return "checkout";
        }

    }

    @GetMapping("/summary")
    public String summary(@RequestParam long orderId, @RequestParam String chk, Model model) {
        Optional<Order> order = orderRepository.findById(orderId);

        if (order.isPresent()) {
            model.addAttribute("order", order.get());
            model.addAttribute("chk", chk);
        }

        return "summary";
    }

    @PostMapping("/thanks")
    public String thanks(@RequestParam String status, Model model, @RequestParam long id) {

        String realStatus = status.split(",")[0];
        model.addAttribute("status", realStatus);

        if ("OK".equals(realStatus)) {
            Optional<Order> orderById = orderRepository.findById(id);
            if (orderById.isPresent()) {
                Order order = orderById.get();
                order.setPaymentStatus(PaymentState.OPŁACONE);
                model.addAttribute("order", order);
                orderRepository.save(order);
            }

        }

        return "payment";
    }

    @GetMapping("/order")
    public String order(Model model) {
        List<CartItem> cartItems = cartItems();

        if (!cartItems.isEmpty()) {
            model.addAttribute("order", new Order());
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
        Optional<Status> statusById = statusRepository.findById(id);
        Status status = null;

        if (statusById.isPresent()) {
            status = statusById.get();
        }
        return status;
    }

}
