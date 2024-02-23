import 'package:flutter/material.dart';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class DocumentBoxWidget extends StatelessWidget {
  final bool uploaded;
  final Widget icon;
  final String label;
  final int totalFiles;
  final VoidCallback? onTap;

  const DocumentBoxWidget({
    super.key,
    required this.uploaded,
    required this.icon,
    required this.label,
    required this.totalFiles,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final totalFilesLabel = totalFiles > 0 ? '($totalFiles)' : '';
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color:
                  uploaded ? LabClinicasTheme.lightOrangeColor : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicasTheme.orangeColor),
            ),
            child: Column(
              children: [
                Expanded(child: icon),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  '$label $totalFilesLabel',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: LabClinicasTheme.orangeColor,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
