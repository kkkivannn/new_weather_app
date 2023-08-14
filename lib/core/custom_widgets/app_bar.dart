import 'package:flutter/material.dart';

PreferredSize appBar(Color color) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 0),
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      elevation: 0,
    ),
  );
}
