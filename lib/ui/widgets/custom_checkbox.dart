import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomCheckbox extends HookWidget {
  final bool value;
  final Function(bool) onChanged;

  CustomCheckbox({Key key, this.value = false, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(value);

    return GestureDetector(
      onTap: () {
        isChecked.value = !isChecked.value;
        onChanged(isChecked.value);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isChecked.value ? Color(0xFF4A78FA) : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: isChecked.value
              ? null
              : Border.all(
                  color: Colors.grey.withOpacity(.6),
                  width: 2,
                ),
        ),
        width: 25,
        height: 25,
        child: isChecked.value
            ? Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
