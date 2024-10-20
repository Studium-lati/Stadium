import 'package:flutter/material.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';



class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10,left: 20,right:20 ,top:60 ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Row(
              children: [
                 Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
              
              Text(
                "Payment",
                style: TextStyle(fontSize: 30,fontWeight:FontWeight.w900),
                textAlign:TextAlign.start , 
              ),
              ],
             ),
              Padding(
                padding: const EdgeInsets.only(left:25 ),
                child: Text("method",style: TextStyle(fontSize: 28,fontWeight:FontWeight.w900),),
              ),    
              Image.asset(
                image, 
                height: getScreenSize(context).height*0.3, 
                width: getScreenSize(context).width*1,
              ),
              SizedBox(height: getScreenSize(context).height*0.03,), 
              Center(
                child: Text(
                  'Payment method: ادفع لي',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: getScreenSize(context).height*0.04, 
          ),
    
           TextForm( labelText: "Amount", 
             keyboardType: TextInputType.phone,),
              
              SizedBox(height: getScreenSize(context).height*0.05,), 
          
              
             TextForm( labelText: "phone number", 
               keyboardType: TextInputType.phone,
               
               
               ),
             
              
              SizedBox(height: getScreenSize(context).height*0.05,), 
              
             Container(
                width: double.infinity,
       
              child: Mainbutton(text: "Send SMS", ontap: (){},
              paddingbutten: EdgeInsets.all(16),
              ),

              )
            ],
          ),
        ),
      ),
    );
  }

 
}