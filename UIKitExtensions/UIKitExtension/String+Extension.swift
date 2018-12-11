import Foundation

extension String {
    var localised: String {
        return NSLocalizedString(self, comment: "")
    }

    var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func isNotEmpty() -> Bool {
        return !isEmpty
    }

    func isValidCreditCardNumber() -> Bool {
        let ccNumberValidatorRegex = "^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])"
            + "[0-9]{11}|6(?:011|5[0-9]{2})[0-9]{12}|(?:2131|1800|35\\d{3})\\d{11})$"
        let ccNumberTest = NSPredicate(format: "SELF MATCHES %@", ccNumberValidatorRegex)
        return ccNumberTest.evaluate(with: trimmed)
    }

    func isValidCreditCardExpiryDate() -> Bool {
        let ccExpiryDateValidatorRegex = "^(0[1-9]|1[0-2])\\/?([0-9]{4}|[0-9]{2})$"
        let ccNumberTest = NSPredicate(format: "SELF MATCHES %@", ccExpiryDateValidatorRegex)
        return ccNumberTest.evaluate(with: trimmed)
    }

    /// Checks if string is can be used as email address or not.
    ///
    /// - Returns: true if valid email otherwise false
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: trimmed)
    }

    /// at least one uppercase, at least one digit at least one lowercase 8 characters total at least 1 special character
    var isValidPassword: Bool {
        let passwordPrediction = NSPredicate(
            format: "SELF MATCHES %@",
            "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[_=~)(/,`#\\?!@$%^&*-+{}]).{8,}$"
        )
        return passwordPrediction.evaluate(with: self)
    }

    func decimalValue() -> Decimal {
        // Remove `,` if found
        let trimmedNumber = replacingOccurrences(of: ",", with: "")
        return Decimal(string: trimmedNumber) ?? Decimal(0.0)
    }

    var unescaped: String {
        return replacingOccurrences(of: "\\", with: "")
            .trimmingCharacters(in: CharacterSet(charactersIn: "\""))
    }

    var withoutHexIdentifier: String {
        return replacingOccurrences(of: "0x", with: "")
    }
}
