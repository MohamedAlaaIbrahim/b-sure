import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile.png"),
          ),
          Positioned(
            right: -2,
            bottom: 0,
            child: SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: const BorderSide(color: Colors.white)),
                  backgroundColor: const Color(0xFFF5F6F9),
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/camera.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
