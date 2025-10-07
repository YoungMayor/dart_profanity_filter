import 'package:profanity_filter/profanity_filter.dart';

void main() {
  print('=== String Extension Examples ===\n');

  // Example 1: hasProfanity()
  print('Example 1: hasProfanity()');
  String example1 = 'The sample string';
  String example2 = 'what the fuck';
  print('  "$example1".hasProfanity() = ${example1.hasProfanity()}');
  print('  "$example2".hasProfanity() = ${example2.hasProfanity()}');
  print('');

  // Example 2: censor()
  print('Example 2: censor()');
  String example3 = 'you are an ass';
  print('  "$example3".censor() = "${example3.censor()}"');
  print(
      '  "$example3".censor(replaceWith: "[censored]") = "${example3.censor(replaceWith: "[censored]")}"');
  print('');

  // Example 3: getAllProfanity()
  print('Example 3: getAllProfanity()');
  String example4 = 'what the fuck pass';
  String example5 = 'hello friends';
  print('  "$example4".getAllProfanity() = ${example4.getAllProfanity()}');
  print('  "$example5".getAllProfanity() = ${example5.getAllProfanity()}');
  print('');

  // Example 4: Chaining operations
  print('Example 4: Chaining operations on the same string');
  String testString = 'hello bitches and friends';
  print('  Original: "$testString"');
  print('  Has profanity: ${testString.hasProfanity()}');
  print('  Censored: "${testString.censor()}"');
  print('  Found words: ${testString.getAllProfanity()}');
}
