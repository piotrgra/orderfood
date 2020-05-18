package pl.coderslab.orderfood.entity;

import org.hibernate.annotations.Cascade;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    private Status status;

    @OneToMany
    private List<OrderItem> orderItems;

    @OneToOne
    @Cascade(org.hibernate.annotations.CascadeType.ALL)
    private Customer customer;

    private LocalDateTime date;

    private LocalDateTime orderReady;

    @ManyToOne
    private DeliveryMethod deliveryMethod;

    @ManyToOne
    private PaymentMethod paymentMethod;

    private double totalPrice;

    public Order() {
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public LocalDateTime getDate() {
        return date;
    }

    @PrePersist
    public void setDate() {
        this.date = LocalDateTime.now();
    }


    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public DeliveryMethod getDeliveryMethod() {
        return deliveryMethod;
    }

    public void setDeliveryMethod(DeliveryMethod deliveryMethod) {
        this.deliveryMethod = deliveryMethod;
    }

    public PaymentMethod getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(PaymentMethod paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public LocalDateTime getOrderReady() {
        return orderReady;
    }

    public void setOrderReady(LocalDateTime orderReady) {
        this.orderReady = orderReady;
    }
}
