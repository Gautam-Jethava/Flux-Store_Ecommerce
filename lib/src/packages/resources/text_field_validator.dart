import 'app_constants.dart';

enum FieldType {
  email,
  userName,
  password,
  confirmPassword,
}

abstract interface class InputValidator {
  static final _validators = {
    FieldType.email: (value) => value.isEmpty
        ? 'email cannot be empty'
        : (AppConstants.emailPatternRegExp.hasMatch(value) ? null : 'enter valid email address!'),
    FieldType.userName: (value) => value.isEmpty
        ? 'Name cannot be empty'
        : (AppConstants.userNamePatternRegExp.hasMatch(value) ? null : 'enter valid Name address!'),
    FieldType.password: (value) => value.isEmpty
        ? 'Password cannot be empty'
        : (AppConstants.passwordPatternRegExp.hasMatch(value) ? null : 'enter valid Password address!'),
    FieldType.confirmPassword: (value) => value.isEmpty
        ? 'Password cannot be empty'
        : (AppConstants.confirmPasswordPatternRegExp.hasMatch(value) ? null : 'enter valid Confirm Password!'),
  };

  static String? textFieldValidator(FieldType fieldType, String? value) {
    value = value?.trim() ?? "";
    return _validators[fieldType]?.call(value);
  }
}
