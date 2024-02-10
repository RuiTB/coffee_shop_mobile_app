import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';

class SpacerH extends StatelessWidget {
  const SpacerH({super.key, this.value});

  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: value ?? Dimens.space8,
    );
  }
}
