import 'package:flutter/material.dart';
import 'package:audiofileplayer/audiofileplayer.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Basic Phrases",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> options = [
    "Salut",
    "Hello",
    "Cum esti?",
    "How are you?",
    "Esti bine?",
    "Are you ok?",
    "Sunt bine",
    "I'm fine",
    "Cati ani ai?",
    "How old are you?",
    "Cum te cheama?",
    "What's your name?",
    "Ce e asta?",
    "What's this?",
    "Unde esti?",
    "Where are you?",
    "Esti sigur?",
    "Are you sure?",
    "De ce?",
    "Why?"
  ];
  String _audioName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Phrases"),
      ),
      body: Scrollbar(
        thickness: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1, crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          gradient: const LinearGradient(
                            begin: AlignmentDirectional.centerStart,
                            end: AlignmentDirectional.centerEnd,
                            colors: [
                              Colors.blue,
                              Colors.lightBlueAccent,
                            ],
                          ),
                        ),
                        child: InkWell(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                options[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                          onTap: () {
                            _audioName = options[index].replaceAll(" ", "").replaceAll("?", "").replaceAll("'", "");
                            Audio.load('assets/audio/$_audioName.m4a')
                              ..play()
                              ..dispose();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
