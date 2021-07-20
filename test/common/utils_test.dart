import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation text fields', () {
    test('Validate if text is Empty', () {
      // arrange
      const textEmpty = '';

      // act
      final textValidation = Utils.validateEmpty(textEmpty);

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
      final textValidation = Utils.validateEmpty(textEmpty);

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
      final textValidation = Utils.validateEmoji(textEmoji);

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
      final textValidation = Utils.validateEmoji(textEmoji);

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
      final textValidation = Utils.validateEmoji(textEmoji);

      // assert
      expect(
        textValidation,
        const ValidationText(message: 'Invalid emoji'),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if ValidationText model can be cloneable', () {
      // arrange
      const initialTextValidation = ValidationText(text: '');

      // act
      final newTextValidation = Utils.validateEmpty(
        initialTextValidation.text!,
      );

      final cloneTextValidation = initialTextValidation.copyWith(
        message: newTextValidation.message,
      );

      // assert
      expect(newTextValidation, isA<ValidationText>());
      expect(newTextValidation.text, isNull);
      expect(newTextValidation.message, isNotNull);

      expect(cloneTextValidation, isA<ValidationText>());
      expect(cloneTextValidation.text, isNotNull);
      expect(cloneTextValidation.message, isNotNull);
    });
  });
}
