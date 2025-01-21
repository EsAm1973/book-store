import 'package:bookly_app/Core/utils/Assets/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  double _opacirty = 0.0;
  @override
  void initState() {
    super.initState();
    _animatedOpacity();
  }

  void _animatedOpacity() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacirty = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedImage(),
      ],
    );
  }

  AnimatedOpacity AnimatedImage() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _opacirty,
      curve: Curves.easeInOut,
      child: Image.asset(
        AssetsPath.logo,
        width: 200,
        height: 200,
      ),
    );
  }
}
