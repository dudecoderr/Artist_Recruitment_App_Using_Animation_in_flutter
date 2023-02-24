import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruitment_flutter_ui/constant/string_constant.dart';
import '../constant/color_constant.dart';
import '../constant/image_constant.dart';
import '../screen/discover_specialist.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350.h,
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children:  [
              SizedBox(height: 10.h,),
              MusicList(
                function: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) =>  const DiscoverPage(),
                    ),
                  );
                },
                titles: singleMusic,
                subtitle: jake,
                desc: musicArtists,
                image: img1,
              ),
              SizedBox(height: 10.h,),
              MusicList(
                function: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context,) =>  const DiscoverPage(),
                    ),
                  );
                },
                titles: musicalGrp,
                subtitle: paradise,
                desc: musicalGrp,
                image: img2,
              ),
              SizedBox(height: 10.h,),
              MusicList(
                function: (){
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context,) =>  OceanParkPage(),
                //     ),
                //   );
                },
                titles: musicalDuet,
                subtitle: murray,
                desc: musicalDuet,
                image: img3,
              ),
            ],
          );
        },
      ),
    );
  }
}

class MusicList extends StatelessWidget {
  final String titles;
  final String subtitle;
  final String? desc;
  final String? image;
  final Function? function;
  const MusicList({Key? key, this.function, required this.titles, required this.subtitle, this.desc, this.image, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function!();
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: kWhiteColor,),
        padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 20.h),
        height: 120.h,
        width: 480,

        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 46.h,
                  width: 50.w,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15.r), image: DecorationImage(image: AssetImage(image.toString()), fit: BoxFit.fill)),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      titles,
                      style: TextStyle(fontSize: 15.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                    ),
                    Row(
                      children: [
                        Text(
                          subtitle,
                          style: TextStyle(fontSize: 20.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kBlackColor),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        Container(
                          height: 20,
                          width: 50,
                          padding: const EdgeInsets.only(top: 2, left: 13, right: 10, bottom: 2),
                          decoration: BoxDecoration(color: kGreenColor, borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            top,
                            style: TextStyle(fontSize: 12.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kDarkGreenColor),
                          ),
                        )
                      ],
                    ),
                  ],
                ),Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FavoriteButton(iconSize: 40,
                      isFavorite: false,iconColor: kBlackColor,
                      iconDisabledColor: Colors.grey.shade400,
                      valueChanged: (_isFavorite) {

                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Container(
                  height: 23.h,
                  width: 100.w,
                  padding:  EdgeInsets.only(top: 5.h, left: 13, right: 10, bottom: 2),
                  decoration: BoxDecoration(color:Colors.grey.shade300,borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    desc!,
                    style: TextStyle(fontSize: 12.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                  ),
                ),
                SizedBox(width: 5.w,),Container(
                  height: 26,
                  width: 95,
                  padding: const EdgeInsets.only(top: 5, left: 20 , right: 10, bottom: 2),
                  decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    ownTools,
                    style: TextStyle(fontSize: 12.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                  ),
                ),
                SizedBox(width: 35.w),
                Text(
                  hours,
                  style: TextStyle(fontSize: 15.sp, fontFamily: "TT-Norms-Fonts", fontWeight: FontWeight.w700, color: kGreyColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
