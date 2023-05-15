import 'package:flutter/material.dart';
import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      color: model.bgColor,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image(
          image: AssetImage(model.images),
          height: size.height * 0.4,
        ),
        Column(children: [
          Text(model.title),
          Text(
            model.subTitle,
            textAlign: TextAlign.center,
          ),
        ]),
        Text(model.counterText),
        const SizedBox(
          height: 60.0,
        )
      ]),
    );
  }
}
