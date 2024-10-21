import 'package:flutter/material.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';


class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  double currentPriceRangeStart = 30;
  double currentPriceRangeEnd = 100;
  String selectedSortOption = 'Near by';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('News Filed'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: primaryColor,),
          onPressed: () {
          },
        ),
       
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Sort By',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.topLeft,
                  child: DropdownButton<String>(
                    value: selectedSortOption,
                    onChanged: (newValue) {
                      setState(() {
                        selectedSortOption = newValue!;
                      });
                    },
                    items: <String>['Avelable ','Near by', 'Best Filed',  ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Text(
              'Price',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold), 
            ),
            RangeSlider(
              values: RangeValues(currentPriceRangeStart, currentPriceRangeEnd),
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                currentPriceRangeStart.round().toString(),
                currentPriceRangeEnd.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  currentPriceRangeStart = values.start;
                  currentPriceRangeEnd = values.end;
                });
              },
              activeColor: primaryColor,
            ),
            SizedBox(height: 40),
            Text(
              'Rating',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            Wrap(
              spacing: 10.0,
              children: List.generate(5, (index) {
                return FilterChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 5),
                      Text('${index + 1}.0'),
                    ],
                  ),
                  selected: false,
                  onSelected: (bool selected) {
                  },
                  selectedColor: primaryColor.withOpacity(0.2),
                  backgroundColor: Colors.white,
                );
              }),
            ),
        SizedBox(height: 80),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Mainbutton(text: "Continue", ontap: (){}),
            ),
          ],
        ),
      ),
    );
  }
}
