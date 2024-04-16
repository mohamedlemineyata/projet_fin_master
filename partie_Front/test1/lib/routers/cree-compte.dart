import 'package:flutter/material.dart';
import 'package:test1/main.dart';
import 'package:test1/routers/reserve.dart';

import 'home.dart';

class Compte  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isKeyboard =MediaQuery.of(context).viewInsets.bottom !=0;
    final formkey = GlobalKey<FormState>();
    final scafoldkey = GlobalKey<ScaffoldState>();
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
       key: scafoldkey,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
                  child:  Column(
                       children: [
                         if (!isKeyboard)
                         SizedBox(height: 80),
                       const Text('Créer un compte',
                      style: TextStyle(color: Colors.lime,fontWeight: FontWeight.bold, fontSize: 40),
                 ),if (!isKeyboard)
                          SizedBox(height:100,),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                       color: Colors.white,
                       boxShadow: const [
                        BoxShadow(
                            color: Colors.lime,
                            blurRadius: 30,
                           offset: Offset(0, 10),
                        )
                     ]
                         ),
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
                      hintText: "Entrez votre Nom",
                      hintStyle: TextStyle(color: Colors.grey)
                     ),
                        validator: (value){
                        if (value!.isEmpty){
                          return " Nom requis";
                        }
                        return null;
                        }
                     ),
                    ),Container(
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
                              hintText: "Entrez votre Email",
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                            validator: (value){
                              if (value!.isEmpty){
                                return " Email requis";
                              }
                              return null;
                            }
                        ),
                      ),
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
                              hintText: "Entrez votre numéro d'appel",
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                            validator: (value){
                              if (value!.isEmpty){
                                return " numéro d'appel requis";
                              }
                              return null;
                            }
                        ),
                      ),Container(
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
                              hintText: "Entrer un mot de passe",
                              hintStyle: TextStyle(color: Colors.grey)
                          ),
                            validator: (value){
                              if (value!.isEmpty){
                                return " Mot de passe requis";
                              }
                              return null;
                            }
                        ),
                      ),
                    Container(
                    padding: const EdgeInsets.all(15),

                     child:  TextFormField(
                         autofocus: true,
                      decoration: InputDecoration(
                       border: InputBorder.none,
                        hintText: "Confirmez le mot de passe",
                       hintStyle: TextStyle(color: Colors.grey)
                       ),
                         validator: (value){
                           if (value!.isEmpty){
                             return " Confirmer le mot de passe requis";
                           }
                           return null;
                         }
                     ),
                    ),



                    ],

                ),


            ),
                         //if (!isKeyboard)
                         SizedBox(height: 50,),
                                 Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(50),

                                   ),
                                   child: Center(
                                     child: ElevatedButton(
                                       child:
                                       Text('Connecter',style: TextStyle(color: Colors.grey,),),
                                       style: ElevatedButton.styleFrom(
                                         padding: const EdgeInsets.symmetric(horizontal: 50),
                                         primary: Colors.lime[200],
                                         elevation: 0,
                                   ),
                                   onPressed: () {
                                            if(
                                            formkey.currentState!.validate()){
                                         Navigator.push(
                                       context,
                                       MaterialPageRoute(builder: (context) => Home()),
                                     );
                                         };
                                    },
                                   ),
                                   )
                                 )



                           ],
                         ),






          ),
              ),
        ),








    );
  }

}




