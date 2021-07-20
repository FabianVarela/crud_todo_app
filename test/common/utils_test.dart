import 'package:crud_todo_app/common/utils.dart';
import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validation text fields', () {
    test('Validate if text is Empty', () {
      // Arrange
      const textEmpty = '';

      // Act
      final textValidation = Utils.validateEmpty(textEmpty);

      // Assert
      expect(
        textValidation,
        const ValidationText(message: 'Field is empty'),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if text is not empty', () {
      // Arrange
      const textEmpty = 'Este es mi nombre';

      // Act
      final textValidation = Utils.validateEmpty(textEmpty);

      // Assert
      expect(
        textValidation,
        const ValidationText(text: textEmpty),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if emoji is empty', () {
      // Arrange
      const textEmoji = '';

      // Act
      final textValidation = Utils.validateEmoji(textEmoji);

      // Assert
      expect(
        textValidation,
        const ValidationText(message: 'Invalid emoji'),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if emoji is not empty', () {
      // Arrange
      const textEmoji = '😀';

      // Act
      final textValidation = Utils.validateEmoji(textEmoji);

      // Assert
      expect(
        textValidation,
        const ValidationText(text: textEmoji),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if emoji is invalid', () {
      // Arrange
      const textEmoji = ':happy';

      // Act
      final textValidation = Utils.validateEmoji(textEmoji);

      // Assert
      expect(
        textValidation,
        const ValidationText(message: 'Invalid emoji'),
      );
      expect(textValidation, isA<ValidationText>());
    });
    test('Validate if ValidationText model can be cloneable', () {
      // Arrange
      const initialTextValidation = ValidationText(text: '');

      // Act
      final newTextValidation = Utils.validateEmpty(
        initialTextValidation.text!,
      );

      final cloneTextValidation = initialTextValidation.copyWith(
        message: newTextValidation.message,
      );

      // Assert
      expect(newTextValidation, isA<ValidationText>());
      expect(newTextValidation.text, isNull);
      expect(newTextValidation.message, isNotNull);

      expect(cloneTextValidation, isA<ValidationText>());
      expect(cloneTextValidation.text, isNotNull);
      expect(cloneTextValidation.message, isNotNull);
    });
  });
}
