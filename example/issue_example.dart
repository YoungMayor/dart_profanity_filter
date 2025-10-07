import 'package:profanity_filter/profanity_filter.dart';

/// This example demonstrates the exact syntax requested in the issue.
void main() {
  print('=== Testing exact syntax from the issue ===\n');

  // Test the exact examples from the problem statement
  print('Test 1: hasProfanity()');
  bool result1 = 'The sample string'.hasProfanity();
  print('  \'The sample string\'.hasProfanity() = $result1');
  assert(result1 == false, 'Clean string should not have profanity');

  bool result2 = 'what the fuck'.hasProfanity();
  print('  \'what the fuck\'.hasProfanity() = $result2');
  assert(result2 == true, 'String with profanity should return true');

  print('\nTest 2: censor()');
  String result3 = 'The sample string'.censor();
  print('  \'The sample string\'.censor() = "$result3"');
  assert(result3 == 'The sample string', 'Clean string should not be censored');

  String result4 = 'what the fuck'.censor();
  print('  \'what the fuck\'.censor() = "$result4"');
  assert(result4 == 'what the ****', 'Profanity should be censored');

  print('\nTest 3: getAllProfanity()');
  List<String> result5 = 'The sample string'.getAllProfanity();
  print('  \'The sample string\'.getAllProfanity() = $result5');
  assert(result5.isEmpty, 'Clean string should return empty list');

  List<String> result6 = 'what the fuck'.getAllProfanity();
  print('  \'what the fuck\'.getAllProfanity() = $result6');
  assert(result6.isNotEmpty, 'String with profanity should return non-empty list');

  print('\n✅ All assertions passed! The API works exactly as specified.');
}
