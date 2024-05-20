import 'package:flutter/material.dart';

void toast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: Theme.of(context).textTheme.labelMedium),
      backgroundColor: Theme.of(context).colorScheme.surface,
    ),
  );
}
