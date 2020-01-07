protocol Eating {
    func cookingFood()
    func cleaningTeeth()
    func sitAtATable()
    func eating()
    func washingDishes()
    func haveEating()

}

extension Eating {
    //шаблонный метод
    func haveEating() {
        cookingFood()
        sitAtATable()
        eating()
    }
    
// методы необходимо перегрузить, чтобы их использовать
    func cookingFood() {
       preconditionFailure("Override me")
    }
    
    func cleaningTeeth() {
        
    }
    // задается значение по умолчанию
    func sitAtATable() {
        print("sitting at the table before eating")
    }

    func eating() {
        preconditionFailure("Override me")
    }

    func washingDishes() {
        
    }

}


class Breakfast: Eating {
    
    func cookingFood() {
       print("cooking a breakfast")
        cleaningTeeth()
    }
    
    func cleaningTeeth() {
         print("clean your teeth before the breakfast")
     }
  
    func eating() {
        print("eating your breakfast")
    }

}

class Dinner: Eating {
      func cookingFood() {
         print("cooking a dinner")    }
    
      func eating() {
          print("eating your dinner")
      }

    
}

class Supper: Eating {
      func cookingFood() {
         print("cooking a supper")    }
    
      func eating() {
          print("eating your supper")
        washingDishes()
        
      }
    func washingDishes() {
        print("taking all dishes into the washing machine")
    }

}

let breakfast = Breakfast()
let supper = Supper()

breakfast.haveEating()
print("________")
print("________")
var dinner = Dinner()
dinner.haveEating()
print("________")
print("________")
supper.haveEating()

