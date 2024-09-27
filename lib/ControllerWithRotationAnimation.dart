import 'package:flutter/material.dart';

class ControllerWithRotationAnimation extends StatefulWidget {
  const ControllerWithRotationAnimation({super.key});

  @override
  State<ControllerWithRotationAnimation> createState() =>
      _ControllerWithRotationAnimationState();
}

class _ControllerWithRotationAnimationState
    extends State<ControllerWithRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ControllerWithAnimatedAlign"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * 3.1416,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.accessibility,
                    size: 100,
                  ),
                );
              }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ElevatedButton(onPressed: (){
                if(_controller.value == 1){
                  _controller.value = 0;
                  _controller.forward();
                }
                else{
                  _controller.forward();
                }
              }, child: Text("Forward")),
              ElevatedButton(onPressed: _controller.stop , child: Text("Stop")),
              ElevatedButton(onPressed: (){
                if(_controller.value == 0){
                  _controller.value = 1;
                  _controller.reverse();
                }
                else{
                  _controller.reverse();
                }
              }, child: Text("Reverse")),],)
          ],
        ),
      ),
    );
  }
}
