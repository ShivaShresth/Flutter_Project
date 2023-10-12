import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TapEffect extends StatefulWidget {
  final Widget child;

  const TapEffect({super.key,required this.child});

  @override
  State<TapEffect> createState() => _TapEffectState();
}

class _TapEffectState extends State<TapEffect>
 with SingleTickerProviderStateMixin {
 late AnimationController _animationController;
 late Animation<double> _scaleAnimation;

@override
  void initState() {
    super.initState();
    _animationController=AnimationController(
      vsync: this,
    duration: Duration(milliseconds: 100));

    _scaleAnimation=Tween<double>(begin: 1,end: 0.9).animate(_animationController);


  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details){  
_animationController.forward();        

      },
      onTapUp: (detalis){
_animationController.reverse();
      },
      onTapCancel: (){ 
_animationController.reverse();


      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          child: widget.child,
          
        ),
      ),
    );
  }
}