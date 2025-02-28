import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminReport extends StatelessWidget {
  const AdminReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us Report',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromRGBO(6, 40, 30, 1), // Dark green
      ),
      //https://cdn.shopify.com/s/files/1/0269/0554/2755/files/1633958248894_480x480.jpg?v=1633960245
      body: Stack(
        children: [
          Opacity(
            opacity: 0.5, // Adjust this value for the fade effect
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://images7.alphacoders.com/107/thumb-1920-1079694.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('ContactSubmissions')
                .orderBy('timestamp', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                  child: Text(
                    'No submissions found.',
                    style: TextStyle(
                      color: Color.fromRGBO(6, 40, 30, 1),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }

              final submissions = snapshot.data!.docs;

              return ListView.builder(
                itemCount: submissions.length,
                itemBuilder: (context, index) {
                  final submission = submissions[index];
                  final data = submission.data() as Map<String, dynamic>;

                  return Card(
                    color: const Color.fromRGBO(
                        232, 241, 236, 1), // Slightly off-white card color
                    shadowColor: const Color.fromRGBO(
                        6, 40, 30, 0.5), // Subtle green shadow
                    elevation: 4.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${data['name'] ?? 'N/A'}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Color.fromRGBO(6, 40, 30, 1),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Email: ${data['email'] ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Phone: ${data['phone'] ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Message: ${data['message'] ?? 'N/A'}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Submitted At: ${data['timestamp'] != null ? (data['timestamp'] as Timestamp).toDate().toString() : 'N/A'}',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
