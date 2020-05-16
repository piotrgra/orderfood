package pl.coderslab.orderfood.controller;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.entity.Order;
import pl.coderslab.orderfood.repository.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final OrderRepository orderRepository;
    private final DeliveryMethodRepository deliveryMethodRepository;
    private final PaymentMethodRepository paymentMethodRepository;

    public AdminController(ItemRepository itemRepository, CategoryRepository categoryRepository, OrderRepository orderRepository, DeliveryMethodRepository deliveryMethodRepository, PaymentMethodRepository paymentMethodRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.orderRepository = orderRepository;
        this.deliveryMethodRepository = deliveryMethodRepository;
        this.paymentMethodRepository = paymentMethodRepository;
    }

    @GetMapping("")
    public String dashboard() {
        return "admin/index";
    }

    @GetMapping("/orders")
    public String orders(Model model) {
        model.addAttribute("orders", orderRepository.findAll(Sort.by(Sort.Direction.DESC, "id")));
        return "admin/ordersList";
    }

    @GetMapping("/items")
    public String items(Model model) {
        model.addAttribute("items", itemRepository.findAll());
        return "admin/itemsList";
    }

    @GetMapping("/categories")
    public String categories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll());
        return "admin/categoriesList";
    }

    @GetMapping("/paymentsMethod")
    public String paymentsMethod(Model model) {
        model.addAttribute("paymentsMethod", paymentMethodRepository.findAll());
        return "admin/paymentsList";
    }

    @GetMapping("/deliveriesMethod")
    public String deliveriesMethod(Model model) {
        model.addAttribute("deliveriesMethod", deliveryMethodRepository.findAll());
        return "admin/deliveryList";
    }

    @GetMapping("/orderEdit")
    public String editOrder(@RequestParam long orderId, Model model) {
        Order order = orderRepository.findById(orderId).get();
        model.addAttribute("order", order);
        return "admin/order";
    }

    @PostMapping("/orderEdit")
    public String editOrderForm(@ModelAttribute Order order, @RequestParam long orderId) {

        Order oldOrder = orderRepository.findById(orderId).get();
        oldOrder.setStatus(order.getStatus());
        orderRepository.save(oldOrder);

        System.out.println(order.getOrderReady());
        return "redirect:/admin/orderEdit?orderId="+orderId;
    }


}