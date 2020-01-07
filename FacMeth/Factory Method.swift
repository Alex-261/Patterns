//протокол (интерфейс) мебели
protocol Furniture {
    func use()
}

class Table: Furniture {
    func use() {
        print("sitting at the table")
    }
}

class Sofa: Furniture {
    func use() {
        print("laying on the sofa")
    }
}

// интерфейс Фабрики
protocol FurnitureFactory {
    func create() -> Furniture
    func sale() -> Furniture
}

// класс TableFactory, расширяемый протоколом (интерфейсом) FurnitureFactory
class TableFactory: FurnitureFactory {
    func create() -> Furniture {
        print("a table is created")
        return Table()
    }
    func sale() -> Furniture {
        print("a table is saled")
        return Table()
    }
}
// класс SofaFactory, расширяемый протоколом (интерфейсом) FurnitureFactory
class SofaFactory: FurnitureFactory {
    func create() -> Furniture {
        print("sofa is created")
        return Sofa()
    }
    func sale() -> Furniture {
          print("a sofa is saled")
          return Sofa()
      }
}

// создаем объекты фабрик
var tableFactory = TableFactory()
var sofaFactory = SofaFactory()

// создаем объекты мебели
var table = tableFactory.create()
var sofa = sofaFactory.create()

table.use()
sofa.use()
