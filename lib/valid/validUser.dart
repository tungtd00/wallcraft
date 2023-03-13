class ValidUser {
  bool isValidEmail(String email) {
    if (email == null ||
        email.isEmpty ||
        email.length == 0 ||
        !email.contains("@") ||
        !email.contains(".com")) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPass(String pass) {
    if (pass == null ||
        pass.isEmpty ||
        pass.trim().length < 6 ||
        pass.trim().length == 0) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidName(String name) {
    if (name == null || name.isEmpty || name.trim().length == 0) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPhone(String phone) {
    if (phone == null || phone.isEmpty || phone.trim().length == 0) {
      return false;
    } else {
      return true;
    }
  }
}
