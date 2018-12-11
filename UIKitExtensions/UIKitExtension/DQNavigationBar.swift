import UIKit

/// DQNavigationBar is custom class of UINavigationBar used for applying customisation on navigation bar and UI twicks
open class DQNavigationBar: UINavigationBar {
    open override func awakeFromNib() {
        super.awakeFromNib()
        customize()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customize()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        customize()
    }

    /// Used to apply UI customisation
    open func customize() {
        barStyle = .default

        // Remove default back button of iOS navigation bar
        backIndicatorImage = UIImage()
        backIndicatorTransitionMaskImage = UIImage()

        // Set tint color of back button
        tintColor = .black
        barTintColor = .white
        backgroundColor = .white

        shadowImage = nil

        // Customize font and color of navigation bar title text
        titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.font(style: .medium, size: 16.0)
        ]
    }
}
