import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recruitment_flutter_ui/constant/color_constant.dart';
import '../common/common_container.dart';
import '../constant/string_constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int timeIndexSelected = 1;

  final List<String> time = [
    musician,
    magician,
    dancers,
    musician,
    magician,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 45.h, right: 20.w, left: 20.w),
        color: Colors.grey.shade100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              Container(
                height: 46.h,
                width: 46.w,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(80.r),
                ),
                child: Icon(Icons.notifications_none, color: kBlackColor, size: 21.h),
              ),
            ],
          ),
        AnimationLimiter(
          child: Column(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(seconds: 2),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: MediaQuery.of(context).size.width / 2,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 260),
                  child: Text(
                    hiAnna,
                    style: TextStyle(fontSize: 12.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  betterWay,
                  style: TextStyle(fontSize: 30.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kBlackColor),
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 35.h,
                  width: 495,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            timeIndexSelected = index;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Container(
                            height: 35.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.sp),
                                border: Border.all(
                                  color: index == timeIndexSelected ? Colors.white : Colors.white,
                                ),
                                color: timeIndexSelected == index ? kBlackColor : kWhiteColor),
                            child: Center(
                                child: Text(time[index],
                                    style: TextStyle(
                                        color: index == timeIndexSelected ? kWhiteColor : kGreyColor,
                                        fontSize: 16.sp,
                                        fontFamily: "TT-Norms-Fonts",
                                        fontWeight: FontWeight.w700))),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                best,
                style: TextStyle(fontSize: 20.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kBlackColor),
              ),
              Text(
                viewAll,
                style: TextStyle(fontSize: 18.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w600, color: kGreyColor),
              ),
            ],
          ),
          AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(seconds: 1),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
             children: [
               ListContainer(),
             ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
