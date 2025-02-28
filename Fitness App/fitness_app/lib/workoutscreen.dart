import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    super.initState();
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        'https://youtu.be/c4DAnQ6DtF8',
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  void _playVideo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 200,
                      child: YoutubePlayer(
                        controller: _youtubePlayerController,
                        showVideoProgressIndicator: true,
                        onReady: () {
                          _youtubePlayerController.play();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Workout Video",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ButtonBar(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromRGBO(29, 29, 29, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 33, 38, 1),
      body: Stack(
        children: [
          Positioned(
            top: 104,
            left: 40,
            child: Container(
              height: 250,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/young-athletic-woman-white-headphones-training-listening-music-street-outdoors-working-lower-body-out-mat-concept-healthy-lifestyle-open-air-sport-activity-weight-loss 1.png",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 220,
            left: 40,
            child: Container(
              height: 134,
              width: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(23),
                  bottomRight: Radius.circular(23),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(104, 104, 104, 0),
                    Color.fromRGBO(29, 29, 29, 1),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 322,
            left: 86,
            child: Container(
              height: 64,
              width: 258,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromRGBO(25, 33, 38, 0.1),
                border: Border.all(
                  width: 0.5,
                  color: const Color.fromRGBO(187, 242, 70, 1),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(187, 242, 70, 1),
                      ),
                      child: const Icon(
                        Icons.timer_outlined,
                        color: Color.fromRGBO(25, 29, 26, 1),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Time",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        Text(
                          "20 min",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(187, 242, 70, 1),
                          ),
                        )
                      ],
                    ),
                    const VerticalDivider(
                      color: Color.fromRGBO(255, 255, 255, 0.25),
                      thickness: 1,
                    ),
                    Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromRGBO(187, 242, 70, 1),
                      ),
                      child: const Icon(
                        Icons.water_drop_outlined,
                        color: Color.fromRGBO(25, 29, 26, 1),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Burn",
                          style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 1)),
                        ),
                        Text(
                          "95 kcal",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(187, 242, 70, 1),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 410,
            left: 40,
            child: Text(
              "Lower Body Training",
              style: GoogleFonts.lato(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: const Color.fromRGBO(255, 255, 255, 1)),
            ),
          ),
          Positioned(
            top: 456,
            left: 40,
            child: Container(
              width: 350,
              height: 88,
              child: Text(
                "The lower abdomen and hips are the most difficult areas of the body to reduce when we are on a diet. Even so, in this area, especially the legs as a whole, you can reduce weight even if you don't use tools.",
                style: GoogleFonts.lato(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 0.5)),
              ),
            ),
          ),
          Positioned(
            top: 584,
            left: 40,
            child: Row(
              children: [
                Text(
                  "Round",
                  style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
                const SizedBox(
                  width: 240,
                ),
                Text(
                  "1/8",
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 620,
            bottom: 10,
            left: 40,
            right: 40,
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                final exerciseNames = [
                  'Squats',
                  'Lunges',
                  'Leg Press',
                  'Hamstring Curls',
                  'Calf Raises',
                  'Glute Bridges',
                  'Deadlifts',
                  'Step-Ups'
                ];

                final exerciseDescriptions = [
                  'A basic lower body exercise that targets the thighs and glutes.',
                  'An exercise focusing on the legs, particularly the quadriceps and glutes.',
                  'A machine-based exercise for targeting the quads, hamstrings, and glutes.',
                  'An isolation exercise that targets the hamstrings at the back of the thighs.',
                  'A standing exercise that targets the calves.',
                  'An exercise that focuses on strengthening the glutes and lower back.',
                  'A compound movement that targets the hamstrings, glutes, and lower back.',
                  'An exercise that involves stepping up onto a raised platform, targeting the legs and glutes.'
                ];

                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color.fromRGBO(56, 64, 70, 1),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: _playVideo,
                    contentPadding: const EdgeInsets.all(10),
                    title: Text(
                      exerciseNames[index],
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    subtitle: Text(
                      exerciseDescriptions[index],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 0.7),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(187, 242, 70, 1),
                      child: Text(
                        '${index + 1}',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: const Color.fromRGBO(25, 29, 26, 1),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
