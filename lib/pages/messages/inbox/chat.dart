import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';


class NewMessageScreen extends StatefulWidget {
  const NewMessageScreen({super.key});

  @override
  _NewMessageScreenState createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends State<NewMessageScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> contacts = ['Beza', 'Alice', 'Bob']; // Dummy contacts
  List<String> filteredContacts = [];
  String? selectedContact;

  @override
  void initState() {
    super.initState();
    filteredContacts = contacts;
  }

  void _filterContacts(String query) {
    setState(() {
      filteredContacts = contacts
          .where((contact) => contact.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('New message'),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: selectedContact != null
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(contactName: selectedContact!),
                      ),
                    );
                  }
                : null,
            child: const Text(
              'Next',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              onChanged: _filterContacts,
              decoration: InputDecoration(
                hintText: 'Search by name or email',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.grey),
                  title: Text(
                    contact,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "$contact@gmail.com",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: selectedContact == contact
                      ? const Icon(Icons.check, color: Colors.white)
                      : null,
                  onTap: () {
                    setState(() {
                      selectedContact = contact;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
