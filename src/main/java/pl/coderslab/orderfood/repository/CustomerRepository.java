package pl.coderslab.orderfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.orderfood.entity.Category;
import pl.coderslab.orderfood.entity.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
