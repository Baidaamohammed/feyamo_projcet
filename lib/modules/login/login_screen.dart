import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget
{

  var emaiController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:formKey ,
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image(
                       image: AssetImage('images/Logo Transparent.png'),
                     height: 150.0,
                     width: 150.0,
                   ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      controller: emaiController,
                      keyboardType:TextInputType.emailAddress,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'email address must not be empty ';
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                        labelText: 'E-mail',
                        prefixIcon: Icon(Icons.email),

                      ),

                      onFieldSubmitted: (value)
                      {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller:passwordController ,
                      keyboardType:TextInputType.visiblePassword,
                      obscureText: true,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'password must not be empty ';
                        }
                        return null ;
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye_sharp),

                      ),
                      onFieldSubmitted: (value)
                      {
                        print(value);
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            onPressed: (){},
                            child:
                            Text
                              (
                              'Forget password ?',
                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            print(emaiController.text);
                            print(passwordController.text);
                          }

                        },
                        child:
                        Text
                          (
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                      ),

                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: ()
                        {
                          print(emaiController.text);
                          print(passwordController.text);
                        },
                        child:
                        Text
                          (
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height:10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:Divider(
                              thickness: 1.0,
                              color: Colors.black,
                            ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Text('or connect whith'),
                        ),

                        Expanded(
                          child:Divider(
                            thickness: 1.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
