import UIKit
/// DQShadowView is custom class of UIView used for applying UI twicks
open class DQShadowView: DQView {
    @IBInspectable
    open var bgColor: UIColor = .white {
        didSet { backgroundColor = bgColor }
    }

    @IBInspectable
    open var allowBorderWith: Bool = false {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable
    open var shadowRadius: CGFloat = CGFloat.nan {
        didSet {
            layer.cornerRadius = borderRadius
        }
    }

    @IBInspectable
    open var shadowOpacity: Float = Float.nan {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }

    @IBInspectable
    open var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable
    open var shadowOffSetHeight: CGFloat = CGFloat.nan {
        didSet {
            layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        }
    }

    @IBInspectable
    open var shadowOffSetWidth: CGFloat = CGFloat.nan {
        didSet {
            self.layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        }
    }

    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

        layer.cornerRadius = borderRadius

        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth

        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = bgColor
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.01) { [weak self] in
            guard let self = self else { return }
            self.addShadow(
                cornerRadius: self.borderRadius,
                withBorder: self.allowBorderWith,
                offset: CGSize(width: self.shadowOffSetWidth, height: self.shadowOffSetHeight),
                shadowRadius: self.shadowRadius,
                shadowColor: self.shadowColor.cgColor,
                shadowOpacity: self.shadowOpacity
            )
        }
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = bgColor
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = bgColor
    }
}
