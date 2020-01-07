// магазины продуктов по категориям
class FruitShop {
    // функция купить фрукты, возвращает строку
    func buyFruits() -> String {
        return "fruits"
    }
}

class MeatShop {
    // функция купить мясо, возвращает строку
    func buyMeat() -> String {
        return "meat"
    }
}

class MilkShop {
    // функция купить молоко, возвращает строку
    func buyMilk() -> String {
        return "milk"
    }
}

class SweetShop {
    // функция купить конфеты, возвращает строку
    func buySweets() -> String {
        return "sweets"
    }
}

class BreadShop {
    // функция купить хлеб, возвращает строку
    func buyBread() -> String {
        return "bread"
    }
}

// Facade, все действия сводятся к одному, все действия будут прятаться в методе buyProducts()
class Supermarket {
    // создаем экземпляры каждого класса
    private let fruitShop = FruitShop()
    private let meatShop = MeatShop()
    private let milkShop = MilkShop()
    private let sweetShop = SweetShop()
    private let breadShop = BreadShop()
    
    // функция покупки продуктов
    func buyProducts() -> String {
        var products = ""
        products += fruitShop.buyFruits() + ", "
        products += meatShop.buyMeat() + ", "
        products += milkShop.buyMilk() + ", "
        products += sweetShop.buySweets() + ", "
        products += breadShop.buyBread()
        return "I bought: " + products
    }
}
// создаем объект типа супермаркет и вызываем метод buyProducts()
let sm = Supermarket()
print(sm.buyProducts())












