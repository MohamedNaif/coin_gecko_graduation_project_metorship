class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'email is required';
    } else if (!emailRegex.hasMatch(val)) {
      return 'email is not valid';
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    if (val == null || val.isEmpty) {
      return 'Name is required';
    } else {
      return null;
    }
  }

  static String? emptyValidation(String? val) {
    if (val == null || val.isEmpty) {
      return 'field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return '';
    } else if (int.tryParse(val.trim()) == null) {
      return '';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    final RegExp passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$');
    if (val == null || val.isEmpty) {
      return 'password is required';
    } else if (!passwordRegex.hasMatch(val)) {
      return 'password must be at least 8 characters long, contain at least one uppercase letter and one number';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'confirm password is required';
    } else if (val != password) {
      return 'passwords do not match';
    } else {
      return null;
    }
  }
}
