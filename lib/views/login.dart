import 'package:flutter/material.dart';
import 'package:prisma/componentes/my_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
          children: [
            const SizedBox(height: 50),


            // Logo bala 
            Icon(
              Icons.lock
              size: 100,
            ), 

            const SizedBox(height: 25),

            // Componente de Usuário
            MyTextField(),

            const SizedBox(height: 10),

            // Componente de Senha
            MyTextField(),            
          ],
          ),
      ),
    )
  );
  }
}