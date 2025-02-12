import 'package:flutter/material.dart';
import 'package:pinterest_flutter/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      appBar: 
      AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      title: 
      Padding(
  padding: const EdgeInsets.all(15.0),
  child: Stack(
    alignment: Alignment.center, 
    children: [      
     Align(
  alignment: Alignment.centerLeft,
  child: GestureDetector(
    onTap: () {
      Navigator.of(context).pop();
    },
    child: Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
      size: 20,
    ),
  ),
),
      Text(
        'Your Account',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  ),
)
),


body: Padding(
  padding: const EdgeInsets.all(15.0),
  child: SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 20), 
        Row(
          
          children:[
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            SizedBox(width: 15), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  Text(
                    'View Profile',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),


SizedBox(height: 40),
        Row(
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 214, 214, 214),
              ),
            ),
          ],
        ),
SizedBox(height: 20),
         Row(
          children: [
            Text(
              'Account Management',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Spacer(),
             Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 20),
      Row(
          children: [
            Text(
              'Profile visibility',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            Spacer(),
             Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
  children: [
    Text(
      'Home feed tuner',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 20), 
Row(
  children: [
    Text(
      'Claimed accounts',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 20), 
Row(
  children: [
    Text(
      'Social permissions',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 20), 
Row(
  children: [
    Text(
      'Notifications',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 20), 
Row(
  children: [
    Text(
      'Privacy and data',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 20), 
Row(
  children: [
    Text(
      'Reports and violations centre',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height: 40),
      Row(  
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 214, 214, 214),
              ),
            ),
          ],
        ),
SizedBox(height:20),

Row(
  children: [
    Text(
      'Add account',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),

SizedBox(height:10),

Row(
  children: [
    Text(
      'Security',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height:10),

Row(
  children: [
    Text(
      'Log out',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),

SizedBox(height: 40),
      Row(  
          children: [
            Text(
              'Support',
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(255, 214, 214, 214),
              ),
            ),
          ],
        ),

SizedBox(height:20),

Row(
  children: [
    Text(
      'Help Centre',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
            ),
    ),
    Spacer(),
    Icon(
      Icons.north_east,

      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height:10),

Row(
  children: [
    Text(
      'Terms of Service',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.north_east,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height:10),

Row(
  children: [
    Text(
      'Privacy Policy',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.north_east,
      size: 20,
      color: Colors.white,
    ),
  ],
),
SizedBox(height:10),

Row(
  children: [
    Text(
      'About',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),
    ),
    Spacer(),
    Icon(
      Icons.arrow_forward_ios,
      size: 20,
      color: Colors.white,
    ),
  ],
),
      ],
    ),
    
    
  ),
)



);
}
}
