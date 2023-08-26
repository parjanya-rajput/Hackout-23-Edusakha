import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_video_conference/zego_uikit_prebuilt_video_conference.dart';
import 'dart:math';

final userId = Random().nextInt(1000).toString();

class VideoConferencePage extends StatelessWidget {
  final String conferenceID;

  const VideoConferencePage({
    Key? key,
    required this.conferenceID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: ZegoUIKitPrebuiltVideoConference(
        appID: 696654365, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: "4209372b8a05a1b4edf8e19745a3a7345e37eb0d4476a27042ae5526c2360c13", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: 'user $userId',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),

    );
  }
}