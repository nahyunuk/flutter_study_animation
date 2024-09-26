import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  const AnimatedDefaultTextStylePage({super.key});

  @override
  State<AnimatedDefaultTextStylePage> createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  var tap = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDefaultTextStyle"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            setState(() {
              tap = !tap;
            });
          },
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeOut,
            style: TextStyle(fontSize:tap? 50 : 70, fontWeight: tap? FontWeight.w100 : FontWeight.bold,color: tap? Colors.orangeAccent : Colors.greenAccent),
            child: Text("Change"),
          ),
        ),
      ),
    );
  }
}
