import UIKit
/// DQCollectionView is custom class of UICollectionView used for applying localisation
open class DQCollectionView: UICollectionView {
    private var refreshBlock: (() -> Void)?

    open override func awakeFromNib() {
        super.awakeFromNib()
    }

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

    @objc
    private func refreshData() {
        refreshBlock?()
    }

    @objc
    func endRefresh() {
        self.refreshControl?.endRefreshing()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
