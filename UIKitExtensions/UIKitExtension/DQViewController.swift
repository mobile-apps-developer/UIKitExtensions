import UIKit

/// DQViewController is custom class for UIViewController used for applying localisation on PPViewController and UI twicks
open class DQViewController: UIViewController, DQTextLocalisable {
    /// JSON key which sets value of `textKey` property. Can be set form InterfaceBuilder(Storybaords/Xibs).
    @IBInspectable var localeTextKey: String? {
        didSet {
            self.updateText()
        }
    }

    // MARK: - View Cycle Method

    open override func viewDidLoad() {
        super.viewDidLoad()
        observeLanguageChangeNotification()
        updateText()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.shadowImage = #imageLiteral(resourceName: "Line")
    }

    // MARK: - Helper Method

    /// Updates text from the langauge file. Can be used for both OS level localization and application level
    @objc open func updateText() {
        guard let key = self.localeTextKey else {
            return
        }
        navigationItem.title = key.localised
        navigationItem.titleView = nil
    }

    func tabBar(shouldHide: Bool) {
        tabBarController?.tabBar.isHidden = shouldHide
        view.layoutSubviews()
    }

    /// Used to setup navigation
    open func setupNavigation() {}

    func closeMenu() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    /// Used to remove the shadow Image for navigation bar
    func removeNavbarBottomShadowImage() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
