package pl.coderslab.orderfood.repository;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.orderfood.entity.Order;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    List<Order> findAllByStatusId(long id, Sort sort);

    List<Order> findAllByCustomer_FirstNameContainingOrCustomer_LastNameContaining(String name, String name2, Sort sort);

}
