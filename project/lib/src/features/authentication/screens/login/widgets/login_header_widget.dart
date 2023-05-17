import 'package:flutter/cupertino.dart';

import '../../../../../constants/image_string.dart';
import '../../../../../constants/text_string.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: const AssetImage(tWelcomeScreenImage),
          height: size.height * 0.3,
          width: size.width * 1,
        ),
        const Text(tLoginTitle,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        const Text(tLoginSubTitle,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            )),
      ],
    );
  }
}
