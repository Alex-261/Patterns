import UIKit
//интерфейс Кофе
protocol Coffee {
    // функции Стоимость и ингредиенты
  func cost() -> Double
  func ingredients() -> String
}
// класс Эспрессо, расширяемый протоколом Кофе
final class Espresso: Coffee {
    // переопределяем методы
  func ingredients() -> String {
    return "Espresso"
  }
// возвращает стоимость Espresso
  func cost() -> Double {
    return 100
  }
}
// класс-декоратор, расширяемый протоколом Кофе
class CoffeDecorator: Coffee {
    //инициализируем приватную переменную кофе
  private var сoffee: Coffee
// инициализатор кофе
  init(сoffee: Coffee) {
    self.сoffee = сoffee
  }
// возвращает состав кофе
  func ingredients() -> String {
    return сoffee.ingredients()
  }
// возвращает стоимость кофе
  func cost() -> Double {
    return сoffee.cost()
  }
}
// класс Молоко, наследуемый от класса-декоратора
final class Milk: CoffeDecorator {
    // перегрузка функции ингредиенты, к ингредиентам добавляется молоко, возвращает строку + ", Milk"
  override func ingredients() -> String {
    return super.ingredients() + ", Milk"
  }
// перегрузка метода стоимость, возвращает базовую стоимость и + 20
  override func cost() -> Double {
    return super.cost() + 20
  }
}
// класс Сливки, наследуемый от декоратора
final class Whip: CoffeDecorator {
    // перегрузка функции, к ингредиентам добавляются сливки, возвращает строку + ", Whip"
  override func ingredients() -> String {
    return super.ingredients() + ", Whip"
  }
// перегрузка метода стоимость, возвращает базовую стоимость и + 30
  override func cost() -> Double {
    return super.cost() + 30
  }
}
// класс Шоколад, наследуемый от класса-декоратора
final class Chocolate: CoffeDecorator {
     // перегрузка функции, к ингредиентам добавляется шоколад, возвращает строку + ", Chocolate"
  override func ingredients() -> String {
    return super.ingredients() + ", Chocolate"
  }
// перегрузка метода стоимость, возвращает базовую стоимость и + 50
  override func cost() -> Double {
    return super.cost() + 50
  }
}
// инициализиуем переменные эспрессо, капучино и и капучино с шоколадом
let espresso = Espresso()
let capuccino = Whip(сoffee: Milk(сoffee: espresso))
let capuccinoWithChocolate = Chocolate(сoffee: capuccino)

// вывод состава и стоимости эспрессо
print(espresso.ingredients())
print(espresso.cost())

// вывод состава и стоимости капучино
print(capuccino.ingredients())
print(capuccino.cost())

// вывод состава и стоимости капучино с шоколадом
print(capuccinoWithChocolate.ingredients())
print(capuccinoWithChocolate.cost())

