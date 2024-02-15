import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 164, 217),
        appBar: AppBar(
          title: Text('CP-SU LED MATRIX'),
          titleTextStyle: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
        body: LEDMatrixCounter(),
      ),
    );
  }
}

class LEDMatrixCounter extends StatefulWidget {
  @override
  _LEDMatrixCounterState createState() => _LEDMatrixCounterState();
}

class _LEDMatrixCounterState extends State<LEDMatrixCounter> {
  int _number = 0;

  // 0 = จุดมืด (LED off), 1 = จุดสว่าง (LED on)
  List dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(64.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_drop_up, size: 70, color: Colors.pink),
                onPressed: () {
                  setState(() {
                    _number = (_number + 1) % 100;
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black, 
                border: Border.all(width: 13.0, color: Colors.white),
                borderRadius: BorderRadius.circular(0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    _buildDigit(((_number ~/ 10) % 10)),
                    SizedBox(width: 35.0),
                    _buildDigit((_number % 10)),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1.0, color: Colors.white),
                borderRadius: BorderRadius.circular(64.0),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_drop_down, size: 70, color: Colors.pink),
                onPressed: () {
                  setState(() {
                    _number = (_number - 1) < 0 ? 99 : (_number - 1) % 100;
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDigit(int digit) {
    return Column(
      children: _buildRow(dotsData[digit]),
    );
  }


  List<Widget> _buildRow(List<List<int>> values) {
    return values.map((row) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: row.map((value) {
          return _buildDot(value);
        }).toList(),
      );
    }).toList();
  }

  Widget _buildDot(int value) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: value == 1
            ? Color.fromARGB(255, 230, 227, 84)
            : Color.fromARGB(255, 63, 64, 65),
      ),
      margin: EdgeInsets.all(1),
    );
  }
}