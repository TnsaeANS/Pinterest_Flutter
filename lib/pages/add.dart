import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add')),
      body: const Center(
        child: Text(
          'This is the Add Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
