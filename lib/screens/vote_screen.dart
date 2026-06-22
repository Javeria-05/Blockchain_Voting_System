import 'package:flutter/material.dart';
import 'result_screen.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  String? selectedCandidate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cast Your Vote"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Select One Candidate",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            RadioListTile<String>(
              title: const Text("Ahmed"),
              value: "Ahmed",
              groupValue: selectedCandidate,
              onChanged: (value) {
                setState(() {
                  selectedCandidate = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("Bilal"),
              value: "Bilal",
              groupValue: selectedCandidate,
              onChanged: (value) {
                setState(() {
                  selectedCandidate = value;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text("Fatima"),
              value: "Fatima",
              groupValue: selectedCandidate,
              onChanged: (value) {
                setState(() {
                  selectedCandidate = value;
                });
              },
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                if (selectedCandidate != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        candidate: selectedCandidate!,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Please select a candidate first",
                      ),
                    ),
                  );
                }
              },
              child: const Text("Submit Vote"),
            ),
          ],
        ),
      ),
    );
  }
}