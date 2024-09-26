import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  var tap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContaner"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              tap = !tap;
            });
          },
          child: AnimatedContainer(
            width: tap ? 350 : 100,
            height: tap ? 350 : 100,
            duration: Duration(milliseconds: 800),
            curve: Curves.bounceOut,
            decoration: BoxDecoration(
              color: tap ? Colors.greenAccent : Colors.orangeAccent,
              borderRadius: BorderRadius.circular(50),  // 둥글게 만들기
            ),
          ),
        ),
      ),
    );
  }
}
