import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';
import 'dart:math';

class HomePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/1.jpg',
    'assets/37.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/38.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/39.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg',
    'assets/11.jpg',
    'assets/12.jpg',
    'assets/13.jpg',
    'assets/14.jpg',
    'assets/15.jpg',
    'assets/16.jpg',
    'assets/17.jpg',
    'assets/18.jpg',
    'assets/19.jpg',
    'assets/20.jpg',
    'assets/21.jpg',
  ];

  HomePage({super.key});

  void _showImagePopup(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenImagePage(
          imagePath: imagePaths[index],
          index: index,
          imagePaths: imagePaths,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5.0, 50.0, 5.0, 5.0),
        child: MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image card
                GestureDetector(
                  onTap: () => _showImagePopup(context, index),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Bar under the image
                Container(
                  height: 40,
                  color: Colors.black.withOpacity(0.7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      PopupMenuButton<String>(
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ),
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'save',
                            child: Text('Save'),
                          ),
                          const PopupMenuItem(
                            value: 'download',
                            child: Text('Download'),
                          ),
                          const PopupMenuItem(
                            value: 'share',
                            child: Text('Share'),
                          ),
                          const PopupMenuItem(
                            value: 'pin',
                            child: Text('Pin'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imagePath;
  final int index;
  final List<String> imagePaths;

  const FullScreenImagePage({
    super.key,
    required this.imagePath,
    required this.index,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            20.0), 
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromARGB(131, 0, 0, 0),
                        radius: 20,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              size: 25),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    // Circular icons (optional)
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(131, 0, 0, 0),
                            radius: 25,
                            child: Icon(Icons.search_outlined,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          CircleAvatar(
                            backgroundColor: const Color.fromARGB(131, 0, 0, 0),
                            radius: 25,
                            child: Icon(Icons.cut, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Space between image and icons
                // Row of icons underneath the image
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Icon(Icons.favorite_outline, color: Colors.white),
                    SizedBox(width: 5),
                    Text('109',
                        style: TextStyle(fontSize: 10, color: Colors.white)),
                    SizedBox(width: 20),
                    Icon(Icons.chat_bubble_outline_rounded,
                        color: Colors.white),
                    SizedBox(width: 5),
                    Text('9',
                        style: TextStyle(fontSize: 10, color: Colors.white)),
                    SizedBox(width: 20),
                    Icon(Icons.share, color: Colors.white),
                    SizedBox(width: 20),
                    Icon(Icons.more_horiz, color: Colors.white),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFAD0922),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      clipBehavior: Clip.antiAlias,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/38.jpg'),
                      radius: 10,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Boink',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'What do you think?',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.png'),
                      radius: 23,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Add a Comment',
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: const Color.fromARGB(94, 228, 228, 228)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: const Color.fromARGB(28, 218, 218, 218),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50),
                Container(
                  height: 1, // Thin line
                  color: const Color.fromARGB(41, 141, 141, 141), // Line color
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15),
                    Text(
                      'More to explore',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),

                Column(
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MasonryGridView.builder(
                    gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, randomIndex) {
                      final random = Random();

                      final shuffledImages = List.from(imagePaths)
                      ..shuffle(random);

                      return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Image.asset(
                          shuffledImages[randomIndex % shuffledImages.length],
                          fit: BoxFit.contain,
                        ),
                        ),
                        // Bar under the image
                        Container(
                        height: 40, // Height of the bar
                        color: Colors.black.withOpacity(0.7), // Semi-transparent bar
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end, // Align icon to the right
                          children: [
                          PopupMenuButton<String>(
                            icon: const Icon(
                            Icons.more_horiz, // Horizontal "..." icon
                            color: Colors.white,
                            ),
                            itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'save',
                              child: Text('Save'),
                            ),
                            const PopupMenuItem(
                              value: 'download',
                              child: Text('Download'),
                            ),
                            const PopupMenuItem(
                              value: 'share',
                              child: Text('Share'),
                            ),
                            const PopupMenuItem(
                              value: 'pin',
                              child: Text('Pin'),
                            ),
                            ],
                          ),
                          ],
                        ),
                        ),
                      ],
                      );
                    },
                    ),
                  ),
                  ],
                ),
                

                SizedBox(height: 25),
              ],
            ),
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
