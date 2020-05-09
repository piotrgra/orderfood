package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Item;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;

    public AdminController(ItemRepository itemRepository, CategoryRepository categoryRepository) {
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


    @GetMapping("/items")
    public String listOfItems() {
        return "/admin/dashboard";
    }

    @GetMapping("")
    public String dashboard() {
        return "redirect:/admin/items";
    }


}