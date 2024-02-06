import 'package:first_flutter_vscode/components/textfield_general.dart';
import 'package:first_flutter_vscode/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ReturnBook extends StatelessWidget {
  const ReturnBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(
                  width: double.infinity, 
                  child: Text(
                    'Pengembalian',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.black
                    ),
                  ),
                ),
            Divider(
              thickness: 1.2, 
              color: Colors.grey.shade200,
            ),
            const Gap(12),
            const Text(
              'Formulir Pengembalian',
              style: AppStyle.headingOne
              ),
              const Gap(6),
            const TextFieldWidget(maxLine: 1, hintText: 'NIM'),
            const Gap(6),
            
          ],
        ),
    );
  }
}


