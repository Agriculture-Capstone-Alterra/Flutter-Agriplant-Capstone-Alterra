import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPage extends StatefulWidget {
  const NumberPage({super.key});

  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  var hour = 0;
  var minute = 0;
  var timeFormat = "AM";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //     "Pick Your Time! ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, "0")} ${timeFormat}",
            //     style:
            //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            // const SizedBox(
            //   height: 20,
            // ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberPicker(
                    minValue: 0,
                    maxValue: 12,
                    value: hour,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      setState(() {
                        hour = value;
                      });
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                          bottom: BorderSide(color: Colors.white)),
                    ),
                  ),
                  NumberPicker(
                    minValue: 0,
                    maxValue: 59,
                    value: minute,
                    zeroPad: true,
                    infiniteLoop: true,
                    itemWidth: 80,
                    itemHeight: 60,
                    onChanged: (value) {
                      setState(() {
                        minute = value;
                      });
                    },
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 20),
                    selectedTextStyle:
                        const TextStyle(color: Colors.white, fontSize: 30),
                    decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                          bottom: BorderSide(color: Colors.white)),
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            timeFormat = "AM";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: timeFormat == "AM"
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade700,
                              border: Border.all(
                                color: timeFormat == "AM"
                                    ? Colors.grey
                                    : Colors.grey.shade700,
                              )),
                          child: const Text(
                            "AM",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            timeFormat = "PM";
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: timeFormat == "PM"
                                ? Colors.grey.shade800
                                : Colors.grey.shade700,
                            border: Border.all(
                              color: timeFormat == "PM"
                                  ? Colors.grey
                                  : Colors.grey.shade700,
                            ),
                          ),
                          child: const Text(
                            "PM",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}