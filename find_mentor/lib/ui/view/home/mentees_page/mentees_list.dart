// Dart imports:
import 'dart:ui' as ui;

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:find_mentor/core/constants/core.dart';
import 'package:find_mentor/core/enums/enums.dart';
import 'package:find_mentor/core/init/size_config.dart';
import 'package:find_mentor/core/init/utility.dart';
import 'package:find_mentor/core/model/person.dart';
import 'package:find_mentor/ui/view/home/persons_detail_page/persons_detail_page.dart';

// Mentee Card
class MenteeCard extends StatelessWidget {
  const MenteeCard({
    Key key,
    this.mentees,
  }) : super(key: key);

  final Person mentees;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0), //20
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PersonsDetailPage(
                  personDetail: mentees,
                ),
              ),
            );
          },
          child: menteeItem(mentees),
        ),
      ),
    );
  }
}

// Mentee Item
Widget menteeItem(Person mentees) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: (mentees.displayInterests.length <= 75) ? 285.0 : 310.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.colorPageBg, // Color(0xFF216383) strong
                    AppColors.colorPageBg, // Color(0xFF71BFBC) light
                  ]),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 20,
                  color: Color(0xFFB0CCE1).withOpacity(0.32),
                ),
              ],
            ),
            child: Stack(
              overflow: Overflow.clip,
              children: [
                // Find Mentor Logo -> 24, 24
                Positioned(
                  top: -96, // 24
                  right: -96, // 24
                  child: Container(
                    height: 192,
                    width: 192,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.colorPrimary.withOpacity(0.3),
                          width: 10,
                        )),
                  ),
                ),
                Positioned(
                  bottom: -96, // 24
                  left: -96, // 24
                  child: Container(
                    height: 192,
                    width: 192,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.colorPrimary.withOpacity(0.3),
                          width: 10,
                        )),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 15,
                  left: 15,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter:
                                ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: Container(
                                      padding: EdgeInsets.all(30 / 192 * 10),
                                      height: 75,
                                      width: 75,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: RadialGradient(
                                          colors: [
                                            (mentees.mentor != Mentor.BOTH)
                                                ? AppColors.colorMentee
                                                    .withOpacity(0.3)
                                                : AppColors.colorBoth
                                                    .withOpacity(0.3),
                                            (mentees.mentor != Mentor.BOTH)
                                                ? AppColors.colorMentee
                                                    .withOpacity(0.6)
                                                : AppColors.colorBoth
                                                    .withOpacity(0.6),
                                          ],
                                          stops: [.5, 1],
                                        ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        child: CachedNetworkImage(
                                          imageUrl: mentees.avatar,
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) =>
                                              CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor: AlwaysStoppedAnimation(
                                              AppColors.colorPrimary,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                            AppImages.pngUser,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 13, 0, 13),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 175,
                                          child: Text(
                                            mentees.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: AppStrings.FONT_FAMILY,
                                              color: AppColors.colorMentee,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 175,
                                          child: Text(
                                            mentees.displayInterests,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontFamily: AppStrings.FONT_FAMILY,
                                              fontSize: 12,
                                              // color: Color(0xFFB5BFD0),
                                              color: Color(0xFF898989),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: SizeConfig.screenWidth * 0.8,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: AppColors.colorLightGreen,
                                height: 1.5,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                AppStrings.GET_CONNECTED,
                                style: TextStyle(
                                  color: AppColors.colorLightGreen,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: AppColors.colorLightGreen,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 80,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter:
                                ui.ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(14.0)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  // Twitter
                                  InkWell(
                                    onTap: () {
                                      Utility.launchURL(mentees.twitterHandle);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.defaultSize,
                                      ), // 10
                                      padding: EdgeInsets.all(
                                        SizeConfig.defaultSize * 0.1,
                                      ), // 1
                                      height: SizeConfig.defaultSize * 4, // 40
                                      width: SizeConfig.defaultSize * 4, // 40
                                      decoration: BoxDecoration(
                                        color: AppColors.colorPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppImages.iconMentorTwitter,
                                      ),
                                    ),
                                  ),
                                  // GitHub
                                  InkWell(
                                    onTap: () {
                                      Utility.launchURL(mentees.github);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.defaultSize,
                                      ), // 10
                                      padding: EdgeInsets.all(
                                        SizeConfig.defaultSize * 0.1,
                                      ), // 6
                                      height: SizeConfig.defaultSize * 4, // 40
                                      width: SizeConfig.defaultSize * 4, // 40
                                      decoration: BoxDecoration(
                                        color: AppColors.colorPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppImages.iconMentorGitHub,
                                      ),
                                    ),
                                  ),
                                  // LinkedIn
                                  InkWell(
                                    onTap: () {
                                      Utility.launchURL(mentees.linkedin);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: SizeConfig.defaultSize,
                                      ), // 10
                                      padding: EdgeInsets.all(
                                        SizeConfig.defaultSize * 0.1,
                                      ), // 6
                                      height: SizeConfig.defaultSize * 4, // 40
                                      width: SizeConfig.defaultSize * 4, // 40
                                      decoration: BoxDecoration(
                                        color: AppColors.colorPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppImages.iconMentorLinkedin,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}