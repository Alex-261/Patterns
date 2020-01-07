// интерфейс Сотрудник (Coworker), определяет общий интерфейс
protocol Coworker {
    // функция найма, берет на вход объект типа Coworker
    func hire(coworker: Coworker)
    // функция отображения иерархии
    func getInfo()
    // переменная, обозначающая уровень менеджера, может только брать значения, не может присваивать
    var lvl: Int { get }
}

// простой компонент, класс Менеджер, расширяемый интерфейсом
// ветка, класс Менеджеров, который может нанимать других
class Manager: Coworker {
    // пустой массив, который должен хранить объекты типа Coworker
    private var coworkers = [Coworker]()
    //присвоение уровня сотрудникам
    var lvl: Int
    // определение уровня
    init(lvl: Int) {
        self.lvl = lvl
    }
    // функция добавления сотрудника  в массив
    func hire(coworker: Coworker) {
        self.coworkers.append(coworker)
    }
    // функция, которая выводит, сколько сотрудников находится в подчинении у менеджера, перебираются все сотрудники и выводятся
    func getInfo() {
        print(self.lvl.description + " level manager")
        for coworker in coworkers {
            coworker.getInfo()
        }
    }
    
}

// листья дерева, не может иметь сотрудников
class LowLevelManager: Coworker {
    // присвоение уровня
    var lvl: Int
    //
    init(lvl: Int) {
        self.lvl = lvl
    }
    
    // функция выводит, что менеджер не может нанимать сотрудникв
    func hire(coworker: Coworker) {
        
        print("can't hire")
    }
    // выводит уровень менеджера
    func getInfo() {
        print(self.lvl.description + " level manager")
    }
}
// инициализируем менеджеров
let topManager = Manager(lvl: 1)
let managerLvl2 = Manager(lvl: 2)

let managerLvl3_1 = Manager(lvl: 3)
let managerLvl3_2 = Manager(lvl: 3)

let managerLvl10 = Manager(lvl: 10)


// topManager по умолчанию нанят, он нанимает менеджера 2-го уровня
topManager.hire(coworker: managerLvl2)

// managerLvl2 нанимает двух менеджеров 3-го уровня
managerLvl2.hire(coworker: managerLvl3_1)
managerLvl2.hire(coworker: managerLvl3_2)

//managerLvl3_1 нанимает менеджера 10-го уровня
managerLvl3_1.hire(coworker: managerLvl10)

// вывод структуры
topManager.getInfo()


