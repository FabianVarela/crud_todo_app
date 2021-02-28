class ValidationText {
  ValidationText({this.text, this.message});

  final String text;
  final String message;

  ValidationText copyWith({
    String text,
    String message,
  }) =>
      ValidationText(
        text: text ?? this.text,
        message: message ?? this.message,
      );
}
