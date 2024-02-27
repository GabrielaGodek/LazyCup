-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: localhost    Database: lazycoffees
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ingredients` varchar(255) DEFAULT NULL,
  `proportions` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL,
  `salePrice` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Black Coffee','Black coffee is as simple as it gets, with ground coffee beans steeped in hot water, served hot. And if you want to sound fancy, you can call black coffee by its proper name: café noir.','Espresso, Hot water','1 part espresso to 1 part hot water','https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',8,6),(2,'Latte','As the most popular coffee drink out there, latte consists of a shot of espresso and steamed milk with just a touch of foam. It can be ordered plain or flavored, ranging from vanilla to pumpkin spice.','Espresso, Steamed milk','1 part espresso to 3 parts steamed milk','https://images.unsplash.com/photo-1561882468-9110e03e0f78?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGxhdHRlfGVufDB8fDB8fHww',16,0),(3,'Caramel Latte','If you enjoy latte with a special flavor, caramel latte might be the best option to give you an experience of natural sweetness and creaminess of steamed milk and caramel.','Espresso, Steamed milk, Caramel syrup','1 part espresso to 3 parts steamed milk, with caramel syrup','https://images.unsplash.com/photo-1599398054066-846f28917f38?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',20,0),(4,'Cappuccino','Cappuccino is a latte made with more foam than steamed milk, often topped with a sprinkle of cocoa powder or cinnamon. Sometimes, you can find variations using cream instead of milk or those that add flavorings too.','Espresso, Steamed milk, Foam','1 part espresso to 1 part steamed milk, with foam','https://images.unsplash.com/photo-1557006021-b85faa2bc5e2?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',14,0),(5,'Americano','With a similar taste to black coffee, americano consists of a shot of espresso diluted with hot water.','Espresso, Hot Water','1 part espresso to 2-3 parts hot water','https://images.unsplash.com/photo-1532004491497-ba35c367d634?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',10,8),(6,'Espresso','An espresso shot can be served alone or used as a base for most coffee drinks, such as lattes and macchiatos.','Espresso','N/A','https://images.unsplash.com/photo-1579992357154-faf4bde95b3d?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',8,6),(7,'Macchiato','Macchiato is another espresso-based drink that has a small amount of foam on top. It\'s the happy medium between a cappuccino and a doppio.','Espresso, Foam','1 part espresso to 1 part foam','https://images.unsplash.com/photo-1557772611-722dabe20327?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',20,0),(8,'Mocha','For all the chocolate lovers out there, you\'ll fall in love with a mocha. Mocha is a chocolate espresso drink with steamed milk and foam.','Espresso, Steamed milk, Chocolate','1 part espresso to 1 part steamed milk, with chocolate','https://images.unsplash.com/photo-1607260550778-aa9d29444ce1?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',20,12),(9,'Hot Chocolate','During cold winter days, a cup of hot chocolate makes you feel cozy and happy. It also makes you feel good as it contains energizing caffeine.','Chocolate, Milk','N/A','https://images.unsplash.com/photo-1542990253-0d0f5be5f0ed?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDh8fGhvdCUyMGNob2NvbGF0ZXxlbnwwfHwwfHx8MA%3D%3D',15,0),(10,'Chai Latte','If you\'re looking for a flavorful hot drink in the midst of winter, opt for chai latte. The combination of cardamom and cinnamon offers a wonderful taste.','Tea, Milk, Ginger, Cardamom, Cinnamon','N/A','https://images.unsplash.com/photo-1578899952107-9c390f1af1b7?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNoYWklMjBsYXR0ZXxlbnwwfHwwfHx8MA%3D%3D',18,0),(11,'Matcha Latte','Matcha latte is a green, healthy coffee drink made with finely ground matcha tea and milk, offering mild sweetness, a unique flavor, and a gentle caffeine kick.','Matcha Powder, Milk, Sugar','N/A','https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWF0Y2hhJTIwbGF0dGV8ZW58MHx8MHx8fDA%3D',20,0),(12,'Seasonal Brew','Seasonal coffee with various flavor notes like caramel, fruit, and chocolate','Coffee','N/A','https://images.unsplash.com/photo-1611162458324-aae1eb4129a4?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg1fHxibGFjayUyMGNvZmZlZXxlbnwwfHwwfHx8MA%3D%3D',25,22),(13,'Black Tea','Black tea originated in China. It is made from leaves of a plant called Camellia and can be flavored differently with fruits for example. A nice, warm, flavorful, and aromatic drink suitable for everyday.','Tea','N/A','https://images.unsplash.com/photo-1576092768241-dec231879fc3?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHRlYXxlbnwwfHwwfHx8MA%3D%3D',8,0),(14,'Iced Latte','Iced latte is a chilled coffee drink made by mixing espresso and cold milk. It\'s served with ice cubes and is also known as café latte iced or latte on the rocks.','Espresso, Milk, Ice, Syrup','1 part espresso to 3 parts steamed milk, ice and syrup','https://images.unsplash.com/photo-1517701550927-30cf4ba1dba5?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aWNlZCUyMGxhdHRlfGVufDB8fDB8fHww',20,0),(15,'Iced Mocha Latte','Iced mocha latte is a combination of latte and mocha, which itself is a combination of chocolate and coffee. It gives cold beverage lovers a delightful experience of chocolate and coffee.','Espresso, Ice, Milk, Chocolate','1 part espresso to 3 parts steamed milk, ice and chocolate','https://images.unsplash.com/photo-1642647391072-6a2416f048e5?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzh8fGljZWQlMjBtb2NoYSUyMGxhdHRlfGVufDB8fDB8fHww',20,18),(16,'Frapino Caramel','It\'s a blended or rather shaken coffee with whipped cream on top. A must-have for hot summer days.','Espresso, Ice, Milk, Caramel Syrup, Whipped Cream, Caramel Sauce','1 part espresso to 3 parts cold milk, ice, caramel syrup, whipped cream','https://images.unsplash.com/photo-1662047102608-a6f2e492411f?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJhcGlubyUyMGNhcmFtZWx8ZW58MHx8MHx8fDA%3D',22,0),(17,'Frapino Mocha','Another famous and delicious cold drink for those who prefer chocolate. Imagine the taste of a chocolate shake with whipped cream on top.','Espresso, Ice, Milk, Cocoa, Whipped Cream','1 part espresso to 3 parts cold milk, ice, caramel syrup, cocoa, whipped cream','https://images.unsplash.com/photo-1530373239216-42518e6b4063?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZnJhcGlubyUyMG1vY2hhfGVufDB8fDB8fHww',20,0),(18,'Orange Juice','We have nothing to say about our freshly squeezed orange juice. You have to try it yourself.','Fresh Oranges, Ice','N/A','https://images.unsplash.com/photo-1600271886742-f049cd451bba?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NzF8fG9yYW5nZSUyMGp1aWNlfGVufDB8fDB8fHww',12,6),(19,'Frozen Lemonade','Frozen lemonade is a refreshing summer drink that combines freshly squeezed lemon juice, ice, and sweetener into a cooling, tangy, and sweet-sour sensation.','Lemon Juice, Ice, Sugar','N/A','https://images.unsplash.com/photo-1523371054106-bbf80586c38c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGxlbW9uYWRlJTIwd2l0aCUyMGljZXxlbnwwfHwwfHx8MA%3D%3D',10,0),(20,'Lemonade','Initially famous in Paris and then became very popular throughout Europe. This sweet, colorless, carbonated drink is made by mixing lemon juice and carbonated water.','Lemon Juice, Carbonated Water, Honey','N/A','https://images.unsplash.com/photo-1621263764928-df1444c5e859?auto=format&fit=crop&q=60&w=800&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGVtb25hZGV8ZW58MHx8MHx8fDA%3D',10,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-27  9:43:27
