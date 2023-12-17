import 'package:capstone_project/providers/plant_reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class SearchAllPlants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlantReminderProvider>(
      builder: (context, plantReminderProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (query) {
              // Update the search query in the provider
              plantReminderProvider.updateSearchQuery(query);
            },
            decoration: InputDecoration(
              hintText: 'Cari Tanaman',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.black, // Set the border color to black
                  width: 1.5,           // Set the border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.black, // Set the border color to black
                  width: 1.5,           // Set the border width
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0), // Set the border color for disabled state
                  width: 1.5,           // Set the border width for disabled state
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
