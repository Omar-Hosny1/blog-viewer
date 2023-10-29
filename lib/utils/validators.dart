String? validateEmail(String value) {
  value = value.trim();
  if (value.isEmpty) {
    return 'Please enter an email address';
  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
      .hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validatePassword(String value) {
  value = value.trim();

  if (value.isEmpty) {
    return 'Please enter a password';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  } else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d).+$').hasMatch(value)) {
    return 'Password must contain both letters and numbers';
  }
  return null;
}

String? validateText(String? value) {
  if (value == null) {
    return 'Please enter a value';
  }
  value = value.trim();
  if (value.isEmpty) {
    return 'Please enter a value';
  }
  return null;
}
