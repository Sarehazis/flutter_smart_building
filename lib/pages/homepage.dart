import 'package:flutter/material.dart';
import 'package:smartbuilding/pages/profile_page.dart';

class HomepageApp extends StatefulWidget {
  const HomepageApp({super.key});

  @override
  State<HomepageApp> createState() => _HomepageAppState();
}

class _HomepageAppState extends State<HomepageApp> {
  List<bool> switchValues = [false, false, false, false];

  final List<Map<String, dynamic>> features = [
    {
      'title': 'Smart AC',
      'icon': Icons.ac_unit,
    },
    {
      'title': 'Smart Lamp',
      'icon': Icons.lightbulb_outline,
    },
    {
      'title': 'Smart Door',
      'icon': Icons.door_back_door,
    },
    {
      'title': 'Smart Fan',
      'icon': Icons.mode_fan_off,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 28, 163),
        title: const Text(
          'Halo, Sareh Azis Panegar',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilesApp()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                backgroundImage: AssetImage('images/my_profile.png'),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 59, 28, 163),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.30),
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  features[index]['icon'],
                  size: 50,
                  color: Colors.white,
                ),
                const SizedBox(height: 10),
                Text(
                  features[index]['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                Switch(
                  value: switchValues[index],
                  onChanged: (value) {
                    setState(() {
                      switchValues[index] = value;
                    });
                  },
                  activeColor: Colors.white,
                  inactiveTrackColor: Colors.grey[300],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
