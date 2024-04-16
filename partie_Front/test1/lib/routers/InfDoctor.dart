import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:test1/routers/docteur.dart';
import 'package:test1/routers/reserve.dart';
class InfDoctor  extends StatefulWidget {
  @override
  _InfDoctorState createState() => _InfDoctorState();
}

class _InfDoctorState extends State<InfDoctor> {

  List data = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Doctor'),
        backgroundColor: Colors.lime,
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Text('${docteur.name}',
              style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: 20,),
            Text('Specialite : ${docteur.Specialite}'),
            SizedBox(height: 20,),
            Text('Etat : ${docteur.etat}', style: TextStyle(color: Colors.redAccent),)
            ,
            SizedBox(height: 40,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(builder: (context) => Reserve()),
                            );
                          },
                          child: Text('Annulez'  ,style: TextStyle(color: Colors.black),),
                          style: ElevatedButton.styleFrom(
                        //padding: const EdgeInsets.symmetric(horizontal: 50),
                        primary: Colors.red[200],
                        elevation: 0,
                         ),
                        ),
                        ),
                    Container(
                        child: ElevatedButton(
                          onPressed: () async {

                            var response = await get(
                               Uri.parse("http://jsonplaceholder.typicode.com/posts"));
                                var responsebody = jsonDecode(response.body);
                            data.addAll(responsebody);
                            setState(() {

                            });
                          },
                          child: Text('Rendez-vous' ,style: TextStyle(color: Colors.grey),),
                          style: ElevatedButton.styleFrom(
                            //padding: const EdgeInsets.symmetric(horizontal: 50),
                            primary: Colors.lime,
                            elevation: 0,
                          ),
                        )
                       ),
                     ],
                ),
            ),
            ...List.generate(data.length, (index) => Card(child: ListTile(title: Text("${data[index]['id']}"),),))

          ],

        ),
      )
    );
  }
}


