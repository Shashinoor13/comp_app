import 'package:flutter/material.dart';

class RecommendedPlaces extends StatelessWidget {
  const RecommendedPlaces({super.key});

  final List<Map<String, dynamic>> places = const [
    {
      'image': 'assets/Scenery.png',
      'title': 'Kathmandu',
      'distance': '15 KM',
      'subtitle': 'City full of temples and monkeys',
    },
    {
      'image': 'assets/Scenery.png',
      'title': 'Chitwan',
      'distance': '50 KM',
      'subtitle': 'Meet the wildlife',
    },
    {
      'image': 'assets/Scenery.png',
      'title': 'Pokhara',
      'distance': '90 KM',
      'subtitle': 'Tourist’s hub',
    },
    {
      'image': 'assets/Scenery.png',
      'title': 'Dhangadhi',
      'distance': '185 KM',
      'subtitle': 'Beauty of Far-West',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recommended Places",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  color: Colors.blue.shade400,
                  splashColor: Colors.blue.shade100,
                  onPressed: () {},
                  icon: Icon(Icons.chevron_right_rounded,
                      color: Colors.blue.shade300))
            ],
          ),
          Container(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: places.length,
              itemBuilder: (context, index) {
                final place = places[index];
                return Column(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        place['image'],
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        place['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place['distance'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            place['subtitle'],
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    if (index < places.length - 1)
                      const Divider(), // Add a divider between the tiles
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
