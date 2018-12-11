import Foundation
import UIKit.UIApplication

@objc
public protocol DQTextLocalisable: class {
    @objc func updateText()
}

public extension DQTextLocalisable {
    /// Observe the language change notification to update the text
    func observeLanguageChangeNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateText),
            name: NSNotification.Name.applicationLanguageChangeNotification(),
            object: nil
        )
    }
}
