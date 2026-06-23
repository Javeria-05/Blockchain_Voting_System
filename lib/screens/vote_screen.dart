import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'result_screen.dart';

class VoteScreen extends StatefulWidget {
  const VoteScreen({super.key});

  @override
  State<VoteScreen> createState() => _VoteScreenState();
}

class _VoteScreenState extends State<VoteScreen> {
  String? selectedCandidate;
  String? selectedCandidateId;

  Future<void> submitVote() async {
    if (selectedCandidateId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a candidate first"),
        ),
      );
      return;
    }

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please login first"),
          ),
        );
        return;
      }

      // Check if user already voted
      final voteDoc = await FirebaseFirestore.instance
          .collection('votes')
          .doc(user.uid)
          .get();

      if (voteDoc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You have already voted"),
          ),
        );
        return;
      }

      // Save vote
      await FirebaseFirestore.instance
          .collection('votes')
          .doc(user.uid)
          .set({
        'candidate': selectedCandidate,
        'candidateId': selectedCandidateId,
        'userId': user.uid,
        'votedAt': Timestamp.now(),
      });

      // Increase candidate vote count
      await FirebaseFirestore.instance
          .collection('candidates')
          .doc(selectedCandidateId)
          .update({
        'votes': FieldValue.increment(1),
      });

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              candidate: selectedCandidate!,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: $e",
          ),
        ),
      );
    }
  }

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

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('candidates')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error loading candidates"),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  final candidates = snapshot.data!.docs;

                  if (candidates.isEmpty) {
                    return const Center(
                      child: Text(
                        "No Candidates Added Yet",
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: candidates.length,
                    itemBuilder: (context, index) {
                      final candidate = candidates[index];

                      return RadioListTile<String>(
                        title: Text(candidate['name']),
                        value: candidate['name'],
                        groupValue: selectedCandidate,
                        onChanged: (value) {
                          setState(() {
                            selectedCandidate = value;
                            selectedCandidateId = candidate.id;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: submitVote,
                child: const Text("Submit Vote"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}