import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Varify extends StatefulWidget {
  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<Varify> {
  final int fieldCount = 4;

  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(fieldCount, (_) => TextEditingController());
    _focusNodes = List.generate(fieldCount, (_) => FocusNode());
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  Widget buildTextField(int index) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0 : 15),
      child: SizedBox(
        width: 40,
        height: 40,
        child: TextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          showCursor: false,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(1),
          ],
          onChanged: (value) {
            if (value.length == 1 && index < fieldCount - 1) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
            if (value.isEmpty && index > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
            }
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(fieldCount, (index) => buildTextField(index)),
      ),
    );
  }
}
