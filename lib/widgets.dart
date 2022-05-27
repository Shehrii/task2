import 'package:flutter/material.dart';

Widget customDialogButton(
  String text, {
  Function()? onTap,
  Color color = Colors.blue,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: customText(text, color: Colors.white),
    ),
  );
}

Widget customButton(
  BuildContext context,
  String text, {
  Function()? onTap,
  Color color = Colors.blue,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(26),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 14,
      ),
      child: customText(
        text,
        color: Colors.white,
        align: TextAlign.center,
        size: 16,
        bold: true,
      ),
    ),
  );
}

Widget customText(
  String text, {
  double size = 12,
  bool bold = false,
  Color color = Colors.black,
  TextAlign? align,
  Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
      textAlign: align,
    ),
  );
}

customTextField({
  String? hint,
  Function(String)? onChanged,
  TextInputType? keyboardType,
  int? minLines,
}) {
  return TextField(
    onChanged: onChanged,
    minLines: minLines,
    maxLines: minLines,
    decoration: InputDecoration(
      labelText: hint,
      alignLabelWithHint: true,
    ),
    textAlign: TextAlign.start,
    keyboardType: keyboardType,
  );
}
