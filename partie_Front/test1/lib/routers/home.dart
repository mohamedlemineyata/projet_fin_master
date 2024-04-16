
import 'package:flutter/material.dart';
import 'package:test1/main.dart';
import 'package:test1/routers/reserve.dart';
//import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:test1/routers/docteur.dart';
import 'package:test1/routers/env.Simple.dart';

import 'cree-compte.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
  class _HomeState extends State<Home>{
  var myFocus;
  @override
  void initState() {
   super.initState();
   myFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    myFocus.dispose();
  }

    @override
    Widget build(BuildContext context) {
      final isKeyboard =MediaQuery.of(context).viewInsets.bottom !=0;
      final formerly = GlobalKey<FormState>();
      final scaffold = GlobalKey<ScaffoldState>();
      return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          key: scaffold,
          backgroundColor: Colors.white,
          body: Container(
              child: Column(
                children:[
                  SizedBox(height: 80,),
                  Image.asset('assets/images/Our-clinic.PNG'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formerly,
                      child: Center(
                        child: Column(
                                  children: [
                                    if (!isKeyboard)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 40),
                                      child: SingleChildScrollView(
                                       child: Column(
                                        children: [
                                          if (!isKeyboard)
                                            Text('Se connecter',
                                              style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold, fontSize: 30),),
                                          SizedBox(height: 35),


                                          Container(
                                            //padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.lime,
                                                    blurRadius: 20,
                                                    offset: Offset(0, 10),
                                                  )
                                                ]
                                            ),
                                            child:
                                            Center(
                                              child: Flexible(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      padding: const EdgeInsets.all(10),
                                                      decoration: const BoxDecoration(
                                                          border: Border(bottom: BorderSide(
                                                            color: Colors.grey,
                                                          ),
                                                          )
                                                      ),
                                                      child:  TextFormField(
                                                        autofocus: true,
                                                          decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              hintText: "Nom d'utilisateur",
                                                              hintStyle: TextStyle(color: Colors.grey)
                                                          ),
                                                          validator: (value){
                                                            if (value!.isEmpty){
                                                              return " Nom d'utilisateur requis";
                                                            }
                                                            return null;
                                                          }
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: const EdgeInsets.all(10),
                                                      child:  TextFormField(
                                                        focusNode: myFocus,
                                                          decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              hintText: "Mot de passe",
                                                              hintStyle: TextStyle(color: Colors.grey)
                                                          ),
                                                          validator: (value){
                                                            if (value!.isEmpty){
                                                              return " Password requis";
                                                            }
                                                            return null;
                                                          }
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                          ),
                                          if (!isKeyboard)
                                            SizedBox(height: 20,),
                                          Container(child:
                                          ElevatedButton(
                                            onPressed: () {print('page recuper password');  },
                                            child:  Text('Mot de passe oublié?', style:
                                            TextStyle(color: Colors.grey),),
                                            style: ElevatedButton.styleFrom(
                                              //padding: const EdgeInsets.symmetric(horizontal: 70),
                                                primary: Colors.white,
                                                elevation: 0

                                            ),
                                          ),
                                          ),
                                          SizedBox(height: 40),



                                          ElevatedButton(
                                              child: Text('Se connecter',style: TextStyle(color: Colors.grey,),),
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(horizontal: 70),
                                                primary: Colors.lime[200],
                                                elevation: 0,

                                              ),

                                              onPressed: ()  {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) => Reserve()),
                                                );
                                              }

                                          ),
                                          SizedBox(height: 20,),
                                          ElevatedButton(
                                            child: Text('Créer un compte',style: TextStyle(color: Colors.lime),),
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.grey,
                                              elevation: 0,
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(builder: (context) => Compte()),
                                              ); },
                                          )
                                        ],
                                      ),
                                      ),

                                    ),
                      ]
                    ),
                  )
                    )
                  )
                ] ,
          ),

          )




        ),
      );
    }





  }
