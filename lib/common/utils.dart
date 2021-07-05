import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/common/extension.dart';

class Utils {
  static ValidationText validateEmpty(String value) => value.isNotEmpty
      ? ValidationText(text: value)
      : const ValidationText(message: 'Field is empty');

  static ValidationText validateEmoji(String value) =>
      (value.length == 1 || value.length == 2) && value.verifyEmoji
          ? ValidationText(text: value)
          : const ValidationText(message: 'Invalid emoji');
}
