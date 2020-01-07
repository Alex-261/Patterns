import UIKit
// протокол Темы, имеет свойства цвет фона и цвет текста, эти значения можно только получить
protocol ThemeProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}
// класс-наследник
class Theme: ThemeProtocol {
    var backgroundColor: UIColor
    var textColor: UIColor
    // инициализатор, принимает на вход цвет фона и цвет текста
    init(backgroundColor: UIColor, textColor: UIColor) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
}
// протокол-строитель Темы, который будет инициализировать темы
protocol ThemeBuilderProtocol {
    func setBackground(color: UIColor)
    func setText(color: UIColor)
    // создание темы, по умолчанию возвращает тип ThemeProtocol
    func createTheme() -> ThemeProtocol?
}
// класс-строитель, расширяемый протоколом ThemeBuilderProtocol
class ThemeBuilder: ThemeBuilderProtocol {
    // инициализация приватных (нигде, кроме внутри класса, не используются) свойств, ? означает, что инициализация необязательна (опциональные переменные)
    private var backgroundColor: UIColor?
    private var textColor: UIColor?
    
    // присваиваем заданные выше свойства
    func setBackground(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setText(color: UIColor) {
        self.textColor = color
    }
    // узнаем, чему равны заданные свойства, извлекаем значения, если не получается, возвращается nil (то же самое, что и  null) или возвращаем заданные значения
    func createTheme() -> ThemeProtocol? {
        guard let backgroundColor = backgroundColor, let textColor = textColor else { return nil }
        
        return Theme(backgroundColor: backgroundColor, textColor: textColor)
    }
}
// инициализируем Builder
let builder = ThemeBuilder()
// задаем цвета
builder.setText(color: .white)
builder.setBackground(color: .black)
// создаем тему
let theme = builder.createTheme()




