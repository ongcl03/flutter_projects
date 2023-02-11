import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = "0";
  String output = "0";

  Map<String, String> operatorsMap = {"÷": "/", "x": "*", "−": "-", "+": "+"};

  final List numberList = [
    "7",
    "8",
    "9",
    "/",
    "4",
    "5",
    "6",
    "x",
    "1",
    "2",
    "3",
    "-",
    ".",
    "0",
    "00",
    "+"
  ];

  void evaluateEquation() {
    try {
      // Fix equation
      Expression exp = (Parser()).parse(operatorsMap.entries.fold(
          equation, (prev, elem) => prev.replaceAll(elem.key, elem.value)));

      double res = double.parse(
          exp.evaluate(EvaluationType.REAL, ContextModel()).toString());

      // Output correction for decimal results
      output = double.parse(res.toString()) == int.parse(res.toStringAsFixed(0))
          ? res.toStringAsFixed(0)
          : res.toStringAsFixed(4);
    } catch (e) {
      output = "Error";
    }
  }

  buttonPressed(String pressedText) {
    setState(() {
      if (pressedText == "CLEAR") {
        equation = "0";
        output = "0";
      } else if (pressedText == "=") {
        // Only evaluate if correct expression
        if (!operatorsMap.containsKey(equation.substring(equation.length - 1))) {
          evaluateEquation();
        }
      } else {
        if (equation == "0") {
          equation = pressedText;
        } else {
          equation = equation + pressedText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 20, top: 50, right: 20, bottom: 20),
            width: screenWidth,
            height: screenHeight * 2.5 / 10,
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                equation,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            height: 90,
            width: screenWidth,
            decoration: const BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(width: 0.2))),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w500),
                )),
          ),
          Expanded(
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 16,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 0.9, crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      print(numberList[index]);
                      buttonPressed(numberList[index]);
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                        left: BorderSide(width: 0.4),
                        right: BorderSide(width: 0.4),
                        top: BorderSide(width: 0.3),
                        bottom: BorderSide(width: 0.3),
                      )),
                      height: 10,
                      width: 2,
                      child: Center(
                          child: Text(
                        numberList[index],
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }),
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("CLEAR");
                    buttonPressed("CLEAR");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(width: 0.4),
                            top: BorderSide(width: 0.2))),
                    height: 65,
                    width: 2,
                    child: const Center(
                      child: Text(
                        "CLEAR",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("=");
                    buttonPressed("=");
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(width: 0.4),
                            top: BorderSide(width: 0.2))),
                    height: 65,
                    width: 2,
                    child: const Center(
                      child: Text(
                        "=",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
