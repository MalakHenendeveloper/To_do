class AppValidator {
  static String? validatorname(String? val) {
    if (val == null || val.isEmpty) {
      return 'Required this Feild';
    }
    return null;
  }
}
