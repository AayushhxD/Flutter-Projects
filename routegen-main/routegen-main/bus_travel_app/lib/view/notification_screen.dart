import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routegen/view/common_appbar.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CommonAppbar(titleSize: 16, iconSize: 35, background: Colors.white24, isNotificationOpen: true),
      body: Column(children: [
        Container(
          height: 230,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('asset/map_background.png'), fit: BoxFit.cover),
          ),
          child: Column(children: [
            SizedBox(height: 20, width: MediaQuery.of(context).size.width),
            /// Notification conunt
            Container(
              height: 50, width: 50,
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(26,21,40,1),
              ),
              /// LENGTH OF LIST OF NOTIFICATIONS....
              child: Text(
                '\$num',
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),),
            ),
            Text(
              'New Notifications',
              style: GoogleFonts.raleway(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],),
        ),
        Container(
          height: 408,
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                      )],
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          /// ICONS DETAILED...
                          Container(
                            height: 40,width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle, 
                              color: Color.fromRGBO(255,136,17,1),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(255,136,17,0.05),
                                spreadRadius:15,
                              )],
                            ),
                            child: SvgPicture.asset('asset/Ticket_bottom.svg'),
                          ),

                          /// MAIN IMFORMATION ABOUT NOTIFICATION
                          const SizedBox(width: 10),
                          Text('Route Delayed',
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),),
                          const Spacer(),

                          /// DATE AND TIME
                          Text('${DateTime.now().day}, ${DateTime.now().month}',
                          style: GoogleFonts.raleway(
                            color: Colors.black45,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),),
                        ],),

                        /// DESCRIPTION OF NOTIFICATION/ REASON FOR NOTIFICATION
                        Text('The route that starts from \$city loaction is delayed by 5 minutes.',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                    ],),
                  ),
                ],),

            );
          }),
        ),
      ],),
      // bottomNavigationBar: const OneBottomnav(),
    );
  }
}