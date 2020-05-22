import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.shade100,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person",style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$100",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      prefixText: "Bill Amount",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                      onChanged: (String value) {
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){
                        _billAmount = 0.0;
                      }
                      }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Split", style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap:(){
                              setState(() {
                                if(_personCounter > 1){
                                  _personCounter--;
                                }else{
                                  //do nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purple.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                ),
                              ),
                            ),
                          ),
                          Text("$_personCounter",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purple.shade300,
                              ),
                              child: Center(
                                child: Text(
                                  "+",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                                ),
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Tip",style: TextStyle(
                        color: Colors.grey.shade700,
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text("\$35",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage%",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      Slider(
                          min : 0,
                          max : 100,
                          value: _tipPercentage.toDouble(), onChanged: (double value){
                        setState(() {
                          _tipPercentage = value.round();
                        });
                      }),
                    ],
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }
}
