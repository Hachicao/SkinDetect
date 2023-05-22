import 'package:flutter/material.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/image_string.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            height: 45,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tCarBgColor),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Image(image: AssetImage(tAlgorithsm)),
                  )),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Algorithm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "Choose ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tCarBgColor),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Image(image: AssetImage(tSearchInfor)),
                  )),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Looking For some information",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "Choose ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 45,
            width: 170,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tCarBgColor),
                  child: Center(
                      child: IconButton(
                    onPressed: () {},
                    icon: const Image(image: AssetImage(tAlgorithsm)),
                  )),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Algorithm",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        "Choose ",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //banner--
        ],
      ),
    );
  }
}
