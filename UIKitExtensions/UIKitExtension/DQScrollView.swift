import UIKit

open class DQScrollView: UIScrollView {
    // MARK: - Private variables

    private var refreshBlock: (() -> Void)?

    open override func awakeFromNib() {
        super.awakeFromNib()
    }

    @objc private func refreshData() {
        refreshBlock?()
    }

    // MARK: - Internal functions

    @objc
    open func endRefresh() {
        self.refreshControl?.endRefreshing()
    }

    /// Add pull to refresh method on table view with callback
    ///
    /// - Parameter block: Callback closure
    public func addPullToRefresh(with block: @escaping (() -> Void)) {
        refreshBlock = block

        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(
            self,
            action: #selector(refreshData),
            for: .valueChanged
        )

        self.refreshControl = refreshControl
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
