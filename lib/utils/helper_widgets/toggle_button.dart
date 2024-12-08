import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

class ToggleButton extends StatefulWidget {
  const ToggleButton({
    super.key,
    this.initialValue,
    required this.onChanged,
  });

  final bool? initialValue;
  final void Function(bool value) onChanged;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  late bool enabled;

  @override
  void initState() {
    super.initState();
    enabled = widget.initialValue ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final circleColor = enabled ? const Color(0xffF96161) : Colors.grey;
    final backgroundColor =
        enabled ? const Color(0xffFFD2D2) : Theme.of(context).indicatorColor;
    final Border? border =
        !enabled ? Border.all(color: Colors.grey.shade300) : null;
    final circlePosition =
        enabled ? Alignment.centerRight : Alignment.centerLeft;

    return InkWell(
      borderRadius: BorderRadius.circular(64.0),
      onTap: () {
        widget.onChanged(!enabled);
        setState(() {
          enabled = !enabled;
        });
      },
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64.0),
            border: border,
            color: backgroundColor,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
          width: 35,
          height: 20,
          child: AnimatedAlign(
            duration: const Duration(milliseconds: 200),
            alignment: circlePosition,
            child: Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                color: circleColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
