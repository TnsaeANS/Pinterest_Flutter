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
    children: [
      const Text(
        'New',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
           backgroundImage: AssetImage('assets/50.jpg'), // Replace with your image URL
        ),
        title: const Text(
          'Christian Lifestyle for you',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: const Text('3h', style: TextStyle(color: Colors.grey)),
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage('assets/12.jpg'), // Replace with your image URL
        ),
        title: const Text(
          "You'd vibe with this",
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Text('11h', style: TextStyle(color: Colors.grey)),
      ),
      const SizedBox(height: 10),
      const Text(
        'Seen',
        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
           backgroundImage: AssetImage('assets/20.jpg'), // Replace with your image URL
        ),
        title: const Text(
          'Try searching for more ideas',
          style: TextStyle(color: Colors.white),
        ),
        trailing: const Text('1d', style: TextStyle(color: Colors.grey)),
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
           backgroundImage: AssetImage('assets/40.jpg'), // Replace with your image URL
        ),
        title: const Text(
          "Women's Fashion for you",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: const Text('1d', style: TextStyle(color: Colors.grey)),
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
            _showInviteFriendsSheet(context);
          },
        ),
      ],
    );
  }

  void _showInviteFriendsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Text("Share", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                // Share Options Row
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildShareOption("Copy link", Icons.link),
                      _buildShareOption("WhatsApp", Icons.phone, color: Colors.green),
                      _buildShareOption("Messages", Icons.message, color: Colors.greenAccent),
                      _buildShareOption("Mail", Icons.mail, color: Colors.grey),
                      _buildShareOption("X", Icons.cancel), // Replace with actual X logo
                      _buildShareOption("Instagram", Icons.camera_alt, color: Colors.purple),
                      _buildShareOption("Telegram", Icons.telegram, color: Colors.blue),
                    ],
                  ),
                ),

                const SizedBox(height: 10),
                const Divider(color: Colors.grey),

                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search contacts",
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey[900],
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
const SizedBox(height: 10),

                // Contacts List
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 1, // Change this dynamically for real data
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const CircleAvatar(backgroundColor: Colors.grey),
                        title: const Text("beza", style: TextStyle(color: Colors.white)),
                        subtitle: const Text("@beazanesh", style: TextStyle(color: Colors.white70)),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.grey[800]),
                          onPressed: () {},
                          child: const Text("Send", style: TextStyle(color: Colors.white)),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildShareOption(String label, IconData icon, {Color color = Colors.white}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.grey[850], radius: 25, child: Icon(icon, color: color, size: 28)),
          const SizedBox(height: 5),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}