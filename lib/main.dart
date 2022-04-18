import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Máy Tính Bỏ Túi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Máy Tính Đơn Giản'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _input = "";
  String _result = "";
  final List<String> IsButton = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    'Ans',
    '0',
    '.',
    '='
  ];
  @override
  Widget build(BuildContext context) {
    void caCulatorResult() {
      String finalInput = _input.replaceAll("x", "*");
      finalInput = finalInput.replaceAll("%", "/100");
      // finalInput = finalInput.replaceAll("/", "/");
      // finalInput = finalInput.replaceAll("+", "+");
      // finalInput = finalInput.replaceAll("-", "-");
      try {
        Parser p = Parser();
        Expression exp = p.parse(finalInput);
        ContextModel cm = ContextModel();
        double value = exp.evaluate(EvaluationType.REAL, cm);
        _result = value.toString();
      } catch (e) {
        _result = "SYNTAX ERROR";
      }
    }

    bool _checkFunctionButton(index) {
      switch (index) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 7:
        case 11:
        case 15:
        case 19:
          return true;
      }
      return false;
    }

    void checkSyntaxError() {
      int length = _input.length;
      if (_input != "") {
        if (_input[length - 1] == '+' ||
            _input[length - 1] == '-' ||
            _input[length - 1] == 'x' ||
            _input[length - 1] == '.' ||
            _input[length - 1] == '/' ||
            _input[length - 1] == '%') {
          _input = _input.substring(0, length - 1);
        } else if (_input[0] == '+' ||
            _input[0] == '-' ||
            _input[0] == 'x' ||
            _input[0] == '.' ||
            _input[0] == '/' ||
            _input[0] == '%') {
          _input = "0" + _input;
        }
      }
    }

    void _buttonTap(index) {
      setState(() {});
      if (index == 0) //Press Key C
      {
        _input = "";
        _result = "";
      } else if (index == 1) //Press Key DEL
      {
        if (_input == "") {
          _input = _input;
        } else {
          _input = _input.substring(0, _input.length - 1);
        }
      } else if (index == 16) //Press Key Ans
      {
        if (_result == "SYNTAX ERROR") {
          _input = "";
          _result = "";
        } else {
          _input = _result;
          _result = "";
        }
      } else if (index == 19) //Press Key =
      {
        checkSyntaxError();
        caCulatorResult();
        _input = "";
      } else {
        switch (index) {
          case 2:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          case 3:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          case 7:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          case 11:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          case 15:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          case 18:
            checkSyntaxError();
            _input += IsButton[index];

            break;
          default:
            _input += IsButton[index];
        }
      }
    }

    Widget txtbtnNhap = Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        child: Text(_input,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            )));

    Widget txtKetQua = Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.yellow,
            ),
          ),
        ),
        child: Text(_result,
            style: TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold,
            )));

    Widget buildButtonSo(int index) {
      return Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: SizedBox(
              width: 90,
              height: 90,
              child: FlatButton(
                textColor: _checkFunctionButton(index)
                    ? Colors.blue
                    : Colors.black, // foreground
                onPressed: () => _buttonTap(index),
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(IsButton[index],
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              )));
    }

    Widget buildButton(int index) {
      return Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: SizedBox(
              width: 90,
              height: 90,
              child: FlatButton(
                textColor: _checkFunctionButton(index)
                    ? Colors.blue
                    : Colors.black, // foreground
                onPressed: () => _buttonTap(index),
                color: Colors.grey[300],
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(IsButton[index],
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              )));
    }

    Widget buildButtonBang(int index) {
      return Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: SizedBox(
              width: 90,
              height: 90,
              child: FlatButton(
                textColor: Colors.blue, // foreground
                onPressed: () => _buttonTap(index),
                color: Colors.yellow[200],
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Colors.black,
                        width: 1,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(100)),
                child: Text(IsButton[index],
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              )));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            txtbtnNhap,
            txtKetQua,
            Row(
              children: [
                buildButton(0),
                buildButton(1),
                buildButton(2),
                buildButton(3),
              ],
            ),
            Row(
              children: [
                buildButtonSo(4),
                buildButtonSo(5),
                buildButtonSo(6),
                buildButton(7),
              ],
            ),
            Row(
              children: [
                buildButtonSo(8),
                buildButtonSo(9),
                buildButtonSo(10),
                buildButton(11),
              ],
            ),
            Row(
              children: [
                buildButtonSo(12),
                buildButtonSo(13),
                buildButtonSo(14),
                buildButton(15),
              ],
            ),
            Row(
              children: [
                buildButtonSo(16),
                buildButtonSo(17),
                buildButtonSo(18),
                buildButtonBang(19),
              ],
            )
          ],
        ));
  }
}
