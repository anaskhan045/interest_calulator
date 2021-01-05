import 'package:flutter/material.dart';

void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'interest Calculator',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
        brightness: Brightness.dark
      ),
      home: HomePage(),
    );
  }
}

  class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage> {
  var _currency = ['Rupees','Doller','Pound'];
   var userValue = 'Rupees';
   String finalResult= '';
   TextEditingController principal = TextEditingController();
   TextEditingController rate = TextEditingController();
   TextEditingController time = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold (
        appBar: AppBar(
          title: Text("Interest Calculator"),
          centerTitle: true,
          ),
        body: Container(
          margin: EdgeInsets.all(10),

          child: ListView(



            children: <Widget>[
              Container(

                child: Image(
                  width: 125,
                  height: 125,
                  image: AssetImage('assets/money.png'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Principal Amount',
                  hintText: 'Enter Principal Amount',
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  )
                ),
                keyboardType: TextInputType.number,
                controller: principal,

              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,decoration: InputDecoration(
                labelText: 'Rate of Interest',
                hintText: 'Enter Rate of Interest In Percent',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0)
                )
              ),
                controller: rate,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Time',
                        hintText: 'Enter  Time in Years',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        )
                      ),
                      controller: time,
                    ),
                  ),
                 SizedBox(
                   width: 10,
                 ),
                 Expanded(
                     child: DropdownButton<String>(

                      items: _currency.map((String value){
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value:  value,
                        );
                      }).toList(),
                     value: userValue ,
                     onChanged: (String newValue){
                        setState(() {
                          userValue = newValue;
                        });
                     }))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text('Calculate',textScaleFactor: 1.5,
                      ),

                      color:Colors.indigoAccent,
                    onPressed: (){
                        var _principal =double.parse(principal.text);
                        var _rate = double.parse(rate.text);
                        var _time = double.parse(time.text);

                        var result = _principal+(_principal*_rate*_time)/100;

                        setState(() {
                          finalResult =  'After $_time Your Investment will be Worth $result $userValue';
                        });
                    },
                    ),
                  ),
                 SizedBox(
                   width: 10,
                 ),
                 Expanded(child: RaisedButton(
                    child: Text('Reset'),
                   color: Theme.of(context).primaryColorDark,
                   onPressed: (){
                      setState(() {

                        principal.text='';
                        rate.text='';
                        time.text='';
                        userValue='Rupees';
                        finalResult='';
                      });
                   },
                  ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Center(child: Text(finalResult,textScaleFactor: 1.5,)),
              )
            ],
          ),
        ),
        );

    }
  }

