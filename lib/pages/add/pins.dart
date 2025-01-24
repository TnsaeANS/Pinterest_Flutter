import 'package:flutter/material.dart';

class PinsScreen extends StatelessWidget {
  const PinsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/1.jpg',
      'assets/37.jpg',
      'assets/2.jpg',
      'assets/19.jpg',
      'assets/20.jpg',
      'assets/21.jpg',
      'assets/22.jpg',
      'assets/23.jpg',
      'assets/24.jpg',
      'assets/25.jpg',
      'assets/26.jpg',
      'assets/27.jpg',
      'assets/28.jpg',
      'assets/29.jpg',
      'assets/30.jpg',
      'assets/31.jpg',
      'assets/32.jpg',
      'assets/33.jpg',
      'assets/34.jpeg',
      'assets/35.jpeg',
      'assets/36.jpeg',
      'assets/38.jpg',
      'assets/39.jpg',
      'assets/40.jpg',
      'assets/41.jpg',
      'assets/42.png',
      'assets/43.jpg',
      'assets/44.png',
      'assets/45.png',
      'assets/46.jpg',
      'assets/47.jpg',
      'assets/48.jpg',
      'assets/49.jpg',
      'assets/50.jpg',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
            color: Color.fromARGB(255, 210, 210, 210),
          ),
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
  icon: const Icon(
    Icons.question_mark,
    color: Colors.grey,
    size: 20,
  ),
  onPressed: () {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // First Group (Support group)
          Column(
            children: [
              ListTile(
                title: const Text(
                  'Support',
                  style: TextStyle(color: Color.fromARGB(255, 208, 205, 205), fontSize: 14),
                ),
                onTap: () {
                  // Handle support action
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'How to create pins',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle how-to action
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'Best practices',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle best practices action
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'Analytics help center',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle analytics help
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'Creator code',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle creator code action
                },
              ),
            ],
          ),
          // Second Group (Contact Us group)
          Column(
            children: [
              ListTile(
                title: const Text(
                  'Contact us',
                  style: TextStyle(color: Color.fromARGB(255, 208, 205, 205), fontSize: 14),
                ),
                onTap: () {
                  // Handle contact us action
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'Share feedback',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle feedback action
                },
              ),
              const SizedBox(height: 5), // 5px spacing between items
              ListTile(
                title: const Text(
                  'Get help',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  // Handle get help action
                },
              ),
            ],
          ),
        ],
      ),
    );
  },
)
,
            const Expanded(
              child: Center(
                child: Text(
                  'Add Photos',
                  style: TextStyle(
                    color: Color.fromARGB(255, 215, 213, 213),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
        backgroundColor: const Color(0xFF1A1A1A),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 158, 156, 156),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Next', style: TextStyle(color: Colors.white)),
              onPressed: () {
                // Handle Next button
              },
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('Tapped on image $index');
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePaths[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[800],
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 130.0),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey[800],
                child: const Icon(
                  Icons.public,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: const Icon(
                  Icons.folder,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
