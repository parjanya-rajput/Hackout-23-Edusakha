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
        appID: 1219407714, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: "823447a2c68705f226f15b8c6b054ba4af8c3bf44cf6222df4caeb99c93c9311", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: userId,
        userName: 'user_$userId',
        conferenceID: conferenceID,
        config: ZegoUIKitPrebuiltVideoConferenceConfig(),
      ),

    );
  }
}
