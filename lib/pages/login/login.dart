import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _renderFormCard(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox.fromSize(
                size: const Size(200, 50),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Email / Phone No',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            SizedBox.fromSize(
                size: const Size(200, 50),
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Passcode',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                )),
            Text(
              'Having trouble in login?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ),
            const Text('-- Or Login with --'),
            Row(
              children: const [
                Text('Google'),
                Text('Apple Id'),
                Text('Facebook'),
              ],
            ),
            const Text("Don't have an account? Sign in Now"),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/login/bg_login_form.avif"),
            fit: BoxFit.cover,
          ),
        ),
        child: _renderFormCard(context),
      );
  }
}
