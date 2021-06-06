import 'package:flutter/material.dart';

class TemplateCard extends StatelessWidget {
  final String image;
  final String title;

  const TemplateCard({this.image, this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Card(
        color: Colors.transparent,
        elevation: 4,
        child: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(Colors.black26, BlendMode.darken),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              child: Text(
                title,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
  }
}
