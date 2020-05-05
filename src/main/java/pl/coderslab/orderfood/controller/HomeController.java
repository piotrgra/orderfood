package pl.coderslab.orderfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import pl.coderslab.orderfood.bean.Cart;
import pl.coderslab.orderfood.bean.CartItem;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Item;
import pl.coderslab.orderfood.repository.CategoryRepository;
import pl.coderslab.orderfood.repository.ItemRepository;

import java.util.List;

@Controller
public class HomeController {
    private final ItemRepository itemRepository;
    private final CategoryRepository categoryRepository;
    private final Cart cart;

    public HomeController(ItemRepository itemRepository, CategoryRepository categoryRepository, Cart cart) {
        this.itemRepository = itemRepository;
        this.categoryRepository = categoryRepository;
        this.cart = cart;
    }

    @ModelAttribute("categories")
    public List<Category> categories() {
        return categoryRepository.findAll();
    }

    @ModelAttribute("allItems")
    public List<Item> items() {
        return itemRepository.findAll();
    }

    @ModelAttribute("cart")
    public List<CartItem> cartItems() {
        return cart.getCartItems();
    }

    @GetMapping("")
    public String home(Model model) {
        model.addAttribute("items", itemRepository.findAll());
        return "index";
    }

    @GetMapping("/menu/{id}")
    public String homeMenu(@PathVariable long id, Model model) {
        List<Item> items = itemRepository.findAllByCategoryId(id);
        model.addAttribute("items", items);
        return "index";
    }

    @GetMapping("addToCart/{id}/{quantity}")
    public String addToCart(@PathVariable long id, @PathVariable int quantity, Model model) {
        Item item = itemRepository.findById(id).get();

        cart.getCartItems().add(new CartItem(item, quantity));

        return "redirect:/";
    }

    @GetMapping("/cart")
    public String cart(Model model) {
        List<CartItem> cartItems = cart.getCartItems();
        double totalPrice = 0;

        for (CartItem cartItem : cartItems) {
            totalPrice += cartItem.getProduct().getPrice();
        }

        model.addAttribute("totalPrice", totalPrice);
        return "cart";
    }

}