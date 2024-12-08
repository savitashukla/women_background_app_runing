import 'dart:convert';
import 'package:encrypt/encrypt.dart';
class EncryptionHelper {
  // final key = Key.fromSecureRandom(32);
  // final iv = IV.fromSecureRandom(16);

  static String encrypt(String plainText) {
    const str = "sTtHMA7pNBD7xSAv";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);
    final key = Key.fromBase64(base64Str);
    final iv = IV.fromBase64(base64Str);
    final encrypter = Encrypter(
      AES(key, mode: AESMode.cbc, padding: 'PKCS7'),
    );
    final encrypted = encrypter.encrypt(plainText, iv: iv);

    return encrypted.base64;
  }

  static String deskEncrypt(String plainText) {
    const str = "bXVzdGJlMTZieXRlc2tleQ==";
    final key = Key.fromBase64(str);
    final iv = IV.fromBase64(str);
    final encrypter = Encrypter(
      AES(key, mode: AESMode.ecb, padding: 'PKCS7'),
    );
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String plainText) {
    const str = "sTtHMA7pNBD7xSAv";
    final bytes = utf8.encode(str);
    final base64Str = base64.encode(bytes);
    final key = Key.fromBase64(base64Str);
    final iv = IV.fromBase64(base64Str);
    final encrypter = Encrypter(AES(
      key,
      mode: AESMode.cbc,
    ));
    final decrypted = encrypter.decrypt(Encrypted.from64(plainText), iv: iv);

    return decrypted;
  }
}
