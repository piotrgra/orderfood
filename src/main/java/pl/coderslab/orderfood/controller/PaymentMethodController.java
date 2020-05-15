package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.entity.PaymentMethod;
import pl.coderslab.orderfood.repository.PaymentMethodRepository;

import java.util.Optional;

@Controller
@RequestMapping("/admin/paymentMethod")
public class PaymentMethodController {

    private final PaymentMethodRepository paymentMethodRepository;

    public PaymentMethodController(PaymentMethodRepository paymentMethodRepository) {
        this.paymentMethodRepository = paymentMethodRepository;
    }


    @GetMapping("/add")
    public String addNewPaymentMethod(Model model) {
        model.addAttribute("paymentMethod", new PaymentMethod());
        return "admin/paymentMethod-form";
    }

    @PostMapping("/add")
    public String addNewPaymentMethodForm(@ModelAttribute PaymentMethod item) {
        paymentMethodRepository.save(item);
        return "redirect:/admin/paymentsMethod";
    }

    @GetMapping("/update/{id}")
    public String updateDeliveryMethod(@PathVariable long id, Model model) {
        Optional<PaymentMethod> item = paymentMethodRepository.findById(id);
        item.ifPresent(value -> model.addAttribute("paymentMethod", value));
        return "admin/paymentMethod-form";
    }


}