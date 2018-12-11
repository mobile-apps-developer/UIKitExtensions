import UIKit

extension UIFont {

    /// Create font with the specified style
    /// - Parameters:
    ///   - style: style to apply e.g. .medium, .regular
    ///   - size: Size of the font
    class func font(style: CustomFontStyle, size: CGFloat) -> UIFont {
        guard let heeboFont = UIFont(name: style.fontName, size: size) else {
            fatalError("Could not create font")
        }
        return heeboFont
    }
}
