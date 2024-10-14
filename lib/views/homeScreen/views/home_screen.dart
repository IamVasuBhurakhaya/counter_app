import 'package:counter_app/views/homeScreen/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterProvider>().clear();
            },
            icon: Icon(
              Icons.refresh,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 6,
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              height: 120,
              width: 120,
              child: Center(
                child: Text(
                  "${context.watch<CounterProvider>().i}",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCounterButton(context, "+", () {
                  context.read<CounterProvider>().increment();
                }),
                _buildCounterButton(context, "-", () {
                  context.read<CounterProvider>().decrement();
                }),
                _buildCounterButton(context, "2X", () {
                  context.read<CounterProvider>().twoX();
                }),
                _buildCounterButton(context, "3X", () {
                  context.read<CounterProvider>().threeX();
                }),
                _buildCounterButton(context, "4X", () {
                  context.read<CounterProvider>().fourX();
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Function to build custom styled counter buttons
  ElevatedButton _buildCounterButton(
      BuildContext context, String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.black45,
        elevation: 6,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
