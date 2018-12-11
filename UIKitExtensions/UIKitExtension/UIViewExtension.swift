import Foundation
import UIKit

public extension UIView {
    // MARK: - Properties

    @IBInspectable
    var borderRadius: CGFloat {
        get {
            return layer.cornerRadius
        }

        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }

        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let viewBorderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: viewBorderColor)
        }

        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    var xOrigin: CGFloat {
        get {
            return frame.origin.x
        }

        set {
            frame.origin.x = newValue
        }
    }

    var yOrigin: CGFloat {
        get {
            return frame.origin.y
        }

        set {
            frame.origin.y = newValue
        }
    }

    var widthValue: CGFloat {
        get {
            return frame.size.width
        }

        set {
            DispatchQueue.main.async { [weak self] in
                self?.frame.size.width = newValue
            }
        }
    }

    var heightValue: CGFloat {
        get {
            return frame.size.height
        }

        set {
            DispatchQueue.main.async { [weak self] in
                self?.frame.size.height = newValue
            }
        }
    }

    // MARK: - Functions

    func round(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let mask = CAShapeLayer()

        mask.path = path.cgPath
        layer.mask = mask
    }

    class func loadFromXIB(xibName: String) -> UIView {
        guard let xibView = Bundle.main.loadNibNamed(
            xibName,
            owner: nil,
            options: nil
        )?.first as? UIView else { fatalError("Could not load view from XIB") }
        return xibView
    }

    /// Transforms a UIView to rotate with 90 degreees with clock wise
    func rotateClockWiseWith_90_Degrees() {
        transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
    }

    /// Transforms a UIView to rotate with 180 degreees with clock wise
    func rotateClockWiseWith_180_Degrees() {
        transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }

    /// Removes all applied transformations on the UIView by applying `identity` transform on the instance
    func removeAllAppliedTransformations() {
        transform = .identity
    }

    func addShadow(
        cornerRadius: CGFloat,
        withBorder: Bool,
        offset: CGSize,
        shadowRadius: CGFloat,
        shadowColor: CGColor,
        shadowOpacity: Float
    ) {
        layer.cornerRadius = cornerRadius

        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = withBorder ? 1 : 0

        layer.shadowColor = shadowColor
        layer.shadowOffset = offset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
