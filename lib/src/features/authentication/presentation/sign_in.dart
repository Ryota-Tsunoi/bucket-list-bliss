// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

// Project imports:
import 'package:bucket_list_bliss/src/common_widgets/scaffold.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectableScaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: _SignInForm(),
    );
  }
}

final _formKey = GlobalKey<FormBuilderState>();

class _SignInForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final containerWidth = maxWidth > 600 ? 600.0 : maxWidth;
    final passwordObsecure = useState(true);
    final passwordSuffixIcon =
        passwordObsecure.value ? Icons.visibility : Icons.visibility_off;
    return Center(
      child: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: containerWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilderTextField(
                  name: 'email',
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: 'Email is required',
                      ),
                      FormBuilderValidators.email(
                        errorText:
                            'Invalid email address. please enter a valid email address',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FormBuilderTextField(
                  name: 'password',
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () =>
                          passwordObsecure.value = !passwordObsecure.value,
                      icon: Icon(passwordSuffixIcon),
                    ),
                  ),
                  obscureText: passwordObsecure.value,
                  validator: FormBuilderValidators.compose(
                    [
                      FormBuilderValidators.required(
                        errorText: 'Password is required',
                      ),
                      FormBuilderValidators.minLength(
                        8,
                        errorText:
                            'Password must be at least 8 characters long',
                      ),
                      FormBuilderValidators.maxLength(
                        24,
                        errorText:
                            'Password must be at most 24 characters long',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      final formData = _formKey.currentState!.value;
                      Logger().i(formData);
                      context.go('/second');
                    }
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'NOTE: You can use any email and password combination. This is just a sample.',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
