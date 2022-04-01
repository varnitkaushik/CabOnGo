import 'package:cabongo/global/global.dart';
import 'package:cabongo/splashScreen/splash_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CarInfoScreen extends StatefulWidget
{

  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}

class _CarInfoScreenState extends State<CarInfoScreen> {

  TextEditingController  carModelTextEditingController = TextEditingController();
  TextEditingController  carNumberTextEditingController = TextEditingController();
  TextEditingController  carColorTextEditingController = TextEditingController();

  List<String> carTypesList = ["Luxury Cab", "Regular Cab", "Bike"];
  String? selectedCarType;


  saveCarInfo()
  {
    Map driverCarInfoMap =
    {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };
    DatabaseReference driverRef =  FirebaseDatabase.instance.ref().child("drivers");
    driverRef.child(currentFirebaseUser!.uid).child("car_details").set(driverCarInfoMap);    //car_details is the subnode
    Fluttertoast.showToast(msg: "CONGRATULATIONS.Car Details have been saved. ");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 24,),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset("images/Cab.jpg"),
                ),
                const SizedBox(height: 10,),
                const Text(
                    "Write Car Details Below",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    )
                ),

                const SizedBox(height: 20,),


                TextField(
                  controller: carModelTextEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Model",
                    hintText: "Car Model",

                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                TextField(
                  controller: carNumberTextEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Number",
                    hintText: "Car Number",

                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),
                TextField(
                  controller: carColorTextEditingController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    labelText: "Car Color",
                    hintText: "Car Color",

                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)
                    ),

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),

                ),

                const SizedBox(height: 20,),

                DropdownButton(
                    iconSize: 20,
                    dropdownColor: Colors.white24,
                    hint: const Text(
                      "Please Choose Car Type",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                    value: selectedCarType,
                    onChanged:(newValue)
                    {
                      setState(() {
                        selectedCarType = newValue.toString();
                      });
                    },
                    items: carTypesList.map((car){
                      return DropdownMenuItem(
                          child: Text(
                            car,
                            style: const TextStyle(color: Colors.white),
                          ),
                        value: car,
                      );
                    }).toList(),
                ),

                const SizedBox(height: 20,),

                ElevatedButton(
                    onPressed: (){

                      if(carColorTextEditingController.text.isNotEmpty
                          && carNumberTextEditingController.text.isNotEmpty
                          && carModelTextEditingController.text.isNotEmpty && selectedCarType!= null)
                        {
                          saveCarInfo();

                        }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: const Text(
                      'Save Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),

                    ))
              ],
            ),
          ),

        ),
      ),

    );
  }
}
