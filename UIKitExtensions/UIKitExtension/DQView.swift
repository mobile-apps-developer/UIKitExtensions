import UIKit

@IBDesignable
open class DQView: UIView {
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = borderRadius
    }
}
