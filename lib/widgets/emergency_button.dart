import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyButton extends StatelessWidget {
  

  final IconData icon;
  final String message;
  const EmergencyButton({
    this.icon,
    this.message,
    });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => launch(("tel://911")),
          child: Stack(
        children: <Widget>[
          _GradientBackground(),
          Positioned(
              right: -50,
              top: -50,
              child: Icon(
                this.icon,
                color: Colors.white.withOpacity(.2),
                size: 200,
              )),
          Column(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: double.infinity,
              ),
              Text(
                this.message,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Icon(
                this.icon,
                color: Colors.white,
                size: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _GradientBackground extends StatelessWidget {
  const _GradientBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          // color: Colors.red[600],
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              colors: <Color>[Color(0xffC9FFBF), Color(0xffFFAFBD)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
