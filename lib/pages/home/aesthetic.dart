import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class AestheticPage extends StatefulWidget {
  const AestheticPage({super.key});

  @override
  _AestheticPageState createState() => _AestheticPageState();
}

class _AestheticPageState extends State<AestheticPage> {
  int _selectedIndex = 0; // Track the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  final List<String> imagePaths = [
    'assets/31.jpg',
    'assets/30.jpg',
    'assets/32.jpg',
    'assets/33.jpg',
    'assets/38.jpg',
    'assets/34.jpg',
    'assets/35.jpg',
    'assets/39.jpg',
    'assets/36.jpg',
    'assets/37.jpg',
    'assets/38.jpg',
    'assets/40.jpg',
    'assets/41.jpg',
    'assets/42.jpg',
    'assets/43.jpg',
    'assets/44.jpg',
    'assets/45.jpg',
    'assets/46.jpg',
    'assets/47.jpg',
    'assets/48.jpg',
    'assets/49.jpg',
    'assets/50.jpg',
    'assets/51.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MasonryGridView.builder(
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: imagePaths.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image card with fixed aspect ratio
                      Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: AspectRatio(
                          aspectRatio: 3 / 4,
                          child: Image.asset(
                            imagePaths[index],
                            fit: BoxFit.cover,
                          ),
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
          ),
        ],
      ),
    );
  }
}
