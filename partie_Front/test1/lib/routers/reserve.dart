import 'package:flutter/material.dart';
import 'package:test1/routers/docteur.dart';
import 'InfDoctor.dart';
import 'package:http/http.dart';
import 'package:test1/main.dart';
import 'home.dart';

class Reserve extends StatefulWidget {
  @override
  _ReserveState createState() => _ReserveState();


}
  class _ReserveState extends State<Reserve> {

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


    List data = [];
  @override
  Widget build(BuildContext context) {
    final isKeyboard =MediaQuery.of(context).viewInsets.bottom !=0;
    List<Doctor> doctors = List.generate(100, (index) => Doctor(name: 'Doctor name ', Specialite: '', etat: 'etat ', idDoc: 'id'   ));
final formkey = GlobalKey<FormState>();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration:  BoxDecoration(color: Colors.white, )
                //padding: EdgeInsets.all(20),
            ,
            child: Column(
                 //crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 100,
                      child: Image.asset('assets/images/Our-clinic.PNG')
                      ),


                    // Text('Ramle Med Youssouf',
                    //   style: TextStyle(fontSize: 18, color: Colors.white),
                    // ),
                    // Text('ramle14589@gmail.com',style: TextStyle(color: Colors.white,fontSize: 14),
                    // )
                  ],
                ),
              ),
              SizedBox(height: 40,),
              ListTile(
                leading: Icon(Icons.add_business_outlined, color: Colors.lime),
                title: Text('Clinic'),
                onTap: (){
                  print('Clinic Clicked');},
              ),
              ListTile(
                leading: Icon(Icons.medical_services, color: Colors.lime),
                title: Text('medical_services'),
                onTap: (){
                  print('medical_services Clicked');},
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.lime),
                title: Text('Paramètres'),
                onTap: (){
                  print('Paramètres Clicke');},
              ),
              ListTile(
                leading: Icon(Icons.login, color: Colors.lime,),
                title: Text('se deconnecter '),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home()),
                  );
                  print('disconnector  Clicked');},
              ),
          ],
          ),
        ),

        appBar: AppBar(
          title: Text("OurClinic.mr",style: TextStyle(fontSize: 30,)),
          centerTitle: true,
           backgroundColor: Colors.lime,

          bottom: TabBar(
              tabs: [
            Tab(
              icon: Icon(Icons.add_alert,color: Colors.redAccent,size: 45,),
                text: "médecin d'urgence"),
            Tab(
              icon: Icon(Icons.add_chart_rounded, size: 45,color: Colors.black,),
              text: "prenez rendez-vous", )
    ]
    ),
        ),
        body: TabBarView(
          children: [
            //if (!isKeyboard)
         Padding(padding: const EdgeInsets.all(10),
              child:
              Form(
                key: formkey,
                child: Center(
                   child:  Column(
                     children: [
                       if (!isKeyboard)
                          Text('Formulaire d\'urgence ',
                          style: TextStyle(color: Colors.lime,fontWeight: FontWeight.bold, fontSize: 30),),
                       if (!isKeyboard) SizedBox(height: 30,),
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
                      ),
                //         child: Column(
                //           children: [
                TextFormField(
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

                  Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  )
                              ),
                  ),
                         TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Entrez votre Adresse",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return " Adresse requis";
                                    }
                                    return null;
                                  }
                              ),

                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  )
                              ),
                            ),
                              TextFormField(
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
                           // ),
           Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  border: Border(bottom: BorderSide(
                                    color: Colors.grey,
                                  ),
                                  )
                              ),
           ),
                               TextFormField(
                                  autofocus: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Entrer le specialite ",
                                      hintStyle: TextStyle(color: Colors.grey)
                                  ),
                                  validator: (value){
                                    if (value!.isEmpty){
                                      return " specialite requis";
                                    }
                                    return null;
                                  }
                              ),
                //             ),
                       Container(
                         padding: const EdgeInsets.all(10),
                         decoration: const BoxDecoration(
                             border: Border(bottom: BorderSide(
                               color: Colors.grey,
                             ),
                             )
                         ),
                       ),

        TextFormField(
          focusNode: myFocus,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Votre Etat",
                                    hintStyle: TextStyle(color: Colors.grey)
                                ),
                              ),


                //           ],
                //
                //         ),
                //
                //
                //       ),

                       if (!isKeyboard)
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                               ElevatedButton(
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
                            ElevatedButton(
                                    child:
                                    Text('Suivent',style: TextStyle(color: Colors.grey,),),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 50),
                                      primary: Colors.lime[200],
                                      elevation: 0,
                                    ),
                                    onPressed: ()
                                    //=> myFocus.requestFocus(),
                                       {
                                      if(
                                      formkey.currentState!.validate()){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => InfDoctor()),
                                        );
                                      };
                                     },
                                  ),
                          ],
                        ),

                      )



                    ],
                  ),






                ),
              ),
),


           // ...List.generate(data.length, (index) => Card(child: ListTile(title: Text("${data[index]}"),),))
            Expanded(child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (context ,i)=> ListTile(
                title: Text(doctors[i].name),
                subtitle: Text(doctors[i].etat),
                trailing: Text('Speciality ${doctors[i].Specialite}'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InfDoctor(),
                  ));
                },
              ),
            ),



            ),
          ],

        ),






    ),
      )
    );
  }
}

