import 'package:aplicacao/informacions_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login() {
    if (loginController.text.trim().length > 0 &&
        passwordController.text.trim().length >= 2 &&
        !RegExp(r'[^A-Za-z0-9]').hasMatch(passwordController.text) &&
        loginController.text.trim().length <= 20 &&
        passwordController.text.trim().length <= 20 &&
        !loginController.text.endsWith(' ') &&
        !passwordController.text.endsWith(' ')) {
      // Navegar para a próxima tela
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InfoPage()));
    } else {
      // Mostrar alerta de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Por favor, preencha os campos corretamente.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Usuário",textAlign: TextAlign.left, style: TextStyle(color: Colors.black),),
              ],
            ),
            TextField(
              controller: loginController,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.people_alt, color: Colors.grey),),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Senha",textAlign: TextAlign.left, style: TextStyle(color: Colors.black),),
              ],
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400)),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            Container(
              height: 120.0,
            ),
            TextButton(
              onPressed: () => launch('https://www.google.com.br'),
              child: Text('Política de privacidade'),
            ),
          ],
        ),
      ),
    );
  }
}
