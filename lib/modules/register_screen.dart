import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets/textformfield.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController password= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController phone= TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
               children: [
                 Container(
                   width: double.infinity,
                   height: size.height*.2,
                   child: Image(
                     image: AssetImage('assets/images/4.png'),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: FloatingActionButton.small(onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Icon(Icons.arrow_back_ios_new,color: Colors.white),
                     backgroundColor: Colors.black,

                   ),
                 )
               ],
              ),
              Text('Register and get lots of free courses',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Text('Register', style: TextStyle(
                      color: HexColor('#263238'),
                      fontSize: 40,
                      fontFamily: 'candy'
                  ),),
                  Spacer(),
                  TextButton(onPressed: (){}, child: Text('Help ? ',style: TextStyle(
                      color: HexColor('#92e3a9'),
                      fontSize: 18
                  ),))
                ],
              ),
              SizedBox(height: 20,),
              defaultTextFormFieldWidget(
                  context: context,
                  controller: email,
                  errorMessage: "please enter your email",
                  inputType: TextInputType.emailAddress,
                  labelText: "email",
                  prefixIcon: Icons.mail_sharp
              ),
              SizedBox(height: 20,),
              defaultTextFormFieldWidget(
                  context: context,
                  controller: phone,
                  errorMessage:"please enter your phone number",
                  inputType: TextInputType.phone,
                  labelText: "phone number",
                  prefixIcon: Icons.phone
              ),
              SizedBox(height: 20,),
              defaultTextFormFieldWidget(
                  context: context,
                  controller: password,
                  errorMessage:"please enter your password",
                  inputType: TextInputType.visiblePassword,
                  labelText: "password",
                  prefixIcon: Icons.password
              ),
              SizedBox(height: 20,),
              Container(
                height: 50,
                width:double.infinity,
                decoration: BoxDecoration(
                  color: HexColor('#93dfaa'),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  child: Center(
                    child: Text('Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,

                      ),
                    ),
                  ),
                  onTap: (){
                  },
                ),
              ),
              SizedBox(height:10,),
              Center(child: Text('Or',style: TextStyle(
                  color: Colors.grey
              )),),
              SizedBox(height:10,),
              Container(

                  height: 50,
                  width:double.infinity,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: HexColor('#93dfaa') ),
                  ),
                  child:TextButton(
                    onPressed:(){},
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sign With Google',style: TextStyle(
                            color: HexColor('#93dfaa') ,
                            fontWeight: FontWeight.w700,
                            fontSize: 14
                        ),),
                        SizedBox(width: 10,),
                        Image.asset('assets/images/google.png',width: 20,height: 20,),
                      ],
                    ),
                  )
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Has any accounts?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child:Text('Sign in here',
                      style: TextStyle(
                        fontSize: 16,
                        color: HexColor('#93dfaa'),
                      ),
                    ) ,
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text('Use this application according to policy rules.\n'
                  ' Any kinds of violations will be subject to sanctions',
                textAlign: TextAlign.center,
                style:TextStyle(
                    height: 1.3,
                    color: Colors.grey,
                    fontSize: 16
                ) ,)
            ],
          ),
        ),
      ),
    );
  }
}
