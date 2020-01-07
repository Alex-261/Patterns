import UIKit
// базовый прототип Macbook
final class DefaultMacbook {
  private var configuration: [String]
// обычный инициализатор
  init() {
    let configurator = MacbookConfigurator()
    self.configuration = configurator.getDefaultConfig()
  }
// инициализатор прототипа
  init(object: DefaultMacbook) {
    self.configuration = object.configuration
  }
// функция клонирования, результатом которой будет объект из иерархии класса DefaultMacbook
  func clone() -> DefaultMacbook {
    return DefaultMacbook(object: self)
  }
}
// класс конфигурации Macbook
final class MacbookConfigurator {
    //функция возвращает конфигурации макбука
  func getDefaultConfig() -> [String] {
    return ["13 inch", "SSD 128GB", "RAM 8Gb"]
  }
}

let object = DefaultMacbook()
let clone = object.clone()
print(object === clone)

