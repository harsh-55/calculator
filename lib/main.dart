import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'SecondCalculator/SecondCalculator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    title: "Calculator",
    home: calculator(),
    debugShowCheckedModeBanner: false,
  ));
}

class calculator extends StatefulWidget {
  const calculator({Key? key}) : super(key: key);

  @override
  State<calculator> createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  String a = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
        ),
        Column(
          children: [
            SizedBox(
                child: Container(
                    padding: EdgeInsets.only(top: 200),
                    height: 335,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(23),
                            bottomRight: Radius.circular(23))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 30, left: 5, right: 5),
                        child: AutoSizeText(
                          "$a",
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        )))),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                setState(() {
                                  a = "";
                                });
                              },
                              child: Text(
                                "AC",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 28,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                setState(() {
                                  a = "0";
                                });
                              },
                              child: Text(
                                "C",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 30,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                setState(() {
                                  if (a.length > 0) {
                                    a = a.substring(0, a.length - 1);
                                  }
                                });
                              },
                              child: Icon(
                                Icons.backspace_outlined,
                                size: 25,
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 67,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  primary: Colors.grey.withOpacity(0.2)),
                              onPressed: () {
                                operator('/');
                              },
                              child: Text(
                                "/",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("7");
                              },
                              child: Text(
                                "7",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("8");
                              },
                              child: Text(
                                "8",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 37,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("9");
                              },
                              child: Text(
                                "9",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 67,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  primary: Colors.grey.withOpacity(0.2)),
                              onPressed: () {
                                operator("x");
                              },
                              child: Text(
                                "x",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 27,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("4");
                              },
                              child: Text(
                                "4",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("5");
                              },
                              child: Text(
                                "5",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("6");
                              },
                              child: Text(
                                "6",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 67,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  primary: Colors.grey.withOpacity(0.2)),
                              onPressed: () {
                                operator("-");
                              },
                              child: Text(
                                "-",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 55,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("1");
                              },
                              child: Text(
                                "1",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("2");
                              },
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("3");
                              },
                              child: Text(
                                "3",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 35,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 67,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  primary: Colors.grey.withOpacity(0.2)),
                              onPressed: () {
                                operator("+");
                              },
                              child: Text(
                                "+",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 30,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("0");
                              },
                              child: Text(
                                "0",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 30,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue("00");
                              },
                              child: Text(
                                "00",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 29,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 70,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  primary: Colors.transparent),
                              onPressed: () {
                                getvalue(".");
                              },
                              child: Text(
                                ".",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 65,
                          width: 67,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  primary: Colors.cyan),
                              onPressed: () {
                                result();
                              },
                              child: Text(
                                "=",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 33,
                                    color: Colors.white),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }

  void getvalue(String s) {
    setState(() {
      a = a + s;
    });
  }

  double first = 0;
  double second = 0;

  int temp = 0;

  void operator(String o) {
    setState(() {
      double tem = first;
      first = double.parse(a);
      setState(() {
        a = "";
      });
      if (temp == 1) {
        first = tem + first;
      }
      if (temp == 2) {
        first = tem - first;
      }
      if (temp == 3) {
        first = tem * first;
      }
      if (temp == 4) {
        first = tem / first;
      }

      if (o == "+") {
        temp = 1;
      } else if (o == "-") {
        temp = 2;
      } else if (o == 'x') {
        temp = 3;
      } else if (o == '/') {
        temp = 4;
      }
    });
  }

  void result() {
    setState(() {
      second = double.parse(a);
      a = "";

      if (temp == 1) {
        double sum = first + second;
        a = ('$sum');
      } else if (temp == 2) {
        double sub = first - second;
        a = ('$sub');
      } else if (temp == 3) {
        double multi = first * second;
        a = ('$multi');
      } else if (temp == 4) {
        double divide = first / second;
        a = ('$divide');
      }
      temp = 0;
    });
  }
}
