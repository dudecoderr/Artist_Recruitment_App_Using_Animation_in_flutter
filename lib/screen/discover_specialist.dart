import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:video_player/video_player.dart';
import '../constant/color_constant.dart';
import '../constant/img_list_constant.dart';
import '../constant/string_constant.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with TickerProviderStateMixin {
  late MatchEngine _matchEngine;
  late List<SwipeItem> _SwipeItems;
  late bool _isNoItem = false;
  Content connn = contents[0];
  AnimationController? animationController;

  RxBool isLike = false.obs;


  ///============ initstate ==========================

  @override
  void initState() {
    reset();
    animationController = AnimationController(vsync: this);
    animationController!.addStatusListener((status) {
      print("Listener Value After Tap :: $status");
      if (status == AnimationStatus.completed) {
        isLike.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  ///============== reset option class ========
  void reset() {
    _SwipeItems = [];
    for (var content in contents) {
      var swipeItem = SwipeItem(
        content: content,
      );
      _SwipeItems.add(swipeItem);
      _matchEngine = MatchEngine(swipeItems: _SwipeItems);
      _isNoItem = false;
    }
  }

  ///============ initstate ==========================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              padding: EdgeInsets.only(top: 45.h, right: 20.w, left: 20.w),
              color: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 46.h,
                        width: 46.w,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(80.r),
                        ),
                        child: Icon(
                          Icons.search,
                          color: kBlackColor,
                          size: 21.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            reset();
                          });
                        },
                        child: Container(
                          height: 46.h,
                          width: 46.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.r), color: kWhiteColor),
                          child: Icon(
                            Icons.tune,
                            color: kBlackColor,
                            size: 21.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    discover,
                    style: TextStyle(fontSize: 30.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kBlackColor),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    forAn,
                    style: TextStyle(fontSize: 18.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                  ),

                  ///===================  card code start ======================
                  AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(seconds: 2),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: MediaQuery.of(context).size.width / 2,
                          child: FadeInAnimation(child: widget),
                        ),
                        children:[Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: _isNoItem
                              ? Container(
                            height: 350.h,
                            width: 500.w,
                            child: const Center(
                              child: Text(
                                'No Item',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                              : Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: 400.h,
                                width: 500.w,
                                child: SwipeCards(
                                  upSwipeAllowed: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             DetilsScreen()));
                                      },
                                      child: VideoWidget(con: connn),
                                    );
                                  },
                                  matchEngine: _matchEngine,
                                  itemChanged: (p0, p1) {
                                    connn = Content(contents[p1].title, contents[p1].url);
                                  },
                                  onStackFinished: () {
                                    print('onStackFinished');
                                    setState(() {
                                      _isNoItem = true;
                                    });
                                  },
                                ),
                              ),
                              //OKK  READY

                            ],
                          ),
                        ),],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() {
              print("Listener Value After Tap :: OBX ${isLike.value}");
              return isLike.value ? Positioned(
                bottom: -100,
                child: Lottie.asset(
                    "assets/91069-like.json", controller: animationController,
                    height: 650,
                    width: 250,
                    fit: BoxFit.fill,
                    onLoaded: (composition) {
                      animationController!
                        ..duration = composition.duration
                        ..forward().whenComplete(() {});
                    }
                ),
              ) : const SizedBox.shrink();
            }),
            Positioned(
                bottom:320,
                right: -50,
                child: Obx(() {
                  return InkWell(
                    onTap: isLike.value == false ? () {
                      isLike.value = true;
                      animationController!.reset();
                    } : null,
                    child: SizedBox(
                      height: 80,width: 150,
                      child: CircleAvatar(

                        child: Padding(
                          padding: const EdgeInsets.only(right : 10),
                          child: Icon(Icons.favorite,size: 40,color: Colors.red),
                        ),
                      ),
                    )
                  );
                })),
            Positioned(
                bottom: 320,
                left: -50,
                child: SizedBox(
                  height: 80,width: 150,
                  child: CircleAvatar(

               child: Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: Icon(Icons.close_rounded,size: 40,color: Colors.red),
               ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class VideoWidget extends StatefulWidget {
  VideoWidget({Key? key, required this.con}) : super(key: key);
  Content con;

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  ///====== video controller =============
  late VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.con.url,
    )
      ..initialize()
      ..play()
      ..setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 440.h,
          width: 500.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.white,
          ),
        ),
        Container(
          height: 440.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: Colors.grey.shade100,
          ),
          width: 500.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.r),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(
                _controller,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  widget.con.title,
                  style: TextStyle(color: kWhiteColor,
                      fontSize: 20.sp,
                      fontFamily: "TT-Norms-Fonts",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2),
                ),
              ),
              Container(
                height: 40.h,
                width: 100.w,
                padding: EdgeInsets.only(left: 12, right: 10, top: 12),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r), color: Colors.white24),
                child: Text(hours, style: TextStyle(color: kWhiteColor, fontFamily: "TT-Norms-Fonts", fontSize: 16.sp, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
