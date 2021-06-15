import 'package:flutter/material.dart';

class InstructionButton extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color colorPrimary;
  final Color colorSecondary;
  final Function onPressed;
  const InstructionButton(
      {this.icon,
      this.message,
      this.colorPrimary,
      this.colorSecondary,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: this.onPressed,
          child: Stack(
        children: <Widget>[
          InstructionButtonBackground(
            colorPrimary: this.colorPrimary,
            colorSecondary: this.colorSecondary,
            icon: this.icon,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 120,
                width: 30,
              ),
              Icon(
                this.icon,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                this.message,
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InstructionButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color colorPrimary;
  final Color colorSecondary;
  const InstructionButtonBackground({
    this.colorPrimary,
    this.colorSecondary,
    this.icon
     });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
                right: -20,
                top: -20,
                child: Icon(
                  this.icon,
                  size: 150,
                  color: Color(0xff171717).withOpacity(0.2),
                )),
          ],
        ),
      ),
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
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
                this.colorPrimary,
                this.colorSecondary])),
    );
  }
}
