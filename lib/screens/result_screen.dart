import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String candidate;

  const ResultScreen({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voting Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 80,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Vote Successfully Cast!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  "You voted for: $candidate",
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}