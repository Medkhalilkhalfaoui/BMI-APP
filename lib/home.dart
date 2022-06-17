import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = false ;
  double heightVal= 170;
  int weight = 55 ;
  int age = 18 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("body"),
      ),
      body: SafeArea(
        child: Center(
          child:Row(
            children: [
              M1Expanded ( context, 'Male'),
              const SizedBox(width: 20),
              M1Expanded ( context, 'Female'),
            ],
          ),
        ),
      ),
    );
  }
  Widget M1Expanded (BuildContext context, String type ){
    return  Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            isMale = type == 'Male'? true:false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type== 'Male')||(!isMale && type== 'Female')? Colors.teal : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Icon( type == 'Male' ?Icons.male:Icons.female),
              const SizedBox(height: 15,),
              Text(type, style: Theme.of(context).textTheme.headline2,)
            ],
          ),
        ),
      ) ,
    );
  }
}
