import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Shortcuts(
          shortcuts: <LogicalKeySet, Intent>{
            // Pressing space in the field will now move to the next field.
            LogicalKeySet(LogicalKeyboardKey.space): const NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus.context).save();
              },
              child: Wrap(
                children: List<Widget>.generate(5, (int index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'What do people call you?',
                          labelText: 'Name *',
                        ),
                        onSaved: (String value) {
                          // This optional block of code can be used to run
                          // code when the user saves the form.
                        },
                        validator: (String value) {
                          return value.contains('@')
                              ? 'Do not use the @ char.'
                              : null;
                        },
                      ));
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
