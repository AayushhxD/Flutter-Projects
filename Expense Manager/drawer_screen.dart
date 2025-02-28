import "package:expensemanager/category_screen.dart";
import "package:expensemanager/graph_screen.dart";
import "package:expensemanager/home_screen.dart";
import "package:expensemanager/trash_screen.dart";
import "package:flutter/material.dart";

class MyDrawer extends StatefulWidget{
  const MyDrawer({super.key});

  @override
  State createState()=>_MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer>{

  bool transactionFlag = false;
  bool graphFlag = false;
  bool categoryFlag = false;
  bool trashFlag =false;
  bool aboutusFlag = false;
 
 @override
  Widget build(BuildContext context){
    return  Drawer( 
      backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
      width:260,
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start, 
        children: [ 
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Expense Manager",
                  style: TextStyle( 
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  }, 
                  icon: const Icon(
                    Icons.close
                  )
                  )
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              child:const Text("Saves all your Transactions",
              style: TextStyle( 
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
              ),
            ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Transaction conatiner
         GestureDetector(
          onTap:() {
            Navigator.pop(context);
             Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const home_screen()),
                );
                 if(!transactionFlag){
                transactionFlag =true;
                categoryFlag=false;
                graphFlag=false;
                transactionFlag=false;
                aboutusFlag=false;
              }
              setState(() {
                
              });
            
          },
           child: Container(
              alignment: Alignment.centerLeft,
              height: 45,
              width: 185,
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: transactionFlag
                          ?const Color.fromRGBO(14, 161, 125, 0.15):const  Color.fromRGBO(255, 255, 255, 1)
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.my_library_books_outlined,
                    color: Color.fromRGBO(4, 161, 125, 1),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Transaction",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
         ),
          const SizedBox(
            height: 10,
          ),
          //Graphs Conatiner
          GestureDetector(
            onTap: () {
            Navigator.pop(context);
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>const  MyAppGraphs(),
            )
            );
              setState(() {
                if(!graphFlag){
                  graphFlag =true;
                  transactionFlag=false;
                  categoryFlag=false;
                  trashFlag=false;
                  aboutusFlag=false;
                }
                
              });
           
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 45,
              width: 185,
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color:(graphFlag)?const Color.fromRGBO(14, 161, 125, 0.15):const  Color.fromRGBO(255, 255, 255, 1),
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.data_saver_off_outlined,
                    color: Color.fromRGBO(4, 161, 125, 1),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Graphs",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
           const SizedBox(
            height: 10,
          ),
           ///Categories
                  GestureDetector(
                    onTap:(){
                       Navigator.pop(context);
                      setState(() {
                        if(!categoryFlag){
                          categoryFlag=true;
                          transactionFlag=false;
                          graphFlag=false;
                          trashFlag=false;
                          aboutusFlag=false;
                        }
                      });
                       Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const MyCategory()),
                );
                    },
                    child: Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                width: 185,
                                decoration:  BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                                    color: (categoryFlag)?const Color.fromRGBO(14, 161, 125, 0.15):const  Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                    Icons.label,
                    color: Color.fromRGBO(4, 161, 125, 1),
                                    ),
                                    Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                                    )
                                  ],
                                ),
                              ),
                  ),
           const SizedBox(
            height: 10,
          ), 
          //Trash
           GestureDetector(
            onTap:(){
               Navigator.pop(context);
              if(!trashFlag){
                trashFlag=true;
                transactionFlag=false;
                graphFlag=false;
                categoryFlag=false;
                aboutusFlag=false;
              }
              
              setState(() {
                
              });
              Navigator.push(context, 
              MaterialPageRoute(builder:(context) =>const MyAppTrash(),)
              );
            },
             child: Container(
              alignment: Alignment.centerLeft,
              height: 45,
              width: 185,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color:(trashFlag)?const Color.fromRGBO(14, 161, 125, 0.15):const  Color.fromRGBO(255, 255, 255, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.delete,
                    color: Color.fromRGBO(4, 161, 125, 1),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "Trash",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  )
                ],
              ),
                       ),
           ),
           const SizedBox(
            height: 10,
          ), 
          //About us
             GestureDetector(
              onTap:() {
                 Navigator.pop(context);
                if(!aboutusFlag){
                  aboutusFlag=true;
                  transactionFlag=false;
                  graphFlag=false;
                  categoryFlag=false;
                  trashFlag=false;
                }
                setState(() {
                  
                });
              },
               child: Container(
                           alignment: Alignment.centerLeft,
                           height: 45,
                           width: 185,
                           decoration:  BoxDecoration(
                  borderRadius:const  BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color:(aboutusFlag)?Color.fromRGBO(14, 161, 125, 0.15):Colors.white),
                           child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.person,
                    color: Color.fromRGBO(4, 161, 125, 1),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Text(
                      "About Us",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(14, 161, 125, 1),
                      ),
                    ),
                  )
                ],
                           ),
                         ),
             ), 
        ],
      ),
     );
    
  }
}