import 'package:flutter/material.dart';

import 'generic_dialog.dart';

Future<bool> showLogOutDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Log Out',
    content: 'Are you sure you want to Log Out?',
    optionBuilder: () => {
      'Cancel': false,
      'Log Out': true,
    },
  ).then(
        (value) => value ?? false,
  );
}