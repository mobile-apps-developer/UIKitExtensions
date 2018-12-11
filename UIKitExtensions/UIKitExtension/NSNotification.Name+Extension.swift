import Foundation

public extension NSNotification.Name {
    static func applicationLanguageChangeNotification() -> Self {
        return NSNotification.Name(rawValue: "com.deqode.didChangeApplicationLanguage")
    }
}
