package pl.coderslab.orderfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.orderfood.entity.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {
}
