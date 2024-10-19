// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 60;
  double bmi = 0;
  String gender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(14),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "BMI Calculator",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'M'
                            ? Color.fromARGB(255, 252, 182, 182)
                            : Color.fromARGB(
                                255, 255, 221, 221), // Background color
                        borderRadius: BorderRadius.circular(
                            15), // Rounds all corners with a radius of 15
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.male, size: 130),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: gender == 'F'
                            ? Color.fromARGB(255, 252, 182, 182)
                            : Color.fromARGB(
                                255, 255, 221, 221), // Background color
                        borderRadius: BorderRadius.circular(
                            15), // Rounds all corners with a radius of 15
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: const [
                          Text(
                            "Female",
                            style: TextStyle(fontSize: 20),
                          ),
                          Icon(Icons.female, size: 130),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "$height",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (height > 50) {
                                    height--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "Weight",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "$weight",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: kTextColor,
                          ),
                        ),
                        Row(
                          children: [
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                });
                              },
                              child: Icon(
                                Icons.add,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 20) {
                                    weight--;
                                    bmi = calculateBMI(
                                        height: height, weight: weight);
                                  }
                                });
                              },
                              child: Icon(
                                Icons.remove,
                                size: 30,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    "BMI Value",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(bmi.toStringAsFixed(2),
                      style: TextStyle(
                          color: const Color.fromARGB(255, 110, 110, 110),
                          fontSize: 60,
                          fontWeight: FontWeight.bold)),
                  Text(
                    getResult(bmi),
                    style: TextStyle(fontSize: 25, color: getColor(bmi)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateBMI({required height, required int weight}) {
    return weight / (0.01 * height * 0.01 * height);
  }

  String getResult(bmiValue) {
    if (bmiValue >= 25) {
      return 'OverWeight';
    } else if (bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWight';
    }
  }

  Color getColor(bmi) {
    if (bmi >= 25) {
      return Color.fromARGB(255, 255, 1, 1);
    } else if (bmi >= 18.5) {
      return Color.fromARGB(255, 73, 255, 1);
    } else {
      return Color.fromARGB(255, 255, 145, 1);
    }
  }
}
