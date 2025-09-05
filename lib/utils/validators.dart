class Validators {
  static String? validateIdentifier(String? value) {
    if (value == null || value.isEmpty) return "Email эсвэл утас хоосон байна";
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    final phoneRegex = RegExp(r"^\+?\d{8,15}$");

    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return "Email эсвэл утас буруу байна";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return "Нууц үг хоосон байна";
    if (value.length < 6) return "Нууц үг дор хаяж 6 тэмдэгттэй байх ёстой";
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) return "Утас хоосон байна";
    if (!RegExp(r"^\+?\d{8,15}$").hasMatch(value)) return "Утас буруу байна";
    return null;
  }

  static String? validateCode(String? value) {
    if (value == null || value.isEmpty) return "Код хоосон байна";
    if (!RegExp(r"^\d{4}$").hasMatch(value)) return "Код 4 оронтой байх ёстой";
    return null;
  }
}
