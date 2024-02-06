import 'package:first_flutter_vscode/components/radio_button.dart';
import 'package:first_flutter_vscode/provider/radio_provider.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_vscode/components/textfield_general.dart';
import 'package:first_flutter_vscode/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class AddStudent extends ConsumerWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black38,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Lib-E",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Tambah Mahasiswa',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Divider(
              thickness: 1.2,
              color: Colors.grey.shade200,
            ),
            Expanded(
              child: ListView(
                children: [
                  const Gap(12),
                  const Text('NIM', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Nama Siswa', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Jenis Kelamin', style: AppStyle.headingOne),
                  Row(
                    children: [
                      Expanded(
                        child: RadioWidget(
                          categColor: Colors.blue.shade700,
                          titleRadio: 'Pria',
                          valueInput: 1,
                          onChangeValue: () => ref
                              .read(radioProvider.notifier)
                              .update((state) => 1),
                        ),
                      ),
                      Expanded(
                        child: RadioWidget(
                          categColor: Colors.amberAccent.shade700,
                          titleRadio: 'Perempuan',
                          valueInput: 2,
                          onChangeValue: () => ref
                              .read(radioProvider.notifier)
                              .update((state) => 2),
                        ),
                      ),
                    ],
                  ),
                  const Text('Prodi', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Nomor Handphone', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Alamat', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Kode Pin', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Kota', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
