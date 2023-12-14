import 'package:flutter/material.dart';

class IsSearchingTrue extends StatefulWidget {
  const IsSearchingTrue({Key? key}) : super(key: key);

  @override
  State<IsSearchingTrue> createState() => _IsSearchingTrueState();
}

class _IsSearchingTrueState extends State<IsSearchingTrue> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 22,),

        Container(
          width: double.infinity,
          child: Text('History'),
        ),

        SizedBox(height: 18,),

        Container(
            width: double.infinity,
            child: Text('Rekomendasi'),
        ),
      ],
    );
  }
}