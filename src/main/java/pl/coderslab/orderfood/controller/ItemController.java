package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Item;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/item")
public class ItemController {

    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;

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
    public String addNewItemForm(@ModelAttribute Item item) {
        itemRepository.save(item);
        return "redirect:/admin/items";
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