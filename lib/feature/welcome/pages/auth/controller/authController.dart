import 'package:chaten/feature/welcome/pages/auth/repository/authRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/authRepository.dart';

final authControllerProvider = Provider(
  (ref) {
    final authRepository = ref.watch(AuthRepositoryProvider);
    return AuthController(authRepository: authRepository);
  });

class AuthController{
    final AuthRepository authRepository;

AuthController({required this.authRepository});
void sendSmsCode({
    required BuildContext context,
    required String phoneNumber,
   }){
    authRepository.sendSmsCode(
      context: context,
       phoneNumber: phoneNumber,
       );
   }
}