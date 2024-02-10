import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/resources/images.dart';
import 'package:flutter_clean_architecture_template/utils/ext/context.dart';

///*********************************************
/// Created by ukietux on 25/06/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class Empty extends StatelessWidget {
  final String? errorMessage;

  const Empty({super.key, this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Images.icLauncher,
          width: context.widthInPercent(45),
        ),
        Text(
          errorMessage ?? '${tr('errorNoData')} 😢',
        ),
      ],
    );
  }
}
