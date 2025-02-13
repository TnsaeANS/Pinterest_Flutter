import 'package:flutter/material.dart';
import 'chat_detail_screen.dart';
import 'new_message_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          tabs: const [
            Tab(text: 'Updates'),
            Tab(text: 'Messages'),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0, // Removes the thin line under the indicator
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpdatesTab(),
          _buildMessagesTab(),
        ],
      ),
    );
  }

  Widget _buildUpdatesTab() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        Text('New', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey),
          title: Text('Christian Lifestyle for you', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          trailing: Text('3h', style: TextStyle(color: Colors.grey)),
        ),
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey),
          title: Text("You'd vibe with this", style: TextStyle(color: Colors.white)),
          trailing: Text('11h', style: TextStyle(color: Colors.grey)),
        ),
        SizedBox(height: 10),
        Text('Seen', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey),
          title: Text('Try searching for more ideas', style: TextStyle(color: Colors.white)),
          trailing: Text('1d', style: TextStyle(color: Colors.grey)),
        ),
        ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey),
          title: Text("Women's Fashion for you", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          trailing: Text('1d', style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }

  Widget _buildMessagesTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewMessageScreen()),
              );
            },
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 25,
                  child: Icon(Icons.edit, color: Colors.white),
                ),
                const SizedBox(width: 10),
                const Text(
                  'New message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Text(
            'Contacts',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        ListTile(
          leading: const CircleAvatar(backgroundColor: Colors.grey),
          title: const Text(
            'beza',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Last seen recently',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChatDetailScreen(contactName: 'Dummy Contact'),
              ),
            );
          },
        ),
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(Icons.person_add, color: Colors.white),
          ),
          title: const Text(
            'Invite your friends',
            style: TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'Connect to start chatting',
            style: TextStyle(color: Colors.grey),
          ),
          onTap: () {
            // Invite friends action
          },
        ),
      ],
    );
  }
}
