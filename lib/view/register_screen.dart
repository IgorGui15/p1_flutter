import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de nome
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.red),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent),
                ),
              ),
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
            // Campo de confirmação de senha
            TextField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirme a Senha',
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
            // Botão de cadastro
            ElevatedButton(
              onPressed: () {
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String password = passwordController.text.trim();
                String confirmPassword = confirmPasswordController.text.trim();
                if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                  _showMessage(context, 'Todos os campos devem ser preenchidos.');
                  return;
                }
                if (!_isEmailValid(email)) {
                  _showMessage(context, 'Por favor, insira um e-mail válido.');
                  return;
                }
                if (password != confirmPassword) {
                  _showMessage(context, 'As senhas não correspondem.');
                  return;
                }

                Navigator.pushReplacementNamed(context, '/');
              },
              child: Text('Cadastrar'),
              style: ElevatedButton.styleFrom(
                primary: Colors.redAccent,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  // Função para validar o formato do e-mail
  bool _isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }
}
