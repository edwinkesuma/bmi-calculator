import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;

  //male=1, female=2
  void updateColor(int gender) {
    if (gender == 1) {
      if (maleColor == inactiveCardColor) {
        maleColor = activeCardColor;
        femaleColor = inactiveCardColor;
      } else {
        maleColor = inactiveCardColor;
      }
    }
    if (gender == 2) {
      if (femaleColor == inactiveCardColor) {
        femaleColor = activeCardColor;
        maleColor = inactiveCardColor;
      } else {
        maleColor = inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      updateColor(1);
                    },
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      updateColor(2);
                    },
                    child: Expanded(
                      child: Container(
                        margin: EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF1D1E33),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Expanded(
                child: ReuseableCard(
                  colour: activeCardColor,
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReuseableCard(
                    colour: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReuseableCard(
                    colour: activeCardColor,
                  ),
                ),
              ],
            )),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ));
  }
}
