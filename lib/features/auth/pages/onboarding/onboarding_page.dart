import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';
import 'package:flutter_clean_architecture_template/core/resources/images.dart';
import 'package:flutter_clean_architecture_template/core/resources/palette.dart';
import 'package:flutter_clean_architecture_template/core/widgets/parent.dart';
import 'package:flutter_clean_architecture_template/utils/ext/context.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Parent(
      backgroundColor: Palette.solidBlack,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: context.heightInPercent(25)),
            child: OverflowBox(
              alignment: Alignment.bottomCenter,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withAlpha(200),
                    ],
                  ).createShader(
                    Rect.fromLTWH(0, 0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstOut,
                child: Image.asset(
                  Images.onboardingMain,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: Dimens.space12,
              left: Dimens.space30,
              right: Dimens.space30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: () {}, child: const Text('Get Started')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
