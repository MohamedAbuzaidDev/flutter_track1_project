import 'package:flutter/material.dart';
import 'package:track1_project/core/constants/colors.dart';


class StarterAppItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String routesName;
  
  const StarterAppItem({super.key,required this.imagePath,required this.title,required this.routesName});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColor.white
      ),
      child: Row(
        children: [
          Image.asset('assets/images/$imagePath.jpg',
          width: 70,
          height: 70,
          fit: BoxFit.cover,
          ),
          const Spacer(),
          Text(title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
          const Spacer(),
          InkWell(
            onTap: () => Navigator.pushNamed(context, routesName),
            child: Container(
              width: 30,
              height: 30,
              margin: const  EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primary
              ),
              child: Icon(
                size:30,
                color: AppColor.white,
                Icons.arrow_right,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),

    );
  }
}