import UIKit

/// DQTextField is custom class of UITextField used for applying localisation on PPTextField and UI twicks
@IBDesignable
open class DQTextField: UITextField, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable
    var localeTextKey: String? {
        didSet {
            updateText()
        }
    }

    @IBInspectable
    public var placeHOlderColor: UIColor = .black {
        didSet {
            setPlaceholderTextColor()
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
        observeLanguageChangeNotification()
        setPlaceholderTextColor()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setPlaceholderTextColor()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setPlaceholderTextColor()
    }

    /// Updates text from the langauge file. Can be used for both OS level localization and application level
    @objc
    open func updateText() {
        guard let key = self.localeTextKey else { return }
        placeholder = key.localised
    }

    private func setPlaceholderTextColor() {
        if let placehoderText = self.placeholder {
            attributedPlaceholder = NSAttributedString(
                string: placehoderText,
                attributes: [.foregroundColor: UIColor.black]
            )
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
