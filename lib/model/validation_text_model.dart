import 'package:equatable/equatable.dart';

class ValidationText extends Equatable {
  const ValidationText({this.text, this.message});

  final String? text;
  final String? message;

  ValidationText copyWith({String? text, String? message}) => ValidationText(
        text: text ?? this.text,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [text, message];
}
