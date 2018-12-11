import UIKit

@IBDesignable
open class DQBarButtonItem: UIBarButtonItem, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable
    open var localeTextKey: String? {
        didSet {
            updateText()
        }
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
        guard let key = self.localeTextKey else {
            return
        }
        title = key.localised
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
