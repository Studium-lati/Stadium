
import 'package:flutter/material.dart';

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
String chatChannel(int id1,int id2){
  if(id1>id2){
    return "chat-$id2-$id1";
  }else{
    return "chat-$id1-$id2";
  }
  
}
