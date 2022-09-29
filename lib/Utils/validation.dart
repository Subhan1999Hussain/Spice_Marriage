import 'package:spice_marriage/Utils/app_strings.dart';

class Validation {
  // ignore: constant_identifier_names
  static const String EMAIL_VALIDATION_REGEX =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
// ignore: constant_identifier_names
  static const String PASSWORD_VALIDATION_REGEX =
      r'^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$';
  // ignore: constant_identifier_names
  static const String NAME_VALIDATION_REGEX =
      r'^[a-zA-Z]{1,}(?: [a-zA-Z]+){0,2}$';
  static const String OTP_VALIDATION_REGEX = r'^^([0-9]{4}|[0-9]{6})$';

  // ignore: non_constant_identifier_names
  static String? EmailValidation({required String val}) {
    if (val.trim().isEmpty) {
      return AppStrings.REQUIRED_Validation;
    } else if (!RegExp(EMAIL_VALIDATION_REGEX).hasMatch(val)) {
      return AppStrings.MUST_BE_IN_EMAIL_FORMAT_Validation;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? PasswordValidation({required String val}) {
    if (val.trim().isEmpty) {
      return AppStrings.REQUIRED_Validation;
    } else if (!RegExp(PASSWORD_VALIDATION_REGEX).hasMatch(val)) {
      return AppStrings
          .MUST_BE_6_DIGIT_NUMERIC_AND_SPEACIAL_CHARACTER_Validation;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? NameValidation({required String val}) {
    if (val.trim().isEmpty) {
      return AppStrings.REQUIRED_Validation;
    } else if (!RegExp(NAME_VALIDATION_REGEX).hasMatch(val)) {
      return AppStrings.MUST_BE_IN_ALPHABETIC_Validation;
    }
    return null;
  }

  // ignore: non_constant_identifier_names
  static String? MatchPasswordValidation(
      {required String val1, required String val2}) {
    if (val1 != val2) {
      return AppStrings.PASSWORD_DOES_NOT_MATCH_VALIDATION;
    }
    return null;
  }

  static String? OtplValidation({required String val}) {
    if (val.trim().isEmpty) {
      return AppStrings.REQUIRED_Validation;
    } else if (!RegExp(OTP_VALIDATION_REGEX).hasMatch(val)) {
      return AppStrings.OTP_NOT_MATCH_VALIDATION;
    }
    return null;
  }
}
