
import 'package:flutter/material.dart';

InputDecoration appInputStyle(label, Icon) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      fillColor: Colors.white,
      filled: true,
      border: const OutlineInputBorder(),
      labelText: label,
      prefixIcon: Icon,
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ));
}

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    padding: const EdgeInsets.symmetric(vertical: 10),
    shadowColor: const Color(0x00000004),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    elevation: 4,
  );}