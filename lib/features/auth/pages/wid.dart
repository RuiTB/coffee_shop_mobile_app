import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button_notification.dart';
import 'package:flutter_clean_architecture_template/core/widgets/button_text.dart';
import 'package:flutter_clean_architecture_template/core/widgets/circle_image.dart';
import 'package:flutter_clean_architecture_template/core/widgets/color_loaders.dart';
import 'package:flutter_clean_architecture_template/core/widgets/drop_down.dart';
import 'package:flutter_clean_architecture_template/core/widgets/empty.dart';
import 'package:flutter_clean_architecture_template/core/widgets/loading.dart';
import 'package:flutter_clean_architecture_template/core/widgets/text_f.dart';
import 'package:flutter_clean_architecture_template/core/widgets/toast.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ButtonNotification(),
            ButtonText(title: "text Button", onPressed: () {}),
            Button(title: "Button", onPressed: () {}),
            const CircleImage(url: "https://fakeimg.pl/600x400"),
            const ColorLoader(),
            DropDown<int>(
              value: 1,
              items: const [
                DropdownMenuItem<int>(value: 1, child: Text("1")),
                DropdownMenuItem<int>(value: 2, child: Text("2")),
                DropdownMenuItem<int>(value: 3, child: Text("3")),
              ],
              onChanged: (value) {},
            ),
            const Empty(),
            const Loading(),
            const TextF(prefixIcon: Icon(Icons.abc)),
            const Toast(message: "hello toast"),
          ],
        ),
      ),
    );
  }
}
