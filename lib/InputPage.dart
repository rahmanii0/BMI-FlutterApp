import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'reusableCard.dart';
import 'consts.dart';


enum Gender {
  male,
  female, 
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child:ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male ? activeCardColor : inActiveCardColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female ? activeCardColor : inActiveCardColor,
                      cardChild: IconContent(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Heghit',style: labelTextStyle,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(height.toString(),style: numberText,),
                        Text('Cm',style:numberText),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 18.0),
                        overlayColor: Colors.white,
                        overlayShape: RoundSliderOverlayShape(overlayRadius:50.0), 
                      ),
                    child:Slider(
                      value: height.toDouble(),
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      min: 120.0,
                      max: 200.0,
                      onChanged: (double newValue){
                        setState(() {
                          height= newValue.round();
                        });
                      },
                    ),
                    )
                  ],
                ),
                colour: inActiveCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: inActiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('CALCULATE',),
                  
                ],
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top:10),
              width: double.infinity,
              height: bottomContainerHight,
            )
          ],
        ));
  }
}
