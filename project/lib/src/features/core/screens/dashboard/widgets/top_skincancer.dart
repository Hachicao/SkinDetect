import 'package:flutter/material.dart';
import 'package:project/src/features/core/models/dashboard/top_skincancer_model.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DashboardTopSkincancer extends StatelessWidget {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
  late ChewieController _chewieController;

  DashboardTopSkincancer({required Key key}) : super(key: key) {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
    );
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
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Color(0xff0fbcf9),
                  color: const Color.fromARGB(255, 22, 136, 230),
                  // gradient: const LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment(0.8, 1),
                  //   colors: <Color>[
                  //     Color(0xff0819CE),

                  //     Color.fromARGB(29, 17, 134, 230),
                  //     Color.fromARGB(255, 25, 139, 184),
                  //     // Color(0xffac255e),
                  //     // Color(0xffca485c),
                  //     // Color(0xffe16b5c),
                  //     // Color(0xfff39060),
                  //     // Color(0xffffb56b),
                  //   ],
                  //   tileMode: TileMode.mirror,
                  // ),
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
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        width: 300,
                                        height: 300,
                                        child: Chewie(
                                          controller: _chewieController,
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            _videoPlayerController.pause();
                                          },
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  });
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
