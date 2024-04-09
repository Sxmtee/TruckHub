import 'package:flutter/material.dart';
import 'package:trucks/Common/Utils/dimension.dart';

class PlaceHolderImage extends StatelessWidget {
  final String image;
  final String text;
  const PlaceHolderImage({
    super.key,
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.sHeight * 37.5,
            width: SizeConfig.sWidth * 83.33,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(image),
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: SizeConfig.sHeight * 2,
          ),
        ],
      ),
    );
  }
}
