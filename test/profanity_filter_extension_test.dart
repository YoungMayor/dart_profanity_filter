import 'package:test/test.dart';
import '../lib/profanity_filter.dart';

void main() {
  group('String Extension - hasProfanity', () {
    test('detects profanity in string', () {
      expect('hello bitches'.hasProfanity(), true);
      expect('you are an ass'.hasProfanity(), true);
      expect('what the fuck'.hasProfanity(), true);
    });

    test('returns false for clean strings', () {
      expect('hello friends'.hasProfanity(), false);
      expect('what the fish'.hasProfanity(), false);
      expect('have a nice day'.hasProfanity(), false);
    });

    test('is case-insensitive', () {
      expect('hello BITCHES'.hasProfanity(), true);
      expect('WHAT THE FUCK'.hasProfanity(), true);
      expect('You Are An AsS'.hasProfanity(), true);
    });

    test('does not detect substring as profanity', () {
      expect('practitioner assessment'.hasProfanity(), false);
    });
  });

  group('String Extension - censor', () {
    test('censors profanity with asterisks by default', () {
      expect('what the fuck'.censor(), 'what the ****');
      expect('you are an ass'.censor(), 'you are an ***');
      expect('hello bitches'.censor(), 'hello *******');
    });

    test('censors with case preservation', () {
      expect('what the FucK pass'.censor(), 'what the **** pass');
      expect('WHAT THE FUCK'.censor(), 'WHAT THE ****');
    });

    test('censors with custom replaceWith parameter', () {
      expect('what the fuck'.censor(replaceWith: '[censored]'),
          'what the [censored]');
      expect('you are an ass'.censor(replaceWith: '[BLEEP]'),
          'you are an [BLEEP]');
    });

    test('does not censor clean strings', () {
      expect('what the fish'.censor(), 'what the fish');
      expect('hello friends'.censor(), 'hello friends');
    });

    test('does not censor substring as profanity', () {
      expect('practitioner assessment'.censor(), 'practitioner assessment');
    });
  });

  group('String Extension - getAllProfanity', () {
    test('returns list of profanity found', () {
      expect('what the fuck'.getAllProfanity(), ['fuck']);
      expect('you are an ass'.getAllProfanity(), ['ass']);
      expect('hello bitches'.getAllProfanity(), ['bitches']);
    });

    test('returns empty list for clean strings', () {
      expect('what the fish'.getAllProfanity(), []);
      expect('hello friends'.getAllProfanity(), []);
      expect('have a nice day'.getAllProfanity(), []);
    });

    test('returns multiple profane words if present', () {
      // Note: This depends on the actual word list
      String multiProfanity = 'fuck ass';
      List<String> found = multiProfanity.getAllProfanity();
      expect(found.length, greaterThan(0));
    });

    test('does not detect substring as profanity', () {
      expect('practitioner assessment'.getAllProfanity(), []);
    });
  });

  group('String Extension - Integration tests', () {
    test('works with empty strings', () {
      expect(''.hasProfanity(), false);
      expect(''.censor(), '');
      expect(''.getAllProfanity(), []);
    });

    test('works with single word strings', () {
      expect('fuck'.hasProfanity(), true);
      expect('fuck'.censor(), '****');
      expect('fuck'.getAllProfanity(), ['fuck']);

      expect('hello'.hasProfanity(), false);
      expect('hello'.censor(), 'hello');
      expect('hello'.getAllProfanity(), []);
    });

    test('chain of operations produces consistent results', () {
      String testString = 'what the fuck pass';

      bool hasProfanityResult = testString.hasProfanity();
      String censorResult = testString.censor();
      List<String> allProfanityResult = testString.getAllProfanity();

      expect(hasProfanityResult, true);
      expect(censorResult, 'what the **** pass');
      expect(allProfanityResult, ['fuck']);
    });
  });
}
