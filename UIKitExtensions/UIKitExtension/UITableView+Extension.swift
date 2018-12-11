import Foundation
import UIKit

public extension UITableView {
    /// Make a UItableViewCell height automatic based on the AutoLayouts used.
    /// - Parameter expectedHeight: Estimated height for the row
    @discardableResult
    func calculateCellHeight(estimatedHeight expectedHeight: CGFloat) -> UITableView {
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = expectedHeight
        return self
    }

    /// Hides extra rows created by UIKit with no data to display.
    @discardableResult
    func hideEmptyAndExtraRows() -> UITableView {
        tableFooterView = UIView()
        return self
    }
}
