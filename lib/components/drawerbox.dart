import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newkhabar/utils/colors.dart';
import 'package:newkhabar/utils/text.dart';

class DrawerBox extends StatelessWidget {
  final String imageurl, description, title, time;

  const DrawerBox({
    Key? key,
    required this.imageurl,
    required this.description,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.all(5),
      // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: imageurl,
            imageBuilder: (context, imageProvider) => Container(
              width: w,
              // padding: EdgeInsets.all(0),
              //margin: EdgeInsets.all(0),
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                // borderRadius: BorderRadius.circular(5),
                color: Colors.yellow,
              ),
            ),
            placeholder: (context, url) => CircularProgressIndicator(
              color: AppColors.primary,
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(width: 1),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  SizedBox(height: 15),
                  Text(
                    description,
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  modifiedText(
                    color: AppColors.black,
                    size: 14,
                    text: time,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
