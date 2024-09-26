import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  // alignment 변수를 State 클래스 내부로 이동시켜 상태 관리가 가능하도록 변경
  Alignment alignment = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedAlign"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: AnimatedAlign(
                alignment: alignment,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: Container(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.flutter_dash_outlined,
                    size: 50, // 아이콘 크기 명시
                  ),
                ),
              ),
            ),
            ElevatedButton(
              child: Text('alignment change'),
              onPressed: () {
                setState(() {
                  alignment = alignment == Alignment.bottomCenter
                      ? Alignment.topCenter
                      : Alignment.bottomCenter;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
