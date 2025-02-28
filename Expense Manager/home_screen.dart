import "package:expensemanager/drawer_screen.dart";
import "package:expensemanager/modalClass.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/painting.dart";
import "package:flutter/widgets.dart";
import "package:intl/intl.dart";


class home_screen extends StatefulWidget {
  const home_screen ({super.key});

  State createState ()=>_home_screenState();
}

class _home_screenState extends State{
  
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController desccriptionController = TextEditingController();

  List<Map<String, String>> categories = [
    {
      "assets/Images/medicine.png": "Medicine",
    },
    {
      "assets/Images/food.png": "Food"
      },
    {
      "assets/Images/fuel.png": "Fuel"
      },
    {
      "assets/Images/shopping.png": "Shopping"
      },
      {
      "assets/Images/Entertaiment.png": "Entertainment"
      },
  ];

  List transactionList = [];

  void Submit(){
    transactionList.add(
      TransactionModalClass(title: categoryController.text, amount:amountController.text, desccription: desccriptionController.text
      )
    );
  }

  void bottomSheet (){
    showModalBottomSheet(
      backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      builder:(context) {
        return Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom
              ),
          child: Column( 
            mainAxisSize: MainAxisSize.min,
            children: [ 
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Date" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Date TextField
              SizedBox(
                height: 45,
                child: TextFormField(
                  controller: dateController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                       initialDate: DateTime.now(),
                       firstDate: DateTime(2000),
                       lastDate: DateTime(2050)
                        );
                    String formatedDate = DateFormat.yMMMd().format(pickedDate!);
                    setState(() {
                      dateController.text=formatedDate;
                    });
                  },
                ),
              ),
                           const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Amount" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Amount TextField
              SizedBox(
                 height: 45,
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Category" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //category Controller
              SizedBox(
                 height: 45,
                child: TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
             const Row( 
                children: [ 
                  Text( 
                    "Description" ,
                    style: TextStyle( 
                      fontSize:15,
                      fontWeight: FontWeight.w500,
                    ),
                    )
                ],
              ),
              //Description TextField
              SizedBox(
                 height: 45,  
                child: TextFormField(
                  controller: desccriptionController,
                  decoration: InputDecoration( 
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.circular(9)
                    )
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
               ElevatedButton(
                    onPressed: () {
                      
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
                        fixedSize: const Size(150,50)),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(255, 255, 255, 1)
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
        
            ],
          ),
           );
      },
      );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:const  Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar( 
        backgroundColor: const  Color.fromRGBO(255, 255, 255, 1),
        title: const Text( "June 2022",
          style: TextStyle( 
            fontSize:16,
            fontWeight: FontWeight.w500 
          ),
        ),
        actions: [ 
          IconButton(
            onPressed: (){

          },
          icon: const Icon( 
            Icons.search,
            size: 30,
          ),
          )
        ],
      ),
      drawer:const MyDrawer(),
      //Main Body Of App
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder:(context, index) {
          return Container( 
            height:100,
            width:360,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10
            ),
            child: Column( 
                children: [ 
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                     Container( 
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(100),
                        color:const  Color.fromRGBO(0, 174, 91, 0.7),
                      ),
                      child: Center( 
                        child: Image.asset( 
                          categories[index].keys.toList()[0]
                        ),
                      ),
                    ),
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              child: Row( 
                                children: [ 
                                 Text(
                                  categories[index].values.toList().first,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                  const Spacer(),
                                        IconButton(
                                      onPressed: () {
                        
                                      },
                                      icon: const Icon(
                                        Icons.remove_circle_rounded,
                                        color: Color.fromRGBO(246, 113, 49, 1),
                                      )),
                                 const Text(
                                  "600",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                        Container(
                        alignment: Alignment.bottomLeft,
                        width: 251,
                         child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the ",
                                  style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                                
                                  ),
                              )
                            ],
                          ),
                       ),
                          ],
                        ),

                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      
                       Text( "3 June | 11:50 AM",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          ),
                          SizedBox(
                            width: 8,
                          )
                    ],
                  ),
                  Divider()
                ],
              ),
          );
        }, ),

        floatingActionButton: FloatingActionButton.extended (
          backgroundColor:const Color.fromRGBO(255, 255, 255, 1),
          label: const Text(
              "Add Transaction",
              style: TextStyle( 
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black
              ),
            )
          ,
          icon:const Icon( 
              Icons.add_circle_rounded,
              color: Color.fromRGBO(14, 161, 125, 1),
              size: 33
            ),
            onPressed: (){
              setState(() {
                bottomSheet();
              });
            },

            shape:RoundedRectangleBorder( 
              borderRadius: BorderRadius.circular(67)
            ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}