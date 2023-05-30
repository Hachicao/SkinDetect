import 'package:flutter/material.dart';
import 'package:project/src/constants/text_string.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_2_outlined,
                    color: Colors.black,
                  ),
                  labelText: tFullName,
                  hintText: tFullName,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.fingerprint_rounded,
                  color: Colors.black,
                ),
                labelText: tPassword,
                hintText: tPassword,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                suffixIcon: IconButton(
                    onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(tSignup.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
