import 'package:flutter/material.dart';

Future<void> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String content,
  required Function onConfirm,
  Function? onCancel,
  String? confirmText,
  String? cancelText,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              if (onCancel != null) onCancel();
            },
            child: Text(cancelText ?? 'Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              onConfirm();
            },
            child: Text(
              confirmText ?? 'Confirm',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}

Future<dynamic> showCustomDialog({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onConfirm,
  VoidCallback? onCancel,
  String? cancelBtnLabel,
  String? confirmBtnLabel,
  IconData? icon,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          onCancel != null
              ? TextButton(
                  onPressed: () {
                    onCancel();
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text(cancelBtnLabel ?? 'Cancel'),
                )
              : SizedBox(),
          TextButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              confirmBtnLabel ?? 'Confirm',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      );
    },
  );
}
