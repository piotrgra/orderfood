package pl.coderslab.orderfood.controller;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.enmu.DeliveryMethod;
import pl.coderslab.orderfood.enmu.PaymentMethod;
import pl.coderslab.orderfood.enmu.PaymentState;
import pl.coderslab.orderfood.entity.Order;
import pl.coderslab.orderfood.entity.Status;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;
import pl.coderslab.orderfood.repository.OrderRepository;
import pl.coderslab.orderfood.repository.StatusRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final OrderRepository orderRepository;
    private final StatusRepository statusRepository;

    public AdminController(ItemRepository itemRepository, CategoryRepository categoryRepository, OrderRepository orderRepository, StatusRepository statusRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.orderRepository = orderRepository;
        this.statusRepository = statusRepository;
    }

    // W readMe napisać o uruchmieniu tego!
    @GetMapping("/createStatus")
    public String createStatus() {
        Status status1 = new Status();
        status1.setName("NOWE");
        Status status2 = new Status();
        status2.setName("W REALIZACJI");
        Status status3 = new Status();
        status3.setName("ANULOWANE");

        statusRepository.save(status1);
        statusRepository.save(status2);
        statusRepository.save(status3);

        return "admin/index";
    }

    @ModelAttribute("paymentState")
    public List<String> paymentState() {

        PaymentState[] values = PaymentState.values();
        List<String> allPaymentStates = new ArrayList<>();

        for (PaymentState state : values) {
            allPaymentStates.add(state.name());
        }

        return allPaymentStates;
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

    @GetMapping("")
    public String dashboard(Model model) {

        List<Order> allFinishOrder = orderRepository.findAllByStatusId(4, Sort.by(Sort.Direction.DESC, "id")); // wszystkie zamowienia zakonczone
        double sum = allFinishOrder.stream()
                .mapToDouble(Order::getTotalPrice).sum();
        model.addAttribute("earnings", sum);

        return "admin/index";
    }

    @GetMapping("/orders")
    public String orders(Model model, @RequestParam(required = false) String search, @RequestParam(required = false) String status, @RequestParam(required = false) String delivery, @RequestParam(required = false) String paymentMethod, @RequestParam(required = false) String paymentState) {
        model.addAttribute("allStatus", statusRepository.findAll());
        List<Order> all = orderRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));

        if (search != null) {
            if (!search.isEmpty()) {
                all = orderRepository.findAllByCustomer_FirstNameContainingOrCustomer_LastNameContaining(search, search, Sort.by(Sort.Direction.DESC, "id"));
            }
        }

        if (status != null) {
            if (!status.isEmpty()) {
                all = all.stream()
                        .filter(e -> e.getStatus().getId() == Long.parseLong(status))
                        .collect(Collectors.toList());
            }

        }

        if (delivery != null) {
            if (!delivery.isEmpty()) {
                all = all.stream()
                        .filter(e -> e.getDeliveryMethod().name().equals(delivery))
                        .collect(Collectors.toList());
            }

        }

        if (paymentMethod != null) {
            if (!paymentMethod.isEmpty()) {
                all = all.stream()
                        .filter(e -> e.getPaymentMethod().name().equals(paymentMethod))
                        .collect(Collectors.toList());
            }
        }


        if (paymentState != null) {
            if (!paymentState.isEmpty()) {
                all = all.stream()
                        .filter(e -> e.getPaymentStatus().name().equals(paymentState))
                        .collect(Collectors.toList());
            }
        }
        
        model.addAttribute("orders", all);
        return "admin/ordersList";
    }


    @GetMapping("/items")
    public String items(Model model) {
        model.addAttribute("items", itemRepository.findAll());
        return "admin/itemsList";
    }

    @GetMapping("/categories")
    public String categories(Model model) {
        model.addAttribute("categories", categoryRepository.findAll(Sort.by(Sort.Direction.ASC, "categoryOrder")));
        return "admin/categoriesList";
    }

    @GetMapping("/orderEdit")
    public String editOrder(@RequestParam long orderId, Model model) {

        Optional<Order> orderById = orderRepository.findById(orderId);
        if (orderById.isPresent()) {
            Order order = orderById.get();
            model.addAttribute("order", order);
            model.addAttribute("status", statusRepository.findAll());
            return "admin/order";
        }

        return "admin/ordersList";
    }

    @PostMapping("/orderEdit")
    public String editOrderForm(@ModelAttribute Order order, @RequestParam long orderId, @RequestParam(required = false) Integer time) {

        Optional<Order> orderById = orderRepository.findById(orderId);
        if (orderById.isPresent()) {
            Order oldOrder = orderById.get();
            oldOrder.setStatus(order.getStatus());

            if (order.getStatus().getId() == 2) {
                if (time == null) {
                    time = 30;
                }
                oldOrder.setOrderReady(LocalDateTime.now().plusMinutes(time));
            }
            orderRepository.save(oldOrder);

            return "redirect:/admin/orderEdit?orderId=" + orderId;
        }

        return "admin/ordersList";

    }

}