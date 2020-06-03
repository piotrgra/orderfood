package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.orderfood.entity.ShopSetting;
import pl.coderslab.orderfood.repository.ShopRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/shopsetting")
public class ShopController {

    private final ShopRepository shopRepository;
    public static final String uploadsDir = "/home/piotr/CodersLab/uploads/";

    public ShopController(ShopRepository shopRepository) {
        this.shopRepository = shopRepository;
    }

    @GetMapping("")
    public String shopsetting(Model model) {
        List<ShopSetting> all = shopRepository.findAll();

        ShopSetting shopSetting;
        if (all.size() > 0) {
            shopSetting = all.get(0);
        } else {
            shopSetting = null;
        }

        model.addAttribute("shop", shopSetting);
        return "admin/shopsetting";
    }

    @GetMapping("/add")
    public String shopAdd(Model model) {

        model.addAttribute("shop", new ShopSetting());
        return "admin/shopsetting-form";
    }

    @PostMapping("/add")
    public String postShopAdd(@ModelAttribute ShopSetting shopSetting, BindingResult bindingResult, @RequestParam("file") MultipartFile file) throws IOException {

        if (file.isEmpty()) {

            return "admin/shopsetting-form";
        }


        if (!bindingResult.hasErrors()) {
            String realPathToUploads = uploadsDir;
            if (!new File(realPathToUploads).exists()) {
                new File(realPathToUploads).mkdir();
            }

            String orgName = file.getOriginalFilename();
            String filePath = realPathToUploads + orgName;
            File dest = new File(filePath);
            file.transferTo(dest);

            shopSetting.setLogo(orgName);

            shopRepository.save((shopSetting));

            return "redirect:/admin/shopsetting";

        } else {
            return "admin/shopsetting-form";
        }
    }

    @GetMapping("/update/{id}")
    public String updateItem(@PathVariable long id, Model model) {
        Optional<ShopSetting> item = shopRepository.findById(id);
        item.ifPresent(value -> model.addAttribute("shop", value));
        return "admin/shopsetting-form";
    }

}