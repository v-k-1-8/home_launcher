import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:device_apps/device_apps.dart';
import 'screen.dart';

class Front extends StatefulWidget {
  const Front({super.key});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return frontt();
  }
}


class frontt extends StatefulWidget {
  const frontt({Key? key}) : super(key: key);

  @override
  State<frontt> createState() => _fronttState();
}

class _fronttState extends State<frontt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: scaff(),
    );
  }
}

class scaff extends StatefulWidget {
  const scaff({Key? key}) : super(key: key);

  @override
  State<scaff> createState() => _scaffState();
}

class _scaffState extends State<scaff> {
  @override
  void initState() {
    super.initState();
    getAppsData();
  }

  void getAppsData() async {
    List<Application> appData = await DeviceApps.getInstalledApplications
      (
      includeAppIcons: true,
      includeSystemApps: true,
      onlyAppsWithLaunchIntent: true,
    );
  print(appData[0]);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return screen(appData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Getting Ready',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.end,
                )),
          ),
          Expanded(
            flex: 8,
            child: Align(
              alignment: Alignment.topCenter,
              child: SpinKitChasingDots(
                color: Colors.tealAccent,
                size: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }
}