import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class BoardsScreen extends StatelessWidget {
  final List<String> imagePaths = [
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
    'assets/51.jpg',
    'assets/52.jpg',
    'assets/53.jpg',
    'assets/54.jpg',
    'assets/55.jpg',
    'assets/56.jpg',
    'assets/57.jpg',
    'assets/58.jpg',
    'assets/59.jpg',
    'assets/60.jpg',
    'assets/61.jpg',
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

  BoardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 5),
             CircleAvatar(
                backgroundImage: AssetImage('assets/profile.png'),
                radius: 15,
            ),
            const SizedBox(width: 80),
            Column(
              children: [
GestureDetector(
  onTap: () {
      Navigator.of(context).popUntil((route) => route.isFirst);
  },
  child: const Text(
    "Pins",
    style: TextStyle(
      fontSize: 17,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),
),
                const SizedBox(height: 4),
                
              ],
            ),
            const SizedBox(width: 25),
            Column(
              children: [
          const Text(
              "Boards",
              style: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          
          const SizedBox(height: 5),
          Container(
                  width: 50,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
        ],
            ),
          ],
        ),
      ),
      
      backgroundColor: MainColor.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            // First Row
            SizedBox(
              width: 380,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search for ideas',
                          prefixIcon: Icon(Icons.search,
                              color: const Color.fromARGB(234, 90, 90, 90)),
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
                    const SizedBox(width: 10), // Optional spacing
                    const Icon(Icons.add,
                        size: 40, color: Color.fromARGB(255, 255, 255, 255)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 15),
                Container(
                  width: 59,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 4),
                      Icon(
                        Icons.swap_vert,
                        color: Colors.white,
                        size: 23,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 70,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Group',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  width: 75,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 2),
                      Text(
                        'Secret',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),

            
           
  // first board         
  Row(
    children: [
      Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Column(
    children: [
      SizedBox(
        width: 170,
        height: 150,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  imagePaths[2],
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              SizedBox(width: 1),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        imagePaths[1],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    SizedBox(height: 1),
                    Expanded(
                      child: Image.asset(
                        imagePaths[3],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      const Text(
        'Abstract', // Replace with your desired text
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),

      Row(
        children: [
          const Text(
            '19 Pins', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 3),
          const Text(
            '1W', // Replace with your desired text
            style: TextStyle(
              color: Color.fromARGB(131, 255, 255, 255),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ],
  ),
),
        
      
      
      // second board         
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          SizedBox(
        width: 170,
        height: 150,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              imagePaths[5],
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          SizedBox(width: 1),
          Expanded(
            flex: 1,
            child: Column(
              children: [
            Expanded(
              child: Image.asset(
                imagePaths[6],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              child: Image.asset(
                imagePaths[8],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
              ],
            ),
          ),
            ],
          ),
        ),
          ),
          const Text(
        'Nature', // Replace with your desired text
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
          ),
          Row(
        children: [
          const Text(
            '25 Pins', // Replace with your desired text
            style: TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 3),
          const Text(
            '2W', // Replace with your desired text
            style: TextStyle(
          color: Color.fromARGB(131, 255, 255, 255),
          fontSize: 10,
          fontWeight: FontWeight.w500,
            ),
          ),
        ],
          ),
        ],
      ),
      ),
    ],
  ),

SizedBox(height: 20),
  // second row board         
  Row(
    children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[11],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[12],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[13],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Cats', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '30 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '3W', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),
        
      
      // second board         
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[31],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[32],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[33],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Arts', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '40 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '1D', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),    ],
  ),

  SizedBox(height: 20),
  // 3rd row board         
  Row(
    children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[24],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[27],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[29],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Pretty Stress', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '10 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '4W', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),
        
        
      // second board         
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[21],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[26],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[20],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Oldies', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '10 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '4W', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),
    ],
  ),

  SizedBox(height: 20),
  // lat row board         
  Row(
    children: [
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[18],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[19],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[22],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Houses', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '15 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '1W', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),
        
      
      
      // last board         
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          SizedBox(
            width: 170,
            height: 150,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      imagePaths[15],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  SizedBox(width: 1),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            imagePaths[16],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Image.asset(
                            imagePaths[18],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Text(
            'Music Bands', // Replace with your desired text
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              const Text(
                '35 Pins', // Replace with your desired text
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 3),
              const Text(
                '1M', // Replace with your desired text
                style: TextStyle(
                  color: Color.fromARGB(131, 255, 255, 255),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      )
        ),
    ],
  ),

  SizedBox(height: 20),
  ],)
),);
}

void main() {
  runApp(MaterialApp(
    home: BoardsScreen(),
  ));
}
}