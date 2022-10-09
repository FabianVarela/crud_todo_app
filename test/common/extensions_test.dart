import 'package:crud_todo_app/common/extension.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation TextFields', () {
    test('Validate if text is Empty', () {
      // arrange
      const textEmpty = '';

      // act
      final textValidation = textEmpty.validateEmpty();

      // assert
      expect(
        textValidation,
        const ValidationText(message: 'Field is empty'),
      );
      expect(textValidation, isA<ValidationText>());
    });

    test('Validate if text is not empty', () {
      // arrange
      const textEmpty = 'Este es mi nombre';

      // act
      final textValidation = textEmpty.validateEmpty();

      // assert
      expect(
        textValidation,
        const ValidationText(text: textEmpty),
      );
      expect(textValidation, isA<ValidationText>());
    });

    test('Validate if emoji is empty', () {
      // arrange
      const textEmoji = '';

      // act
      final textValidation = textEmoji.validateEmoji();

      // assert
      expect(
        textValidation,
        const ValidationText(message: 'Invalid emoji'),
      );
      expect(textValidation, isA<ValidationText>());
    });

    test('Validate if emoji is not empty', () {
      // arrange
      const textEmoji = '😀';

      // act
      final textValidation = textEmoji.validateEmoji();

      // assert
      expect(
        textValidation,
        const ValidationText(text: textEmoji),
      );
      expect(textValidation, isA<ValidationText>());
    });

    test('Validate if emoji is invalid', () {
      // arrange
      const textEmoji = ':happy';

      // act
      final textValidation = textEmoji.validateEmoji();

      // assert
      expect(
        textValidation,
        const ValidationText(message: 'Invalid emoji'),
      );
      expect(textValidation, isA<ValidationText>());
    });

    test('Check if ValidationText model can clone the message', () {
      // arrange
      const initialTextValidation = ValidationText(text: '');

      // act
      final newTextValidation = initialTextValidation.text!.validateEmpty();
      final cloneTextValidation = initialTextValidation.copyWith(
        message: newTextValidation.message,
      );

      // assert
      expect(cloneTextValidation, isA<ValidationText>());
      expect(cloneTextValidation.text, isNotNull);
      expect(cloneTextValidation.message, isNotNull);
    });

    test('Check if ValidationText model can clone the text', () {
      // arrange
      const initialTextValidation = ValidationText(text: '', message: '');

      // act
      final newTextValidation = initialTextValidation.text!.validateEmpty();
      final cloneTextValidation = initialTextValidation.copyWith(
        text: newTextValidation.text,
      );

      // assert
      expect(cloneTextValidation, isA<ValidationText>());
      expect(cloneTextValidation.text, isNotNull);
      expect(cloneTextValidation.message, isNotNull);
    });
  });
}
