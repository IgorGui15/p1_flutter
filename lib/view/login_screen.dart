import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.restaurant,  // Ícone de restaurante
              size: 100,          
              color: Colors.redAccent, 
            ),
            SizedBox(height: 16), 
            // Campo de e-mail
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(color: Colors.red),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            // Campo de senha
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.red),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16),
            // Botão de Login
            ElevatedButton(
              onPressed: () {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  _showMessage(context, 'Preencha todos os campos');
                  return;
                }

                if (!_isEmailValid(email)) {
                  _showMessage(context, 'Por favor, insira um e-mail válido.');
                  return;
                }

                Navigator.pushReplacementNamed(context, '/menu');
              },
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Não tem uma conta? Cadastre-se aqui', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 16), 
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forgot_password'); 
              },
              child: Text('Esqueceu a senha?', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
