import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

Map<String,String>conductor_busNumber ={};

Future<void>  fetchBusNumberData()async{
    try{
    QuerySnapshot data = await FirebaseFirestore.instance.collection('Routes').get();

    }catch(e){
      log("Error$e");
    }
}