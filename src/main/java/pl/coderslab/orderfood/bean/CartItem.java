package pl.coderslab.orderfood.bean;

import pl.coderslab.orderfood.entity.Item;

public class CartItem {

    private Item product;
    private int quantity;

    public CartItem(Item product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public Item getProduct() {
        return product;
    }

    public void setProduct(Item product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}