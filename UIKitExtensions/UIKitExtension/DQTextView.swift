import UIKit

/// DQTextView is custom class of GrowingTextView (TextView) used for applying localisation and UI twicks
open class DQTextView: UITextView, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable var localeTextKey: String? {
        didSet {
            updateText()
        }
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = borderRadius
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        updateText()
    }

    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Updates text from the langauge file. Can be used for both OS level localization and application level
    @objc
    open func updateText() {}

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
