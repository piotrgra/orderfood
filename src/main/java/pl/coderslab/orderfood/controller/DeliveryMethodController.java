package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.entity.DeliveryMethod;
import pl.coderslab.orderfood.repository.DeliveryMethodRepository;

import javax.validation.Valid;
import java.util.Optional;

@Controller
@RequestMapping("/admin/deliveryMethod")
public class DeliveryMethodController {

    private final DeliveryMethodRepository deliveryMethodRepository;

    public DeliveryMethodController(DeliveryMethodRepository deliveryMethodRepository) {
        this.deliveryMethodRepository = deliveryMethodRepository;
    }


    @GetMapping("/add")
    public String addNewDeliveryMethod(Model model) {
        model.addAttribute("deliveryMethod", new DeliveryMethod());
        return "admin/deliveryMethod-form";
    }

    @PostMapping("/add")
    public String addNewDeliveryMethodForm(@Valid @ModelAttribute DeliveryMethod item, BindingResult bindingResult) {
        if (!bindingResult.hasErrors()) {
            deliveryMethodRepository.save(item);
            return "redirect:/admin/deliveriesMethod";

        } else {
            return "admin/deliveryMethod-form";
        }
    }

    @GetMapping("/update/{id}")
    public String updateDeliveryMethod(@PathVariable long id, Model model) {
        Optional<DeliveryMethod> item = deliveryMethodRepository.findById(id);
        item.ifPresent(value -> model.addAttribute("deliveryMethod", value));
        return "admin/deliveryMethod-form";
    }


}