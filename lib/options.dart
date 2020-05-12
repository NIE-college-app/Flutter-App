import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nie/services/auth.dart';

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
          SizedBox(height: 50,),
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
                  onTap: () => signOut(),
                )
              ],
            ),
          )
        ],
      ),
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