import 'package:flutter/material.dart';
import 'package:project/src/features/core/models/dashboard/top_skincancer_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DashboardTopSkincancer extends StatelessWidget {
  // final VideoPlayerController _videoPlayerController =
  //     VideoPlayerController.asset('assets/videos/video2.mp4');

  late ChewieController _chewieController;

  DashboardTopSkincancer({required Key key}) : super(key: key) {
    // _chewieController = ChewieController(
    //   videoPlayerController: _videoPlayerController,
    //   autoPlay: false,
    //   looping: false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    final list = DashboardTopSkinCancerModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color(0xff0fbcf9),
                  color: const Color.fromARGB(255, 60, 156, 235),
                  // color: Color.fromARGB(255, 230, 241, 244),
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            list[index].title,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 2,
                          ),
                        ),
                        Flexible(
                          child: Image(
                            image: AssetImage(list[index].image),
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
                            onPressed: () {
                              final VideoPlayerController
                                  videoPlayerController =
                                  VideoPlayerController.asset(
                                      list[index].videoUrl);
                              final ChewieController chewieController =
                                  ChewieController(
                                videoPlayerController: videoPlayerController,
                                autoPlay: false,
                                looping: false,
                              );
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(                                   
                                    contentPadding: EdgeInsets.zero,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    content: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: Chewie(
                                        controller: chewieController,
                                      ),
                                    ),
                                  );
                                },
                              ).then(
                                (value) {
                                  videoPlayerController.dispose();
                                  chewieController.dispose();
                                },
                              );
                            },
                            child: const Icon(Icons.play_arrow)),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              list[index].heading,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              list[index].subHeading,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
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
        ),
      ),
    );
  }
}
