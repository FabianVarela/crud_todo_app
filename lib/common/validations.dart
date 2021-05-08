import 'package:crud_todo_app/model/validation_text_model.dart';
import 'package:crud_todo_app/common/utils.dart';

mixin Validations {
  ValidationText validateEmpty(String value) => value.isNotEmpty
      ? ValidationText(text: value)
      : ValidationText(message: 'Field is empty');

  ValidationText validateEmoji(String value) =>
      (value.length == 1 || value.length == 2) && value.verifyEmoji
          ? ValidationText(text: value)
          : ValidationText(message: 'Invalid emoji');
}
