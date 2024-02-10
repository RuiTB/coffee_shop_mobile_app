import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/widgets/color_loaders.dart';

///*********************************************
/// Created by ukietux on 25/06/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class Loading extends StatelessWidget {
  const Loading({this.showMessage = true});

  final bool showMessage;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ColorLoader(),
          Visibility(
            visible: showMessage,
            child: Text(
              tr('pleaseWait'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
