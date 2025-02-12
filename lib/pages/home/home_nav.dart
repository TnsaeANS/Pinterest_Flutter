import 'package:flutter/material.dart';

class HomeNavBar extends StatelessWidget {
  final Function(int) onPageChanged;
  final int currentIndex;

  const HomeNavBar({super.key, required this.onPageChanged, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,  // Keep it at the top
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.black,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => onPageChanged(0),
                child: Column(
                  children: [
                    Text(
                      "All",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (currentIndex == 0)
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () => onPageChanged(1),
                child: Column(
                  children: [
                    Text(
                      "Aesthetic",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (currentIndex == 1)
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
