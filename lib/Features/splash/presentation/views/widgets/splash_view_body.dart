import 'package:bookly_app/Core/utils/Assets/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsPath.logo,
          width: 200,
          height: 200,
        ),
      ],
    );
  }
}
