import UIKit

/// DQLabel is custom class of UILabel used for applying localisation on PPLabel and UI twicks
@IBDesignable
open class DQLabel: UILabel, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable
    open var localeTextKey: String? {
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
        observeLanguageChangeNotification()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Updates text from the langauge file. Can be used for both OS level localization and application level
    @objc
    open func updateText() {
        guard let key = self.localeTextKey else { return }
        text = key.localised
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
