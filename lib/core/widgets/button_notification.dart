import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_template/core/resources/dimens.dart';
import 'package:flutter_clean_architecture_template/core/resources/styles.dart';

///*********************************************
///  flutter_clean_architecture_template |
///  button_notification.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 03/01/22 🕰 11:13 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2022 | All Right Reserved
class ButtonNotification extends StatelessWidget {
  const ButtonNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SizedBox(
        width: Dimens.space36,
        height: Dimens.space36,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.notifications_outlined,
                size: Dimens.space30,
                color: Theme.of(context).extension<AppColors>()!.pink,
              ),
            ),
            Positioned(
              right: Dimens.space4,
              bottom: Dimens.space6,
              child: Visibility(
                child: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).extension<AppColors>()!.flamingo,
                  maxRadius: Dimens.space8,
                  child: Center(
                    child: Text(
                      "1",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Theme.of(context)
                                .extension<AppColors>()!
                                .background,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      onPressed: () async {
        ///TODO: Go to notifications page
        // context.goTo(AppRoute.notifications);
      },
    );
  }
}
