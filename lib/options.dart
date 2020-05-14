import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nie/loginPage.dart';
import 'package:nie/services/auth.dart';
import 'package:nie/services/loader.dart';

import 'globalvariables.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: NetworkImage(data['photoUrl']),
                ),
                GestureDetector(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: kSpacingUnit.w * 2.5,
                      width: kSpacingUnit.w * 2.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        heightFactor: kSpacingUnit.w * 1.5,
                        widthFactor: kSpacingUnit.w * 1.5,
                        child: Icon(
                          CupertinoIcons.pen,
                          color: kDarkPrimaryColor,
                          size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            data['displayName'],
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            data['USN'],
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.25),
          Text(
            data['email'],
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),

        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        profileInfo,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      body: Column(
        children: <Widget>[
          header,
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                  child: ProfileListItem(
                    icon: Icons.calendar_today,
                    text: 'TimeTable',
                    hasNavigation: true,
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/timetable'),
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: CupertinoIcons.person_add_solid,
                    text: 'Faculty',
                    hasNavigation: true,
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/contacts'),
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: Icons.import_contacts,
                    text: 'Syllabus',
                    hasNavigation: true,
                  ),
                  onTap: () => Navigator.of(context).pushNamed('/pdfView'),
                ),
                GestureDetector(
                  child: ProfileListItem(
                    icon: null,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                  onTap: () => _openSignOutBottomSheet(context),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void _openSignOutBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: BottomSheetShape(),
        backgroundColor: AppColor,
        context: context,
        builder: (_) {
          return Container(
            padding: EdgeInsets.only(top: 24,left: 49, right: 48),
            height: 200,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Laura, are you sure you want to sign out?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                          child: ProgressButton(
                            defaultWidget: Text(
                              "Sign out",
                              style: TextStyle(
                                color: AppColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            progressWidget: ColorLoader2(),
                            color: Colors.white,
                            onPressed: () async {
                              await signOut();
                              Future.delayed(Duration(milliseconds: 2000), () {
                                Navigator.of(context).pushReplacement(
                                    new MaterialPageRoute(builder: (_) => loginPage())
                                );
                              });
                            },
                          )
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: OutlineButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          borderSide: BorderSide(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Theme.of(context).primaryColor,
                          child: Text(
                            "Stay logged in",
                            style: TextStyle(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}




class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w * 1.5),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              CupertinoIcons.right_chevron,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}


class BottomSheetShape extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 40);
    path.quadraticBezierTo(size.width/2, 0, size.width, 40);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

}