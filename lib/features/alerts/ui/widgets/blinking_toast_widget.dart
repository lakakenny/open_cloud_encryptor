import 'package:flutter/material.dart';

class BlinkingToastWidget extends StatefulWidget {
  const BlinkingToastWidget({
    Key key,
    @required this.widget,
    @required this.position,
  }) : super(key: key);

  final Widget widget;
  final Offset position;

  @override
  _BlinkingToastWidgetState createState() => _BlinkingToastWidgetState();
}

class _BlinkingToastWidgetState extends State<BlinkingToastWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)))
      ..addListener(() {
        if (mounted) {
          setState(() {
            // Refresh
          });
        }
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse().orCancel;
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward().orCancel;
        }
      });
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: widget.position.dy,
        left: widget.position.dx,
        child: IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: _animation.value,
              child: widget.widget,
            ),
          ),
        ));
  }
}
