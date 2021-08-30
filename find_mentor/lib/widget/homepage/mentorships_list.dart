import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:find_mentor/util/utility.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/widget/event_badge.dart';
import 'package:find_mentor/model/contribution.dart';

class Mentorships extends StatelessWidget {
  const Mentorships({
    Key key,
    this.mentorships,
  }) : super(key: key);
  // Because our Api provide us list of mentorships
  final List<Contribution> mentorships;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0), //20
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: mentorships.length,
        itemBuilder: (context, index) => MentorshipCard(
          mentorship: mentorships[index],
          press: () {
            /*Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  person: mentors[index],
                ),
              ),
            );*/
          },
        ),
      ),
    );
  }
}

// Mentorships Card
class MentorshipCard extends StatelessWidget {
  const MentorshipCard({
    Key key,
    this.mentorship,
    this.press,
  }) : super(key: key);

  final Contribution mentorship;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: press,
        child: eventItem(),
      ),
    );
  }

  Widget eventItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (mentorship.goal.length <= 75) ? 200.0 : 225.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      AppConstant.colorPageBg, // Color(0xFF216383) strong
                      AppConstant.colorPageBg, // Color(0xFF71BFBC) light
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
                  /*Positioned(
                    top: 0, // 24
                    left: 0, // 24
                    child: Container(
                      child: buildStatusBadge(mentorship.status),
                    ),
                  ),*/
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
                            color: AppConstant.colorPrimary.withOpacity(0.3),
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
                            color: AppConstant.colorPrimary.withOpacity(0.3),
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
                                          EdgeInsets.fromLTRB(10, 15, 10, 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Mentorship Link
                                          InkWell(
                                            onTap: () {
                                              Utility.launchURL(
                                                  mentorship.projectAdress);
                                            },
                                            child: Container(
                                              width: 260,
                                              child: Text(
                                                mentorship.slug.toUpperCase(),
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: "Gilroy",
                                                    foreground: Paint()
                                                      ..shader = AppConstant
                                                          .primaryTextGradientColor),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 260,
                                            child: Text(
                                              mentorship.goal,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontFamily: "Gilroy",
                                                fontSize: 12,
                                                // color: Color(0xFFB5BFD0),
                                                color: Color(0xFF898989),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: 260,
                                            child: RichText(
                                              text: TextSpan(
                                                  text: 'Visit',
                                                  style: TextStyle(
                                                    fontFamily: "Gilroy",
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 13,
                                                    color: Color(0xff7B7F9E),
                                                    height: 1.5,
                                                  ),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: ' Mentor profile',
                                                        style: TextStyle(
                                                          fontFamily: "Gilroy",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: AppConstant
                                                              .colorLink,
                                                          height: 1.5,
                                                        ),
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Utility.launchURL(
                                                                    mentorship
                                                                        .mentor);
                                                              }),
                                                    TextSpan(
                                                      text: ' and',
                                                      style: TextStyle(
                                                        fontFamily: "Gilroy",
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 13,
                                                        color:
                                                            Color(0xff7B7F9E),
                                                        height: 1.5,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text: ' Project repo',
                                                        style: TextStyle(
                                                          fontFamily: "Gilroy",
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                          color: AppConstant
                                                              .colorLink,
                                                          height: 1.5,
                                                        ),
                                                        recognizer:
                                                            TapGestureRecognizer()
                                                              ..onTap = () {
                                                                Utility.launchURL(
                                                                    mentorship
                                                                        .projectAdress);
                                                              }),
                                                  ]),
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
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    left: 20,
                    right: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '',
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              color: AppConstant.colorGrey),
                        ),
                        Text(
                          '${mentorship.empty.substring(0, 10)}',
                          style: TextStyle(
                              fontFamily: "Gilroy",
                              color: AppConstant.colorGrey),
                        ),
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
}
