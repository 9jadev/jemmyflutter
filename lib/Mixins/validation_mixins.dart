import 'package:email_validator/email_validator.dart';

class ValidationMixin {
  String _password;

  String validateNickname(String value) {
    if (value.isEmpty) {
      return 'Nick Name is requred';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    final bool isValid = EmailValidator.validate(value);
    return isValid ? null : 'Email is required';
  }

  String validateAbout(String value) {
    if (value.isEmpty) {
      return 'About is requred';
    }

    int len = value.length;
    if (len < 50) {
      return 'About must be between 50 to 600 characters';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is requred';
    } else {
      _password = value;
      return null;
    }
  }

  String validateConfirmpassword(String value) {
    // print(value);
    if (value.isEmpty) {
      return 'Confirm Password is requred';
    }
    if (_password != value) {
      return 'Password and Confirm Password should be same';
    }
    return null;
  }
}
