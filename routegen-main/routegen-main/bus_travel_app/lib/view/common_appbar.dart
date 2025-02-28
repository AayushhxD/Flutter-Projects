import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './notification_screen.dart';
import 'package:routegen/view/pooja/profile.dart';



class CommonAppbar extends StatelessWidget implements PreferredSizeWidget{
  final double? titleSize;
  final double? iconSize;
  final Color? background;
  final bool? isNotificationOpen;
  final bool? isProfileOpen;

  const CommonAppbar({super.key, 
    this.titleSize = 28,
    this.iconSize = 40,
    required this.isNotificationOpen,
    this.isProfileOpen = false,
    this.background = const Color.fromRGBO(255,136,17,1),
  });

  @override
  Widget build(BuildContext context){

    return AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: background,
        title: Row(children: [
          SizedBox(
            height: iconSize,
            width: iconSize,
            child: Image.asset('asset/RG_logo.png', fit: BoxFit.contain),
          ),
          const SizedBox(width: 10),
          Text(
            'RouteGen',
            style: GoogleFonts.raleway(
              fontSize: titleSize,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),),
        ],),
        actions: [
// Notification button
          GestureDetector(
            onTap: (){
              if(isNotificationOpen! == false){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=> const NotificationScreen())
                );
              }
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromARGB(255, 43, 4, 68),
              ),
              child: SvgPicture.asset('asset/bell_icon.svg'),
            ),
          ),
          const SizedBox(width: 20),
// Profile pic
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext centext)=> const ProfileScreen()),
              );
            },
            child: Container(
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.2, color: const Color.fromRGBO(180, 93, 7, 1))
              ),
              child: const ClipOval(child: Icon(Icons.face)),
            ),
          ),
          const SizedBox(width: 30),
        ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}