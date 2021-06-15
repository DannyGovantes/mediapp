import 'package:flutter/material.dart';


import 'package:mediapp/widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  final List<String> images;
  const SlideshowPage({this.images});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1e1e1e),
      ),
      backgroundColor: Color(0xff171717),
      body: MiSlideshow(
        images: this.images,
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {
  final List<String> images;
  const MiSlideshow({this.images});

  @override
  Widget build(BuildContext context) {
    List<Widget> itemMap =
        images.map((image) => Image(image: AssetImage(image))).toList();

    return Slideshow(
      bulletPrimario: 20,
      bulletSecundario: 12,
      colorPrimario: Color(0xffFF5A7E),
      slides: <Widget>[...itemMap],
    );
  }
}
