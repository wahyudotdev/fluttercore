enum PasswordStrength { weak, medium, strong, veryStrong }

extension Password on String? {
  PasswordStrength get passwordStrength {
    final password = this ?? '';
    const minLength = 8;
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minLength;

    if (hasMinLength &&
        hasUppercase &&
        (hasLowercase || hasDigits) &&
        hasSpecialCharacters) {
      return PasswordStrength.veryStrong;
    }

    if (hasMinLength && hasUppercase && hasLowercase && hasDigits) {
      return PasswordStrength.strong;
    }

    if (hasMinLength && hasUppercase && hasLowercase) {
      return PasswordStrength.medium;
    }

    return PasswordStrength.weak;
  }
}
