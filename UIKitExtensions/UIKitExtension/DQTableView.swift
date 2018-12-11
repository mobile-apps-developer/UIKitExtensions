import UIKit

/// DQTableView is custom class of UIViewController used for applying localisation on PPTableView and UI twicks
open class DQTableView: UITableView {
    // MARK: - Private variables

    private var refreshBlock: (() -> Void)?

    // MARK: - Init methods

    open override func awakeFromNib() {
        super.awakeFromNib()
        observeAppActiveNotification()
    }

    // MARK: - Private functions

    /// Observe when application becomes active from inactive state and reload the contennt.
    private func observeAppActiveNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(reloadData),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }

    @objc
    private func refreshData() {
        refreshBlock?()
    }

    // MARK: - Internal functions

    @objc func endRefresh() {
        self.refreshControl?.endRefreshing()
    }

    /// Add pull to refresh method on table view with callback
    ///
    /// - Parameter block: Callback closure
    func addPullToRefresh(with block: (() -> Void)?) {
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
