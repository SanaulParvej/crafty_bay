import 'package:flutter/material.dart';

void showSnackBarMessage(BuildContext context, String tittle,
    [bool isError = false]) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      tittle,
      style: TextStyle(color: isError ? Colors.white : null),
    ),
    backgroundColor: isError ? Colors.red : null,
  ));
}
