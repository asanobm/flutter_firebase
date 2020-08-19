import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget getGoogleAuthIcon() {
  return Container(
    child: SvgPicture.asset(
      'images/auth_service_google.svg',
      semanticsLabel: 'google',
      width: 35,
      height: 35,
    )
  );
}