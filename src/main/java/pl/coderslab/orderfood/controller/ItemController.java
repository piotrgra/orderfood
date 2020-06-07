package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pl.coderslab.orderfood.enmu.ItemState;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Item;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/item")
public class ItemController {

    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    public static final String uploadsDir = "/app/";

    public ItemController(ItemRepository itemRepository, CategoryRepository categoryRepository) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("items")
    public List<Item> items() {
        return itemRepository.findAll();
    }

    @GetMapping("/add")
    public String addNewItem(Model model) {
        model.addAttribute("item", new Item());
        return "admin/item-form";
    }

    @PostMapping("/add")
    public String addNewItemForm(@Valid @ModelAttribute Item item, BindingResult bindingResult, @RequestParam("file") MultipartFile file) throws IOException {

        if (file.isEmpty()) {

            return "admin/item-form";
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

            item.setImage(orgName);
            item.setState(ItemState.ACTIVE);

            itemRepository.save(item);
            return "redirect:/admin/items";

        } else {
            return "admin/item-form";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteItem(@PathVariable long id) {
        Optional<Item> item = itemRepository.findById(id);
        item.ifPresent(itemRepository::delete);
        return "redirect:/admin/items";
    }

    @GetMapping("/update/{id}")
    public String updateItem(@PathVariable long id, Model model) {
        Optional<Item> item = itemRepository.findById(id);
        item.ifPresent(value -> model.addAttribute("item", value));
        return "admin/item-form";
    }


}