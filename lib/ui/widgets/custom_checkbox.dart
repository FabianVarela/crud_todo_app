import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomCheckbox extends HookWidget {
  const CustomCheckbox({
    Key? key,
    this.value = false,
    this.enabled = true,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final bool enabled;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    final isChecked = useState(value);

    return GestureDetector(
      onTap: enabled
          ? () {
              isChecked.value = !isChecked.value;
              onChanged(isChecked.value);
            }
          : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        decoration: BoxDecoration(
          color: isChecked.value ? const Color(0xFF4A78FA) : Colors.transparent,
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
            ? const Icon(Icons.check, color: Colors.white)
            : null,
      ),
    );
  }
}
