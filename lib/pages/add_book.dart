import 'package:first_flutter_vscode/components/button.dart';
import 'package:first_flutter_vscode/components/date_time.dart';
import 'package:first_flutter_vscode/provider/date_time_provider.dart';
import 'package:first_flutter_vscode/provider/radio_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_vscode/components/textfield_general.dart';
import 'package:first_flutter_vscode/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class AddBook extends ConsumerWidget {
  const AddBook({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateProv = ref.watch(dateProvider);
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
                'Tambah Buku',
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
                  const Text('Kode Buku', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Nama Buku', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Nama Penulis', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Publik', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Harga', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Jumlah', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(maxLine: 1, hintText: 'Ketik disini'),
                  const Gap(6),
                  const Text('Tambah Gambar', style: AppStyle.headingOne),
                  const Gap(6),
                  const TextFieldWidget(
                      maxLine: 1, hintText: 'Ketik link gambar disini'),
                  const Gap(6),
                ],
              ),
            ),

            // Date and Time Section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DateTimeWidget(
                  titleText: 'Tanggal',
                  valueText: dateProv,
                  iconSection: CupertinoIcons.calendar,
                  onTap: () async {
                    final getValue = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2021),
                        lastDate: DateTime(2025));

                    if (getValue != null) {
                      final format = DateFormat.yMd();
                      ref
                          .read(dateProvider.notifier)
                          .update((state) => format.format(getValue));
                    }
                  },
                ),
                const Gap(22),
                DateTimeWidget(
                  titleText: 'Waktu',
                  valueText: ref.watch(timeProvider),
                  iconSection: CupertinoIcons.clock,
                  onTap: () async {
                    final getTime = await showTimePicker(
                        context: context, initialTime: TimeOfDay.now());

                    if (getTime != null) {
                      ref
                          .read(timeProvider.notifier)
                          .update((state) => getTime.format(context));
                    }
                  },
                ),
              ],
            ),

            //  Button Section
            const Gap(12),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue.shade800,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Colors.blue.shade800),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                )),
                const Gap(20),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {},
                  child: const Text('Kirim'),
                )),

                //  Card list task
              ],
            ),
            const Gap(20),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
