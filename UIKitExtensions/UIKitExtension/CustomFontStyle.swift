/// Enum to manage fonts style in app
enum CustomFontStyle {
    case black
    case bold
    case extrabold
    case light
    case medium
    case regular
    case thin

    /// Name of the font required by iOS to create the font
    var fontName: String {
        switch self {
        case .black:
            return "Heebo-Black"

        case .bold:
            return "Heebo-Bold"

        case .extrabold:
            return "Heebo-ExtraBold"

        case .light:
            return "Heebo-Light"

        case .medium:
            return "Heebo-Medium"

        case .regular:
            return "Heebo-Regular"

        case .thin:
            return "Heebo-Thin"
        }
    }
}
