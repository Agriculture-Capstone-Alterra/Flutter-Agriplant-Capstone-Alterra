import 'package:capstone_project/providers/plant_reminder_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
        );
      },
    );
  }
}
