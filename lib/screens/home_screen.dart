import 'package:flutter/material.dart';
import 'vote_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voter Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.how_to_vote,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 20),

                const Text(
                  "Welcome Voter",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VoteScreen(),
                      ),
                    );
                  },
                  child: const Text("Cast Vote"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}