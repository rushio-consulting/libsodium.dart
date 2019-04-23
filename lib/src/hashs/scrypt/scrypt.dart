import 'package:libsodium/src/hashs/scrypt/scrypt_key_derivation.dart';
import 'package:libsodium/src/hashs/scrypt/scrypt_password_storage.dart';
import 'package:libsodium/src/utils/digest.dart';

class Scrypt {
  Digest derivationKey(List<int> password, {List<int> salt}) =>
      Digest(scryptKeyDerivation(password, salt: salt));

  Digest passwordStorage(List<int> password) =>
      Digest(scryptPasswordStorage(password));

  int passwordStorageVerify(List<int> hashedPassword, List<int> password) =>
      scryptPasswordStorageVerify(hashedPassword, password);
}
