import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  const DataItem({
    super.key,
    required this.label,
    required this.value,
    this.padding,
  });

  final String label;
  final String value;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: LabClinicasTheme.blueColor,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: LabClinicasTheme.orangeColor,
          ),
        ),
      ],
    );

    if (padding != null) {
      widget = Padding(
        padding: padding!,
        child: widget,
      );
    }
    return widget;
  }
}
