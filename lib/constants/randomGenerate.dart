import 'dart:math';

String getRandomGeneratedId() {
  const int AUTO_ID_LENGTH = 20;
  const String AUTO_ID_ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  const int maxRandom = AUTO_ID_ALPHABET.length;
  final Random randomGen = Random();

  final StringBuffer buffer = StringBuffer();
  for (int i = 0; i < AUTO_ID_LENGTH; i++) {
    buffer.write(AUTO_ID_ALPHABET[randomGen.nextInt(maxRandom)]);
  }

  return buffer.toString();
}