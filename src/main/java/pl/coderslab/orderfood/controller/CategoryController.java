package pl.coderslab.orderfood.controller;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.repository.CategoryRepository;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {

    private final CategoryRepository categoryRepository;

    public CategoryController(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @ModelAttribute("categories2")
    public List<Category> categories() {
        return categoryRepository.findAll(Sort.by(Sort.Direction.DESC, "categoryOrder"));
    }

    @GetMapping("/add")
    public String add(Model model) {
        model.addAttribute("category", new Category());

        return "admin/category-form";
    }

    @PostMapping("/add")
    public String processForm(@Valid @ModelAttribute Category category, BindingResult bindingResult) {

        if (!bindingResult.hasErrors()) {
            category.setCategoryOrder(categories().size() + 1);
            categoryRepository.save(category);
            return "redirect:/admin/categories";
        } else {
            return "admin/category-form";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable long id) {
        Optional<Category> category = categoryRepository.findById(id);
        category.ifPresent(categoryRepository::delete);
        return "redirect:/admin/categories";
    }

    @GetMapping("/update/{id}")
    public String updateCategory(@PathVariable long id, Model model) {
        Optional<Category> category = categoryRepository.findById(id);
        category.ifPresent(value -> model.addAttribute("category", value));
        return "admin/category-form";
    }

    @GetMapping("/up")
    public String upOrder(@RequestParam int categoryOrder) {
        if (categoryOrder > 1) {
            Category c1 = categoryRepository.findByCategoryOrder(categoryOrder - 1);
            Category c2 = categoryRepository.findByCategoryOrder(categoryOrder);

            c2.setCategoryOrder(categoryOrder - 1);
            c1.setCategoryOrder(categoryOrder);

            categoryRepository.save(c1);
            categoryRepository.save(c2);
        }

        return "redirect:/admin/categories";
    }

    @GetMapping("/down")
    public String downOrder(@RequestParam int categoryOrder) {
        if (categoryOrder < categoryRepository.findAll().size()) {
            Category c1 = categoryRepository.findByCategoryOrder(categoryOrder + 1);
            Category c2 = categoryRepository.findByCategoryOrder(categoryOrder);

            c2.setCategoryOrder(categoryOrder + 1);
            c1.setCategoryOrder(categoryOrder);

            categoryRepository.save(c1);
            categoryRepository.save(c2);
        }

        return "redirect:/admin/categories";
    }

}
