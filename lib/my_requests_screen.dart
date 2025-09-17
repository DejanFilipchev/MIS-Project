import 'package:flutter/material.dart';
import 'package:mis_project/request_storage.dart';
import 'package:mis_project/request_model.dart';

class MyRequestsScreen extends StatefulWidget {
  const MyRequestsScreen({super.key});

  @override
  State<MyRequestsScreen> createState() => _MyRequestsScreenState();
}

class _MyRequestsScreenState extends State<MyRequestsScreen> {
  void _openNewRequest() async {
    await Navigator.pushNamed(context, '/newRequest');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Request> requests = RequestStorage().requests;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Мои Барања"),
      ),
      body: requests.isEmpty
          ? const Center(child: Text("Немате креирано барања"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Датум од: ${req.fromDate != null ? "${req.fromDate!.day}/${req.fromDate!.month}/${req.fromDate!.year}" : "-"}"),
                Text("Датум до: ${req.toDate != null ? "${req.toDate!.day}/${req.toDate!.month}/${req.toDate!.year}" : "-"}"),
                Text("Причина: ${req.reason}"),
                Text("Држава: ${req.country}"),
                Text("УКИМ проект: ${req.ukimProject == true ? "Да" : "Не"}"),
                Text("Настава: ${req.lessonInfo}"),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openNewRequest,
        child: const Icon(Icons.add),
      ),
    );
  }
}
