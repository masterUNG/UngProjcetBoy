import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:ungproject/states/home_mobile.dart';
import 'package:ungproject/states/home_web.dart';
import 'package:ungproject/utility/my_constant.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(decoration: MyConstant().bgBox(),
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
              return HomeMobile();
            } else if (sizingInformation.deviceScreenType ==
                DeviceScreenType.tablet) {
              return HomeMobile();
            } else {
              return HomeWeb();
            }
          },
        ),
      ),
    );
  }
}
