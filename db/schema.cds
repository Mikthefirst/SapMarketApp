namespace my.product.store;
using { Country, cuid, managed} from '@sap/cds/common';

//enums
type Roles : String enum {
    USER = 'USER'; 
    ADMIN = 'ADMIN'; 
    MANAGER = 'MANAGER'
}

type OrderStatus : String enum{
    NEW='NEW';
    CONFIRMED='CONFIRMED';
    CANCELLED='CANCELLED';
};


entity Products {
  key ID: UUID;
  name      : String(100);
  price     : Decimal(10,2);
  stock     : Integer;
  category  : Association to Category;
  country   : Country;
}

entity Category: cuid {
    name    :String(100);
    products : Association to many Products on products.category = $self;
}

// Пользователи
entity Users: managed {
  key ID    :UUID;
  name      : String(100);
  email     : String(100) @assert.format: 'email';
  role      : Roles;
}

// Заказы
entity Orders: cuid, managed {
  user      : Association to Users;
  items     : Composition of many OrderItems on items.order = $self;
  status    : OrderStatus default 'NEW';
  total     : Decimal(10,2) @readonly;
}

// Элементы заказа
entity OrderItems: cuid {
  order     : Association to Orders;
  product   : Association to Products;
  quantity  : Integer;
}