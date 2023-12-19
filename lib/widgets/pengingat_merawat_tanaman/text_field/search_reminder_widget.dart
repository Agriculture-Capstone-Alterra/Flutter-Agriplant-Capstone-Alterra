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
              plantReminderProvider.updateSearchQuery(query);
            },
            decoration: InputDecoration(
              hintText: 'Cari Tanaman',
              prefixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.black, 
                  width: 1.5,           
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Colors.black, 
                  width: 1.5,           
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 0, 0, 0), 
                  width: 1.5,       
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
