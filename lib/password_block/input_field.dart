import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final List<String> inputFields;
  const InputField({
    super.key,
    required this.inputFields,
  });

  @override
  State<StatefulWidget> createState() => InputFieldState();
}

class InputFieldState extends State<InputField> {
  List<Widget> inputAreas = [];
  Map<String, String> currentInputs = {};

  @override
  Widget build(BuildContext context) {
    inputAreas.clear();
    currentInputs.clear();

    for (var fieldName in widget.inputFields) {
      currentInputs[fieldName] = "";
      // add a row
      inputAreas.add(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                fieldName,
                style: inputFontStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: TextField(
                style: inputFontStyle.copyWith(
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                ),
                onChanged: (str) => setState(() {
                  currentInputs[fieldName] = str;
                }),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: 500,
      height: 500,
      decoration: BoxDecoration(
          color: const Color.fromARGB(153, 182, 241, 252),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...inputAreas, // array expand
          Row(
            children: [
              TextButton(
                onPressed: () {
                  print("hello");
                },
                child: const Text(
                  "hello",
                  style: inputFontStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  print("what");
                },
                child: const Text(
                  "what",
                  style: inputFontStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

const inputFontStyle = TextStyle(
  color: Colors.black,
  fontSize: 24,
  fontFamily: "Bombardier",
);
