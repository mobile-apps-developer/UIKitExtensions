import UIKit

/// DQTabBarItem is custom class of UITabBarItem used for applying localisation on PPTabBarItem and UI twicks
@IBDesignable
open class DQTabBarItem: UITabBarItem, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable var localeTextKey: String? {
        didSet {
            updateText()
        }
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()

        updateText()
        observeLanguageChangeNotification()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    /// Updates text from the langauge file. Can be used for both OS level localization and application level
    @objc
    open func updateText() {
        title = localeTextKey?.localised
    }

    /// Observe the language change notification to update the text
    open func observeLanguageChangeNotification() {
        // addNotificationObserver(name: NotificationIdentifier.LANGUAGE_CHANGE, selector: #selector(updateText))
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
