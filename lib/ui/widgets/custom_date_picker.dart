import 'package:crud_todo_app/common/extension.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onChangeDate,
    super.key,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueSetter<DateTime> onChangeDate;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height / 3,
      width: size.width,
      color: Colors.white,
      child: cupertino.SizedBox(
        height: size.height / 4.5,
        child: cupertino.DefaultTextStyle(
          style: const TextStyle(fontSize: 22),
          child: cupertino.CupertinoDatePicker(
            initialDateTime: initialDate,
            minimumDate: firstDate,
            maximumDate: lastDate,
            onDateTimeChanged: onChangeDate,
          ),
        ),
      ),
    ).paddingAll(10);
  }

  static Future<void> show(
    BuildContext context, {
    required DateTime initialDate,
    required DateTime firstDate,
    required DateTime lastDate,
    required ValueSetter<DateTime> onChangeDate,
  }) async {
    final platform = defaultTargetPlatform;

    final isIOS = platform == TargetPlatform.iOS;
    final isMacOS = platform == TargetPlatform.macOS;

    if (!kIsWeb && (isIOS || isMacOS)) {
      await showModalBottomSheet<void>(
        context: context,
        builder: (_) => CustomDatePicker(
          initialDate: initialDate,
          firstDate: firstDate,
          lastDate: lastDate,
          onChangeDate: onChangeDate,
        ),
      );
    } else {
      final pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate,
      );

      if (pickedDate != null) {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(initialDate),
        );

        if (pickedTime != null) {
          onChangeDate(
            DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            ),
          );
        }
      }
    }
  }
}
