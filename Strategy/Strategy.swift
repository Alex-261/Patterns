import UIKit

//создаем конечный класс Фильтр
final class Filter {
  var filterStrategy: FilterStrategy?
//Функция, которую мы будем переопределять, возвращает объект типа UIImage (любой)
  func applyFilter(to image: UIImage) {
    filterStrategy?.process(image: image)
  }
}
//интерфейс Стратегии
protocol FilterStrategy {
    //функция, которая принимает на вход объект UIImage, возвращает объект типа UIImage
  func process(image: UIImage) -> UIImage
}
//класс фильтра Сепия, расширяется (наследуется) интерфейсом FilterStrategy
final class SepiaFilter: FilterStrategy {
    //переопределение функции
  func process(image: UIImage) -> UIImage {
    print("Apply SEPIA filter to image")
    return image
  }
}
//класс фильтра BW, расширяется (наследуется) интерфейсом FilterStrategy
final class BWFilter: FilterStrategy {
    //переопределение функции
  func process(image: UIImage) -> UIImage {
    print("Apply B&W filter to image")
    return image
  }
}
//класс фильтра Distortion, расширяется (наследуется) интерфейсом FilterStrategy
final class DistortionFilter: FilterStrategy {
  func process(image: UIImage) -> UIImage {
    print("Apply DISTORTION filter to image")
    return image
  }
}
// создаем два объекта, объект типа Filter и типа UIImage
let filter = Filter()
let image = UIImage()

//выбор стратегии, вывод зависит от выбранной стратегии
filter.filterStrategy = SepiaFilter()
filter.applyFilter(to: image)

filter.filterStrategy = BWFilter()
filter.applyFilter(to: image)

filter.filterStrategy = DistortionFilter()
filter.applyFilter(to: image)

