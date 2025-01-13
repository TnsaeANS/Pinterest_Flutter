import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';
class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<String> descriptions = [
      'Tree Ideas',
      'Metal Fans',
      'Glass Art',
      'Funny Meme',
      'Pixel Art',
      'Flowers',
    ];

    List<String> descriptionz = [
      'Music Video',
      'Pokemon',
      'Pretty Trees',
      'Pickachu',
      'Quotes',
      'tumblr',
    ];

    List<String> imagePaths = [
      'assets/22.jpg',
      'assets/23.jpg',
      'assets/24.jpg',
      'assets/25.jpg',
      'assets/26.jpg',
      'assets/27.jpg',
    ];

    List<String> imagePathz = [
      'assets/28.jpg',
      'assets/29.jpg',
      'assets/30.jpg',
      'assets/31.jpg',
      'assets/32.jpg',
      'assets/33.jpg',
    ];

    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              width: screenWidth,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  
                  decoration: InputDecoration(
                    hintText: 'Search for ideas',
                    prefixIcon: Icon(Icons.search, color: const Color.fromARGB(234, 90, 90, 90)),
                    suffixIcon: Icon(Icons.camera_alt, color: const Color.fromARGB(234, 90, 90, 90)),
                    hintStyle: TextStyle(fontSize: 15, color: const Color.fromARGB(94, 228, 228, 228)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(28, 218, 218, 218),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Section: Ideas for you
            Center(
              child: Text(
                "Ideas for you",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              ),
            MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: imagePaths.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // Ensures the grid takes only the required space
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePaths[index]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(97, 37, 37, 37),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    height: 90,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                      crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
                      children: [
                        Text(
                          descriptions[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center, // Aligns text to the center
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // Section: Popular on Pinterest
            Center(
              child: Text(
                "Popular on Pinterest",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            MasonryGridView.builder(
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: imagePathz.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, // Ensures the grid takes only the required space
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(imagePathz[index]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(97, 37, 37, 37),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                    height: 90,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
                      crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
                      children: [
                        Text(
                          descriptionz[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center, // Aligns text to the center
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}