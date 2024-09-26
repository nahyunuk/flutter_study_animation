import 'package:flutter/material.dart';

class ControllerWithCurvedAnimation extends StatefulWidget {
  const ControllerWithCurvedAnimation({super.key});

  @override
  State<ControllerWithCurvedAnimation> createState() =>
      _ControllerWithCurvedAnimationState();
}

class _ControllerWithCurvedAnimationState
    extends State<ControllerWithCurvedAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // 2초간 진행
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() // 객체의 생명 주기 중 마지막에 호출되는 메서드
  {
    _controller.dispose(); // 애니메이션 컨트롤러를 정리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            'AnimationController value:${_animation.value.toStringAsFixed(2)}', // 진행 상태 0.0 ~ 1.0까지, 소숫점 두자리 까지 표현
          ),
          Container(
            height: _animation.value*100,
            width: _animation.value*100,
            child: Icon(Icons.search),
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[ // <Widget>을 넣는 이유 : 해당 리스트에 오직 Widget 타입의 객체들만 포함될 수 있음을 나타냄
              ElevatedButton(onPressed: ()=> _controller.forward(), child: Text("Forword")),
              ElevatedButton(onPressed: ()=> _controller.stop(), child: Text("Stop")),
              ElevatedButton(onPressed: ()=> _controller.reverse(), child: Text("Reverse")),
            ],
          ),
        ],
      ),
    );
  }
}
