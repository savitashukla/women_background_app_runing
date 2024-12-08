class ValidatePassWord {
  bool isUpperCaseExists;
  bool isLowerCaseExists;
  bool isNumberExists;
  bool isSpecialCharacterExists;
  bool isValidPassWord;
  bool is8Characters;
  bool showPassWordInfo;
  String password;

  ValidatePassWord({
    this.isLowerCaseExists = false,
    this.isNumberExists = false,
    this.isSpecialCharacterExists = false,
    this.isUpperCaseExists = false,
    this.isValidPassWord = false,
    this.is8Characters = false,
    this.showPassWordInfo = false,
    this.password = "",
  });
  ValidatePassWord copyWith(
      {bool? isUpperCaseExists,
      bool? isLowerCaseExists,
      bool? isNumberExists,
      bool? isSpecialCharacterExists,
      bool? isValidPassWord,
      bool? is8Characters,
      bool? showPassWordInfo,
      String? password}) {
    return ValidatePassWord(
        is8Characters: is8Characters ?? this.is8Characters,
        isLowerCaseExists: isLowerCaseExists ?? this.isLowerCaseExists,
        isNumberExists: isNumberExists ?? this.isNumberExists,
        isSpecialCharacterExists:
            isSpecialCharacterExists ?? this.isSpecialCharacterExists,
        isUpperCaseExists: isUpperCaseExists ?? this.isUpperCaseExists,
        isValidPassWord: isValidPassWord ?? this.isValidPassWord,
        showPassWordInfo: showPassWordInfo ?? this.showPassWordInfo);
  }

  get isButtonEnabled {
    bool password = is8Characters &&
        isLowerCaseExists &&
        isNumberExists &&
        isValidPassWord &&
        isSpecialCharacterExists &&
        isUpperCaseExists;
    return password;
  }
}
