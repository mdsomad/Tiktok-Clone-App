import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/screen/add_video_screen.dart';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];



getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;



var pageindex = [
  Text('Home'),
  Text('Search'),
  AddVideoScreen(),
//  Text('Upload Video'),
  Text('Messages'),
  Text('Profile')
];