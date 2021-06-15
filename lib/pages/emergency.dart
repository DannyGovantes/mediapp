import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:mediapp/models/image_path.dart';
import 'package:mediapp/models/item_button.dart';
import 'package:mediapp/models/messages.dart';
import 'package:mediapp/pages/instruction.dart';
import 'package:mediapp/widgets/emergency_button.dart';
import 'package:mediapp/widgets/instruction_button.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final items = <ItemButton>[
      new ItemButton(
            Icons.invert_colors, 
            'Heridas', 
            Color(0xff6989F5), 
            Color(0xff906EF5),
            messages[0],
            injury
            ),
      new ItemButton(
            Icons.fireplace_outlined, 
            'Quemaduras ', 
            Color(0xff66A9F2),
            Color(0xff536CF6),
            messages[1],
            burnImages),
      new ItemButton(
            Icons.person_remove_alt_1_outlined,
            'Manejo de la persona lesionada',
            Color(0xffF2D572),
            Color(0xffE06AA3),
            messages[2],
            manage),
      new ItemButton(
            Icons.electric_rickshaw_rounded, 
            'Accidentes eléctricos',
            Color(0xff317183), 
            Color(0xff46997D),
            messages[3],
            electric),
      new ItemButton(
            Icons.carpenter_sharp, 
            'El botiquín de primeros auxilios',
            Color(0xff6989F5), 
            Color(0xff906EF5),
            messages[4],
            firstAid),
    ];

    List<Widget> itemMap = items
        .map((item) => FadeInLeft(
              duration: Duration(milliseconds: 300),
              child: InstructionButton(
                  icon: item.icon,
                  message: item.texto,
                  colorPrimary: item.color1,
                  colorSecondary: item.color2,
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => InstructionsPage(
                                  title: item.texto,
                                  mainColor: item.color2,
                                  secondColor: item.color1,
                                  icon: item.icon,
                                  text: item.instruction,
                                  images: item.images,
                                )))
                      }),
            ))
        .toList();

    return Scaffold(
        backgroundColor: Color(0xff171717),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 200),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[SizedBox(height: 80), ...itemMap],
              ),
            ),
            EmergencyButton(
              icon: Icons.add,
              message: "Llamar a urgencias",
            )
          ],
        ));
  }
}

