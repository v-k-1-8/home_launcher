import 'package:flutter/material.dart';
import 'dart:async';
import 'package:android_package_manager/android_package_manager.dart';
final pm=AndroidPackageManager();
String firstFewWords(String bigSentence){

  int startIndex = 0, indexOfSpace=0;

  for(int i = 0; i < 6; i++){
   if(bigSentence.indexOf(' ', startIndex)<=25)indexOfSpace = bigSentence.indexOf(' ', startIndex);
   else break;
    if(indexOfSpace == -1){
      return bigSentence;
    }
    startIndex = indexOfSpace + 1;
  }

  return bigSentence.substring(0, indexOfSpace) ;
}
class screen extends StatefulWidget {
  screen(this.appData);
  final appData;
  @override
  State<screen> createState() => _screenState();
}



class _screenState extends State<screen> {
  @override
  String linkk="";

  void initState() {
    // TODO: implement initState
    for(int i=0;i<widget.appData.length;i++){
      if(widget.appData[i].appName=="Productivity Launcher")linkk=widget.appData[i].packageName;
    }
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body:Padding(
          padding: EdgeInsets.all(10),
          child: GridView.count(

              crossAxisCount: 3,
              children: [
          for(int i=0;i<widget.appData.length;i++)Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              CircleAvatar(radius:MediaQuery.of(context).size.width/11,

          child:TextButton(child: Image.memory(widget.appData[i].icon),onPressed: (){

            pm.openApp(widget.appData[i].packageName);

            Future.delayed(const Duration(seconds: 900), () async {


             pm.openApp(linkk);
                      }
            );


          },),

          ),
              Center(child: Text(widget.appData[i].appName.toString().length>20?firstFewWords(widget.appData[i].appName.toString()):widget.appData[i].appName.toString())),
            ],)
              ],
            ),
        )

      ),
    );
  }
}