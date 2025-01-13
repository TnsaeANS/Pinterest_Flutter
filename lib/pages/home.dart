import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Padding(
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
                // Image card
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    imagePaths[index],
                    fit: BoxFit.cover,
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
                        onSelected: (value) {
                          switch (value) {
                            case 'save':
                              // Handle save action
                              break;
                            case 'download':
                              // Handle download action
                              break;
                            case 'share':
                              // Handle share action
                              break;
                            case 'pin':
                              // Handle pin action
                              break;
                          }
                        },
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
