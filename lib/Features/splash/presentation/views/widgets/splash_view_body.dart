import 'package:bookly_app/Core/utils/assets.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void _animatedOpacity() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _opacirty = 1.0;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        Get.to(() => const HomeView(),
            transition: Transition.fadeIn, duration: kTransitionDuration);
      });
    });
  }
}
