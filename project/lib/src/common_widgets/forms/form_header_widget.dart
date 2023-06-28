import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      this.imageColor,
      this.imageHeight = 0.3,
      this.heightBetween,
      this.textAlign,
      this.crossAxisAlignment = CrossAxisAlignment.start});
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final CrossAxisAlignment crossAxisAlignment;
  final String image, title, subTitle;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(image),
          height: size.height * imageHeight,
          width: size.width * 1,
        ),
        SizedBox(
          height: heightBetween,
        ),
        Text(title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        Text(subTitle,
            textAlign: textAlign,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
            )),
      ],
    );
  }
}
