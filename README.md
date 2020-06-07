# READ ME! czytajMnie ;)
## FoodApp (mniam)
### Work in progress

DEMO - https://foodappgra.herokuapp.com/
Admin: https://foodappgra.herokuapp.com/admin (admin/admin)

##### Important! Zdjecia produktów i logo może co jakis znikac. Jest to tym czasowe rozwiazanie. Serwer Heroku tak dziala.

Aplikacja do składania i przyjmowanie zamówień na jedzenie.
Projekt stworzony za pomocą Spring Boot.

# Instalacja
- uruchom endpoint /admin/createStatus
- w kontroloerze ItemController oraz ShopController podaj adres gdzie obrazy maja zostac zapisywane
- w appliaction.properties ustaw odpowiednio zmienna: spring.resources.static-locations

# Możliwości użytkowniak:
- przejrzenia produkty z listy kategorii
- dodanie do koszyka
- przejscie cały system zakupu(wybranie rodzaju płatności/dostawy)
- opłacenie zamowienia DotPay (testowe)

# Możliwości administratora:
- dodawanie kategorii
- dodawanie produktów do kategorii (możliwość dodania obrazka produktu)
- otrzymywanie zamówień
- edycja zamówień(możliwość ustawienia przyblizonej daty dostawy/gotowosci zamowienia od odbioru)