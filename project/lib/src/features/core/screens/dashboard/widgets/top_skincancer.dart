import 'package:flutter/material.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';

class DashboardTopSkincancer extends StatelessWidget {
  const DashboardTopSkincancer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          // banner1
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCarBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Signs of skin cancer",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(tSkincancer1),
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {},
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              "Skin Cancer Detection",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          //banner2
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCarBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Signs of skin cancer",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(tSkincancer1),
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {},
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              "Skin Cancer Detection",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // banner3
          SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCarBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Signs of skin cancer",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(tSkincancer1),
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder()),
                            onPressed: () {},
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 20,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3 Sections",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              "Skin Cancer Detection",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
