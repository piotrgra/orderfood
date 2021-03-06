package pl.coderslab.orderfood.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pl.coderslab.orderfood.entity.ShopSetting;

@Repository
public interface ShopRepository extends JpaRepository<ShopSetting, Long> {
}
