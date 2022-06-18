import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    M1Expanded ( context, 'Male'),
                    const SizedBox(width: 20),
                    M1Expanded ( context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color:Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Height',style: Theme.of(context).textTheme.headline2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                        Text(heightVal.toStringAsFixed(1), style: Theme.of(context).textTheme.headline1,),
                        Text('CM', style: Theme.of(context).textTheme.bodyText1)
                      ],),
                      Slider(
                          value: heightVal,
                          min: 90,
                          max: 220,
                          onChanged: (newvalue){
                            setState(() {
                              heightVal = newvalue;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),Expanded(
              child:Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    M2Expanded ( context, 'Weight'),
                    const SizedBox(width: 20),
                    M2Expanded ( context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.height/16,
              width: double.infinity,
              child: TextButton(
                  onPressed: (){
                    var result = weight/pow(heightVal/100, 2);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Result(result: result, isMale: isMale, age: age);
                    }));
                  },
                  child:  Text('Calculate', style: Theme.of(context).textTheme.headline2 )
              ),
            ),
          ],
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
               Icon( type == 'Male' ?Icons.male:Icons.female, size: 90,),
              const SizedBox(height: 15,),
              Text(type, style: Theme.of(context).textTheme.headline2, )
            ],
          ),
        ),
      ) ,
    );
  }
  Widget M2Expanded (BuildContext context, String type ){
    return  Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type, style: Theme.of(context).textTheme.headline2,),
            SizedBox(height: 15,),
            Text(type == 'Age'? '$age':'$weight', style: Theme.of(context).textTheme.headline1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag:type == 'Age'? 'age--':'weight--',
                  onPressed:(){
                    setState(() {
                      type == 'Age'? age--:weight--;
                    });
                  } ,
                  child: Icon(Icons.remove) ,
                  mini: true,
                ),
                const SizedBox(width: 8,),
                FloatingActionButton(
                  heroTag: type == 'Age'? 'age++':'weight++',
                  onPressed:(){
                    setState(() {
                      type == 'Age'? age++:weight++;
                    });
                  } ,
                  child: Icon(Icons.add) ,
                  mini: true,
                ),


              ],
            ),
          ],
        ),
      ) ,
    );
  }
}
