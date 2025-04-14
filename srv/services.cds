using { my.product.store as my } from '../db/schema';


service ProcessorService { 
    entity Products as projection on my.Products
    actions {
      // Действие для пополнения запасов
      action restock(quantity: Integer) returns Products;
    };

    entity Categories as projection on my.Category;
    
    

    entity Users as projection on my.Users;
}

/**
 * Service used by administrators to manage customers and .
 */
service AdminService {
    entity Users as projection on my.Users;
    entity Products as projection on my.Products;
    entity Orders as projection on my.Orders;
}
