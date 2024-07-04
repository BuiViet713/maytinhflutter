import 'package:flutter/material.dart';

enum TrangThaiChon {CHUA_TINH, TOAN_HANG_1, TOAN_TU, TOAN_HANG_2}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  TrangThaiChon ttc = TrangThaiChon.CHUA_TINH;

  String _showText = "0";
  int iToanHang1 = 0;
  String strToanTu = "";
  int iToanHang2 = 0;

  pressNumber(int number) {
    if (ttc == TrangThaiChon.CHUA_TINH) {
      iToanHang1 = number;
      _showText = iToanHang1.toString();
      ttc = TrangThaiChon.TOAN_HANG_1;
    } else if (ttc == TrangThaiChon.TOAN_HANG_1) {
      iToanHang1 = iToanHang1 * 10 + number;
      _showText = iToanHang1.toString();
    } else if (ttc == TrangThaiChon.TOAN_TU) {
      iToanHang2 = number;
      _showText = iToanHang2.toString();
      ttc = TrangThaiChon.TOAN_HANG_2;
    } else if (ttc == TrangThaiChon.TOAN_HANG_2) {
      iToanHang2 = iToanHang2 * 10 + number;
      _showText = iToanHang2.toString();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Calculator"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    _showText,
                    style: TextStyle(
                      fontSize: 46,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(7);
                        });
                      },
                      child: Text("7"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(8);
                        });
                      },
                      child: Text("8"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(9);
                        });
                      },
                      child: Text("9"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.TOAN_HANG_1) {
                            _showText = strToanTu = "+";
                            ttc = TrangThaiChon.TOAN_TU;
                          }
                        });
                      },
                      child: Text("+"),
                    ),
                  ],
                ),

                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(4);
                        });
                      },
                      child: Text("4"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(5);
                        });
                      },
                      child: Text("5"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(6);
                        });
                      },
                      child: Text("6"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.TOAN_HANG_1) {
                            _showText = strToanTu = "-";
                            ttc = TrangThaiChon.TOAN_TU;
                          }
                        });
                      },
                      child: Text("-"),
                    ),
                  ],
                ),

                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(1);
                        });
                      },
                      child: Text("1"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(2);
                        });
                      },
                      child: Text("2"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          pressNumber(3);
                        });
                      },
                      child: Text("3"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.TOAN_HANG_1) {
                            _showText = strToanTu = "x";
                            ttc = TrangThaiChon.TOAN_TU;
                          }
                        });
                      },
                      child: Text("x"),
                    ),
                  ],
                ),

                Row (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.CHUA_TINH) {
                            iToanHang1 = 0;
                            _showText = iToanHang1.toString();
                            ttc = TrangThaiChon.TOAN_HANG_1;
                          } else if (ttc == TrangThaiChon.TOAN_HANG_1) {
                            if (iToanHang1 != 0)
                              iToanHang1 = iToanHang1 * 10;
                            _showText = iToanHang1.toString();
                          } else if (ttc == TrangThaiChon.TOAN_TU) {
                            iToanHang2 = 0;
                            _showText = iToanHang2.toString();
                            ttc = TrangThaiChon.TOAN_HANG_2;
                          } else if (ttc == TrangThaiChon.TOAN_HANG_2) {
                            if (iToanHang2 != 0)
                              iToanHang2 = iToanHang2 * 10;
                            _showText = iToanHang2.toString();
                          }
                        });
                      },
                      child: Text("0"),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      onPressed: (){
                        setState(() {
                          ttc = TrangThaiChon.CHUA_TINH;
                          _showText = "0";
                          iToanHang1 = iToanHang2 = 0;
                          strToanTu = "";
                        });
                      },
                      child: Text("C"),
                    ),

                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.TOAN_HANG_2) {
                            switch(strToanTu) {
                              case "+": _showText = (iToanHang1 + iToanHang2).toString(); break;
                              case "-": _showText = (iToanHang1 - iToanHang2).toString(); break;
                              case "x": _showText = (iToanHang1 * iToanHang2).toString(); break;
                              case ":": _showText = (iToanHang1 / iToanHang2).toString(); break;
                            }
                            ttc = TrangThaiChon.CHUA_TINH;
                          }
                        });
                      },
                      child: Text("="),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (ttc == TrangThaiChon.TOAN_HANG_1) {
                            _showText = strToanTu = ":";
                            ttc = TrangThaiChon.TOAN_TU;
                          }
                        });
                      },
                      child: Text(":"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

main() => runApp(Counter());