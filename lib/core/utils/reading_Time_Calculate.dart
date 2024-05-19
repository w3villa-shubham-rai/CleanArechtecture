import 'package:flutter/widgets.dart';

int calculatingReadingTimeOfBloc(String content){
 final wordCount=content.split(RegExp(r'\s+')).length;
 //  speed=d/t;
final readingTime=wordCount/225;
  debugPrint("the reading  time of content  $wordCount");
  debugPrint("the reading  time of content  ${content.split(RegExp(r'\s+'))}");
  debugPrint("the reading  time of content  $content");
 return readingTime.ceil();
}

