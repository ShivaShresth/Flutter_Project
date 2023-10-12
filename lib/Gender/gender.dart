import 'package:firstproject/Gender/gender_service_model.dart';
import 'package:firstproject/Gender/gender_user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
GenderUserServices genderUserServices=GenderUserServices();
late GenderServiceModel genderServiceModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text("hello"),
      ),
    );
  }
}