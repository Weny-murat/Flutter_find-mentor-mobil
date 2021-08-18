import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:find_mentor/util/app_widget.dart';
import 'package:find_mentor/util/size_config.dart';
import 'package:find_mentor/util/app_constant.dart';
import 'package:find_mentor/services/fetchEvents.dart';
import 'package:find_mentor/page/home/events_page/events_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:find_mentor/model/event.dart';

class EventsPageBody extends StatefulWidget {
  @override
  _EventsPageBodyState createState() => _EventsPageBodyState();
}

class _EventsPageBodyState extends State<EventsPageBody> {
  List<EventElement> data;

  bool isKeyboardVisible;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    isKeyboardVisible = MediaQuery.of(context).viewInsets.vertical > 0;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      shadowColor: Colors.black38,
                      elevation: 4,
                      child: AppWidget.getSearchBox(isKeyboardVisible, context,
                          AppConstant.searchEventText),
                    ),
                  ),
                  // Description
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    AppConstant
                                        .colorPageBg, // Color(0xFF216383) strong
                                    AppConstant
                                        .colorPageBg, // Color(0xFF71BFBC) light
                                  ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0)),
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
                                Positioned(
                                  top: 15,
                                  right: 15,
                                  left: 15,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: ClipRect(
                                          child: BackdropFilter(
                                            filter: ui.ImageFilter.blur(
                                                sigmaX: 8.0, sigmaY: 8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            10, 15, 10, 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 260,
                                                          child: RichText(
                                                            textAlign:
                                                                TextAlign.left,
                                                            text: new TextSpan(
                                                              children: <
                                                                  TextSpan>[
                                                                new TextSpan(
                                                                  text: AppConstant
                                                                      .eventsPageGuide,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Gilroy",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0xff7B7F9E),
                                                                    height: 1.5,
                                                                  ),
                                                                ),
                                                                new TextSpan(
                                                                    text: ' '),
                                                                new TextSpan(
                                                                  text: AppConstant
                                                                      .websiteBtnText,
                                                                  style:
                                                                      new TextStyle(
                                                                    fontFamily:
                                                                        "Gilroy",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        13,
                                                                    // color: Color(0xFFB5BFD0),
                                                                    color: AppConstant
                                                                        .colorLink,
                                                                    height: 1.5,
                                                                  ),
                                                                  recognizer:
                                                                      new TapGestureRecognizer()
                                                                        ..onTap =
                                                                            () {
                                                                          launch(
                                                                              AppConstant.websiteLink);
                                                                        },
                                                                ),
                                                              ],
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    // padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FutureBuilder(
                            future: fetchEvents(),
                            builder: (context, snapshot) {
                              return snapshot.hasData
                                  ? Events(events: snapshot.data)
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                          ),
                                          CircularProgressIndicator(
                                            strokeWidth: 3,
                                            valueColor: AlwaysStoppedAnimation(
                                                AppConstant.colorPrimary),
                                          ),
                                        ],
                                      ),
                                    );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
