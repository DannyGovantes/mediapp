import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:mediapp/pages/slideshow.dart';

class InstructionsPage extends StatelessWidget {
  final String text;
  final String title;
  final Color mainColor;
  final Color secondColor;
  final IconData icon;
  final assetPath;
  final List<String> images;

  InstructionsPage(
      {this.text,
      this.assetPath,
      this.title,
      this.mainColor,
      this.secondColor,
      this.icon,
      this.images
      });

  final FlutterTts flutterTTS = FlutterTts();
  speak() async {
    await flutterTTS.setLanguage('es-US');
    await flutterTTS.speak(this.text);
  }

  stopSpeak() async {
    await flutterTTS.stop();
  }

  @override
  Widget build(BuildContext context) {
    int count = 0;
    List<Widget> itemMap = text
        .split('\n')
        .map((textRow) => Container(
            decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 6),
                blurRadius: 10)
              ],
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: <Color>[
                mainColor,
                secondColor])),
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      'Paso: ${++count}',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Text(
                      textRow,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ],
              ),
            ))
        .toList();
    return Scaffold(
      backgroundColor: Color(0xff171717),
      appBar: AppBar(
        backgroundColor: Color(0xff1e1e1e),
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
            stopSpeak();
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
              child: Icon(
            this.icon,
            color: this.secondColor.withOpacity(0.1),
            size: 400,
          )),
          ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(height: 15.0),
              Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(this.title,
                      style: TextStyle(
                          fontFamily: 'Varela',
                          fontSize: 42.0,
                          fontWeight: FontWeight.bold,
                          color: this.mainColor))),
              SizedBox(height: 100.0),
              ...itemMap
            ],
          ),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () => speak(),
              child: Container(
                child: Icon(Icons.record_voice_over_outlined),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: this.mainColor,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          Positioned(
              top: 60,
              right: 20,
              child: Text(
                'Dictar',
                style: TextStyle(color: this.mainColor, fontSize: 10),
              )),
          Positioned(
            right: 70,
            top: 10,
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SlideshowPage( images: this.images
                    ,))),
                    stopSpeak()
              },
              child: Container(
                child: Icon(Icons.image_search_sharp),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: this.secondColor,
                    borderRadius: BorderRadius.circular(25)),
              ),
            ),
          ),
          Positioned(
              top: 60,
              right: 80,
              child: Text(
                'Visual',
                style: TextStyle(color: this.mainColor, fontSize: 10),
              )),
        ],
      ),
    );
  }
}
