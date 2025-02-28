import "package:expensemanager/signup_screen.dart";
import "package:flutter/material.dart";

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State createState()=>_SplashState();
}

class _SplashState extends State{

   @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
          const SizedBox(
            height: 20,
          ),
          Center( 
            child: GestureDetector(
              onTap: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup_Screen()),
                );
              },
              child:TweenAnimationBuilder(

                tween: Tween<double>(begin: 0,end: 200),
                duration: const Duration(milliseconds: 1500),
                builder: (context, value, child) {

                  return Container( 
                  height: value,
                  width: value,
                  decoration: BoxDecoration( 
                    borderRadius: BorderRadius.circular(100),
                    color:const  Color.fromRGBO(234, 238, 235, 1),
                  ),
                  child: child,
                );
                },
              child: Center( 
                    child: Image.asset(
                      "assets/Images/logo.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
              ),
            ),
          ),
         const  Text( 
            "Expense Manager",
            style: TextStyle( 
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}