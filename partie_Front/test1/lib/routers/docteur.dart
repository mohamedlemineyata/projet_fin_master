import 'package:flutter/material.dart';


class Doctor{
  final String idDoc;
  final  String name;
  final String Specialite;
  final  String etat;
   Doctor({required this.idDoc, required this.name, required this.Specialite, required this.etat});


  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      idDoc: json['idDoc'],
      name: json['name'],
      Specialite: json['Specialite'],
      etat: json['etat'],
    );
  }
  Map<String, dynamic> toJson() => {
    'idDoc' : idDoc,
    'name': name,
    'Specialite': Specialite,
    'etat' : etat,
  };

}

Doctor get docteur => Doctor(name: "Zeineb", Specialite: "Dantiste", etat: "ouvert", idDoc: '');



