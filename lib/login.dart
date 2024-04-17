import 'package:flutter/material.dart';
import 'package:regex_/validate.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

TextEditingController _controller = TextEditingController();
TextEditingController _controller2 = TextEditingController();
bool isEmailValid = false;

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.red,
        elevation: 0,
        ),
        body: content(),
    );
  }

  Widget content() {
    return Column(
      children:[
        Container(
          width: double.infinity,
          height: 120,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.elliptical(60, 60),
              )
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration:
                const BoxDecoration(shape: BoxShape.circle ,color: Colors.white),
              child: const Icon(
            Icons.person,
            size: 50,
              ),
            )
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "sign in to continue.",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 50,
            ),
            inputForm ("CPF", _controller),
            const SizedBox(
              height: 20,
            ),
            inputForm ("Password", _controller2),
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Forgot Password ?",
                style:  TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text("Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                    ),
                ),
              ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?"),
                  Text("Sign Up",
                  style: TextStyle(color: Colors.red),
                  )
                ],
              )
          ],
        ),
        )
      ],
    );
  }
  Widget inputForm (String title, TextEditingController controller) {
return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(title),
    const SizedBox(
      height: 10,
    ),
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            border: title =="Email"? Border.all(
            width: 0.5, 
            color: controller.text.isEmpty
          ? Colors.grey 
          : isEmailValid
              ?Colors.green
              :Colors.red)
            : Border.all(width: 8.5, color: Colors.grey),
      ),
      child: Padding(padding: const EdgeInsets.only(left: 10.0),
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(border: InputBorder.none),
        onChanged: (value) {
          if (title == "Email"){
            if(value.isEmpty){
              setState((){
                isEmailValid = true;
              });
            }else{
              final isValid = validateEmailAddress(value);
              if(isValid){
                setState((){
                  isEmailValid = true;
                });
              }else{
                setState((){
                  isEmailValid = false;
                });
              }
            }
          }
         },
       ),
      ),
    ),
  ],
);

  }
}

