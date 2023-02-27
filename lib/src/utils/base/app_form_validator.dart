class AppFormValidator {
  static String? generalEmptyValidator(String? orgText) {
    final text = orgText?.trimRight();
    if (text == null || text.isEmpty) {
      return 'This field can not be empty';
    }
    return null;
  }

}
