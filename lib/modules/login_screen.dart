import 'package:algoriza_intern_task1/utils/appcolors.dart';
import 'package:algoriza_intern_task1/utils/appstrings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:country_list_pick/country_list_pick.dart';
import '../shared/component.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phone= TextEditingController();
  GlobalKey formKey=GlobalKey<FormState>();
  String dialCodeInitialcode='+20';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: size.height*.4,
                  child: Image(
                    image: AssetImage('assets/images/4.png'),
                  ),
                ),
                Text('Welcome to coursat',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColor.hintColor
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Sign In', style: TextStyle(
                        color: HexColor('#263238'),
                        fontSize: 40,
                        fontFamily: AppStrings.appFont
                    ),),
                    Spacer(),
                    defaultTextButton(function: (){}, text: 'Help ? ')
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    CountryListPick(
                      theme: CountryTheme(
                          showEnglishName: false,
                          //show or hide flag
                          isShowFlag: true,
                          // show country title
                          isShowTitle: false,
                        //show country code
                        isShowCode: true,
                        //show or hide down icon
                        isDownIcon: false,
                        //to initial code number country
                        initialSelection: dialCodeInitialcode,
                      ),
                      onChanged: (CountryCode? code){
                        setState((){
                          if(code!.dialCode !=null){
                            dialCodeInitialcode = code.dialCode!;
                          }else{
                            print('country code = nul');
                          }

                        });
                      },
                    ),
                    Expanded(
                      child: defaultTextFormFieldWidget(
                        context: context,
                        controller: phone,
                        errorMessage:"please enter your phone number",
                        inputType: TextInputType.phone,
                        labelText: "phone number",),
                    ),
                  ],

                ),
                SizedBox(height: 20,),
                defaultButton(function: (){}, text: 'Log In'),
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
                    const Text('Dont have account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    defaultTextButton(function: (){
                      Navigator.pushNamed(context, 'register');
                    }, text: 'SignUp')
                  ],
                ),
                SizedBox(height: 15,),
                const Text('Use this application according to policy rules.\n'
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
      ),
    );
  }
}
