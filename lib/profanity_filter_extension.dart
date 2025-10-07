import 'profanity_filter.dart';

/// Extension methods on [String] for profanity filtering.
///
/// These extensions provide convenient methods to check, censor, and find
/// profanity in strings using the default [ProfanityFilter].
extension ProfanityFilterExtension on String {
  static final ProfanityFilter _defaultFilter = ProfanityFilter();

  /// Returns `true` if this string contains profanity, false otherwise.
  ///
  /// Uses the default profanity list from LDNOOBW.
  ///
  /// Example:
  /// ```dart
  /// bool hasBadWords = 'hello bitches'.hasProfanity(); // true
  /// bool isClean = 'hello friends'.hasProfanity(); // false
  /// ```
  bool hasProfanity() {
    return _defaultFilter.hasProfanity(this);
  }

  /// Returns a censored version of this string, with asterisk (*) pattern
  /// as default.
  ///
  /// If [replaceWith] is provided, replaces all profane words with that
  /// [replaceWith] string.
  ///
  /// Example:
  /// ```dart
  /// String clean = 'you are an ass'.censor(); // 'you are an ***'
  /// String custom = 'you are an ass'.censor(replaceWith: '[censored]'); // 'you are an [censored]'
  /// ```
  String censor({String? replaceWith}) {
    return _defaultFilter.censor(this, replaceWith: replaceWith);
  }

  /// Returns a list of all profanity found in this string.
  ///
  /// Example:
  /// ```dart
  /// List<String> words = 'what the fuck'.getAllProfanity(); // ['fuck']
  /// List<String> noWords = 'what the fish'.getAllProfanity(); // []
  /// ```
  List<String> getAllProfanity() {
    return _defaultFilter.getAllProfanity(this);
  }
}
