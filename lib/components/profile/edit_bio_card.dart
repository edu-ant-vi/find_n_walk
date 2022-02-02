import 'dart:math';

import 'package:findnwalk/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

import '../shared/colors.dart';
import '../shared/app_button.dart';

class EditBioCard extends StatelessWidget {
  const EditBioCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: const Text(
        'Editar Biografia',
        style: TextStyle(
          color: AppColors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            maxLines: null,
            decoration: const InputDecoration(
              hintText: 'Insira sua biografia...',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        //TODO mudar bio
        AppButton(label: 'Enviar', onTap: () {}),
      ],
    );
  }
}
