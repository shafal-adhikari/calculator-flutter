import 'package:calculator/core/common/widgets/grid_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final TextEditingController _textFieldController =
      TextEditingController(text: "");

  calculate() {
    try {
      var exp = Parser().parse(_textFieldController.text);
      var evaluation = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evaluation.toString();
    } catch (e) {
      return "Err";
    }
  }

  void btnTapHandler(String btnKey) {
    if (btnKey == '<-') {
      _textFieldController.text = _textFieldController.text
          .substring(0, _textFieldController.text.length - 1);
    } else if (btnKey == '=') {
      String value = calculate();
      _textFieldController.text = value;
    } else if (btnKey == 'C') {
      _textFieldController.text = '';
    } else {
      _textFieldController.text = _textFieldController.text + btnKey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: TextField(
            controller: _textFieldController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(
                  r'[0-9*\/+\-.]')), // Allow only 0-9, *, /, +, -, . characters
            ],
            decoration: InputDecoration(
              hintText: '0',
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: const TextStyle(
              fontSize: 100.0,
              color: Color.fromARGB(255, 17, 163, 165),
            ),
            textAlign: TextAlign.end,
            keyboardType: TextInputType.number,
          ),
        ),
        Expanded(
          child: GridViewWidget(
            btnTapHandler: btnTapHandler,
          ),
        ),
      ],
    );
  }
}
