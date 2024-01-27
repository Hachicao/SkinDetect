import 'dart:async';
import 'dart:convert';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:project/src/constants/color.dart';
import 'package:project/src/constants/text_string.dart';
import 'package:project/src/features/core/controllers/skin_detect_controller.dart';
import 'package:project/src/features/core/models/dashboard/dropdown_model.dart'; // Import your DropdownModel
import 'package:project/src/features/core/models/dashboard/history_model.dart';
import 'package:project/src/features/core/screens/detail/detail_screen_history.dart';
import 'package:project/src/features/core/screens/undowidgets/flushbars.dart';

enum Action { share, delete }

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final skinDetectController = Get.find<SkinDetectController>();
  final items = DropdownModel.list;
  DropdownModel? selectedDropdownItem;

  @override
  void initState() {
    super.initState();
    selectedDropdownItem = items[0]; // Set the default selected item
    skinDetectController.fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
        title: const Text(
          tHistory,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontStyle: FontStyle.normal,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Recent',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      LineAwesomeIcons.filter,
                      size: 25,
                      color: tIcon,
                    ),
                    const SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<DropdownModel>(
                          value: selectedDropdownItem,
                          items: items.map((item) {
                            return DropdownMenuItem<DropdownModel>(
                              value: item,
                              child: Row(
                                children: [
                                  Text(item.value),
                                  const SizedBox(width: 10),
                                  if (item.icon != null) item.icon!,
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (DropdownModel? item) {
                            setState(() {
                              selectedDropdownItem = item;
                              if (item != null) {
                                if (item.value == "Date in ascending") {
                                  skinDetectController.fetchHistoryByDateAsc();
                                } else if (item.value == "Date in descending") {
                                  skinDetectController.fetchHistory();
                                } else if (item.value == "Score") {
                                  skinDetectController.fetchHistoryByScore();
                                } else if (item.value == "All") {
                                  skinDetectController.fetchHistory();
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (skinDetectController.historyList.isEmpty) {
                return const Center(
                  // child: CircularProgressIndicator(
                  //   color: tPrimaryColor,
                  // ),
                  child: Text('The List is empty!'),
                );
              } else {
                return SlidableAutoCloseBehavior(
                  closeWhenOpened: true,
                  child: ListView.builder(
                    itemCount: skinDetectController.historyList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final historyItem =
                          skinDetectController.historyList[index];
                      double scoreApi = historyItem.detectScore;
                      final nameColor =
                          skinDetectController.getColorBasedOnScore(scoreApi);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Slidable(
                            endActionPane: ActionPane(
                              motion: const StretchMotion(),
                              children: [
                                SlidableAction(
                                  padding: const EdgeInsets.all(10),
                                  // borderRadius: BorderRadius.circular(10),
                                  backgroundColor: tPrimaryColor,
                                  icon: Icons.share,
                                  label: 'Share',
                                  onPressed: (context) =>
                                      _onDismissed(index, Action.share),
                                ),
                                SlidableAction(
                                  padding: const EdgeInsets.all(10),
                                  // borderRadius: BorderRadius.circular(10),
                                  backgroundColor: Colors.red,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                  onPressed: (context) =>
                                      // cal the function _onDismissed
                                      _onDismissed(index, Action.delete),
                                ),
                              ],
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      await skinDetectController
                                          .fetchDetail(historyItem.diseaseId);
                                      double? scoreApi =
                                          historyItem.detectScore;
                                      skinDetectController
                                          .calculateScoreAndSetSectionColor(
                                              scoreApi);
                                      Get.to(
                                        () => SkinDetailHistoryScreen(
                                          historyItem: historyItem,
                                        ),
                                        transition: Transition.fadeIn,
                                      );
                                    },
                                    child: Hero(
                                      tag: 'image${historyItem.detectId}',
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.memory(
                                          base64Decode(historyItem.detectPhoto),
                                          fit: BoxFit.cover,
                                          width: 65,
                                          height: 65,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: Text(
                                          historyItem.detectName,
                                          style: TextStyle(
                                            color: nameColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.history,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              DateFormat('HH:mm MMMM dd, yyyy')
                                                  .format(DateTime.parse(
                                                      historyItem.detectDate)),
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: IconButton(
                                      onPressed: () async {
                                        await skinDetectController
                                            .fetchDetail(historyItem.diseaseId);
                                        double? scoreApi =
                                            historyItem.detectScore;
                                        skinDetectController
                                            .calculateScoreAndSetSectionColor(
                                                scoreApi);
                                        Get.to(
                                          () => SkinDetailHistoryScreen(
                                            historyItem: historyItem,
                                          ),
                                          transition: Transition.fadeIn,
                                        );
                                      },
                                      icon: const Icon(
                                          LineAwesomeIcons.angle_right),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                      //
                    },
                  ),
                );
              }
            }),
          ),
        ],
      ),
    );
  }
}

Future<void> _onDismissed(int index, Action action) async {
  final skinDetectController = Get.find<SkinDetectController>();
  final historyItem = skinDetectController.historyList[index];
  switch (action) {
    case Action.share:
      break;
    case Action.delete:
      Get.dialog(
        Builder(builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Material(
                      color: Colors.white,
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            "DELETE",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            "Are you sure you want to delete?",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          //Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 45),
                                    backgroundColor: tbackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    'NO',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(0, 45),
                                    backgroundColor: tButtonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () async {
                                    skinDetectController.historyList
                                        .removeAt(index);
                                    Get.back();
                                    Flushbar? flushbar;
                                    flushbar = FlushBars.undo(
                                      message:
                                          "You still have a chance to undo it",
                                      onUndo: () {
                                        // if click "Undo" the flushbar will be dismissed and the item will be inserted back to the list
                                        skinDetectController.historyList
                                            .insert(index, historyItem);
                                        flushbar!.dismiss();
                                      },
                                      duration: const Duration(seconds: 6),
                                    );
                                    // if after 6 seconds the flushbar is not dismissed, then proceed with deletion
                                    Future.delayed(const Duration(seconds: 6))
                                        .then((_) {
                                      if (!flushbar!.isDismissed()) {
                                        // "undo" was not clicked, proceed with deletion.
                                        skinDetectController.deleteImageById(
                                            historyItem.detectId);
                                      }
                                    });
                                    flushbar.show(context);
                                    // Wait for 6 seconds unless "undo" is clicked.
                                  },
                                  child: const Text(
                                    'YES',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      );
      break;
  }
}
