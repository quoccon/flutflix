import 'package:flutter/material.dart';

import '../../colors.dart';

class Infomation extends StatelessWidget {
  const Infomation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colours.scaffoldBgColor,),
    );
  }
}

