/// Single source of truth for the phone <-> synthetic-Auth-email mapping.
/// Firebase Auth has no native phone+password provider (phone auth requires
/// SMS OTP), so every account signs in with a synthetic email derived
/// deterministically from its phone number. The real phone number is only
/// ever stored as a Firestore profile field, never as the Auth identity.
class PhoneUtils {
  PhoneUtils._();

  static const _syntheticDomain = 'dentex.local';

  /// Strips everything but digits, e.g. "+966 50 123 4567" -> "9665012304567".
  static String digitsOnly(String phone) {
    return phone.replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Derives the synthetic Firebase Auth email for a given phone number.
  static String syntheticEmailFor(String phone) {
    final digits = digitsOnly(phone);
    return '$digits@$_syntheticDomain';
  }

  /// Basic sanity check before attempting sign-in/account creation.
  static bool isValidPhone(String phone) {
    final digits = digitsOnly(phone);
    return digits.length >= 8 && digits.length <= 15;
  }
}
