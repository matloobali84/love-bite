import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LoveCalculatorApp());
}

class LoveCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoveCalculatorPage(),
    );
  }
}

class LoveCalculatorPage extends StatefulWidget {
  @override
  _LoveCalculatorPageState createState() => _LoveCalculatorPageState();
}

class _LoveCalculatorPageState extends State<LoveCalculatorPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController partnerNameController = TextEditingController();
  String result = '';

  void calculateLove() {
    final random = Random();
    final lovePercentage = random.nextInt(101); // Random percentage between 0 and 100
    final name = nameController.text;
    final partenerName = partnerNameController.text;
    setState(() {
      if (name.isNotEmpty && partenerName.isNotEmpty) {
        result = 'Your love probablity with $partenerName is $lovePercentage%';
      } else {
        result = 'Please Input all fields';
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.bold,
      fontSize: 25,
        color: Colors.deepOrange
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/image/1.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.5), // Dark overlay for better readability
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.1, // 10% of screen width
              vertical: screenHeight * 0.05, // 5% of screen height
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image(image: Image.network(src)),
                Text("Love Calculator",style: titleStyle),
                SizedBox(height: 20,),
                TextField(
                  controller: nameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                TextField(
                  controller: partnerNameController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Partner\'s Name',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                ElevatedButton(
                  onPressed: calculateLove,
                  child: Text('Calculate Love'),
                ),
                SizedBox(height: screenHeight * 0.02), // 2% of screen height
                Text(
                  result,
                  style: TextStyle(fontSize: screenHeight * 0.03, color: Colors.white), // 3% of screen height for font size
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
