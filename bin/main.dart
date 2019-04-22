import 'package:convert/convert.dart';
import 'package:libsodium/libsodium.dart';

// #define PASSWORD "Correct Horse Battery Staple"
// #define KEY_LEN crypto_box_SEEDBYTES

// unsigned char salt[crypto_pwhash_scryptsalsa208sha256_SALTBYTES];
// unsigned char key[KEY_LEN];

// randombytes_buf(salt, sizeof salt);

// if (crypto_pwhash_scryptsalsa208sha256
//     (key, sizeof key, PASSWORD, strlen(PASSWORD), salt,
//      crypto_pwhash_scryptsalsa208sha256_OPSLIMIT_INTERACTIVE,
//      crypto_pwhash_scryptsalsa208sha256_MEMLIMIT_INTERACTIVE) != 0) {
//     /* out of memory */
// }

void main() async {
  sodiumInit();

  final password = 'Correct Horse Battery Staple';
  final data = scryptPasswordStorage(password.codeUnits);
  if (data == null) {
    print('data is null');
    return;
  }
  print(hex.encode(data));

  final result = scryptPasswordStorageVerify(data, password.codeUnits);
  print(result);
  print('end');
}
