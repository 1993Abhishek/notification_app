import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {

    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;

    debugPrint("newValue==>${newValue.text}");
    debugPrint("oldValue==>${oldValue.text}");
    debugPrint("selectionIndex==>$selectionIndex");

    final StringBuffer newText = StringBuffer();
    if (oldValue.text.isEmpty && newValue.text.length == 1) {
      newText.write("+975-${newValue.text}");
      selectionIndex = 6;
    } else if (newValue.text.length == 4) {
      newText.write("");
      selectionIndex = 0;
    } else {
      newText.write(newValue.text);
    }

    debugPrint("selectionIndex==>$selectionIndex");
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
