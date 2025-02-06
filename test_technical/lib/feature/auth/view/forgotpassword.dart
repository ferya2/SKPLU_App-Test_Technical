import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';
import '../../../core/resources/padding.dart';
import '../../../core/resources/texstyle.dart';
import '../widget/button_custom.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  bool showOtpAndPasswordFields = false;

  void resetPassword() {
    setState(() {
      showOtpAndPasswordFields =
          true; // Menampilkan OTP dan password setelah reset password
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.whiteNeutral,
      appBar: AppBar(
        backgroundColor: AppColor.whiteNeutral,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColor.primaryColor,
            size: 36,
          ),
          color: AppColor.blackNeutral,
        ),
      ),
      body: Padding(
        padding: CustomPadding.kSidePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SPLU DOCK3P', style: AppTextStyle.smallTextGreyColor),
            Text('Forgot \nPassword?', style: AppTextStyle.title),

            const SizedBox(height: 60),
            // Menyembunyikan email input dan tombol reset password setelah reset password ditekan
            Visibility(
              visible:
                  !showOtpAndPasswordFields, // Jika sudah menekan reset password, sembunyikan
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    style: AppTextStyle.smallText,
                    decoration: InputDecoration(
                      hintStyle: AppTextStyle.smallTextGreyColor,
                      filled: true,
                      fillColor: AppColor.whiteNeutral,
                      // Hanya garis bawah yang ditampilkan
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColor
                              .primaryColor, // Sesuaikan dengan warna yang diinginkan
                          width: 2, // Sesuaikan ketebalan garis bawah
                        ),
                      ),
                      label: Text('Email', style: AppTextStyle.smallText),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ButtonCustom(
                    label: 'Reset Password',
                    backgroundColor: AppColor.primaryColor,
                    onPressed: () {
                      // Validasi email
                      if (emailController.text.isEmpty) {
                        // Jika field email kosong, tampilkan Snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Email harus diisi'),
                          ),
                        );
                      } else {
                        // Cek format email
                        final emailRegExp = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!emailRegExp.hasMatch(emailController.text)) {
                          // Jika format email tidak valid, tampilkan Snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Format email tidak valid'),
                            ),
                          );
                        } else {
                          // snackbar
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email Terverifikasi'),
                            ),
                          );
                          // Jika email valid, lanjutkan untuk menampilkan OTP dan password
                          resetPassword();
                        }
                      }
                    },
                  ),
                ],
              ),
            ),

            // Jika form reset password berhasil, tampilkan field OTP dan New Password
            if (showOtpAndPasswordFields) ...[
              const SizedBox(height: 40),
              // TextField OTP
              TextField(
                controller: otpController,
                style: AppTextStyle.smallText,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintStyle: AppTextStyle.smallTextGreyColor,
                  filled: true,
                  fillColor: AppColor.whiteNeutral,
                  // Hanya garis bawah yang ditampilkan
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor
                          .primaryColor, // Sesuaikan dengan warna yang diinginkan
                      width: 2, // Sesuaikan ketebalan garis bawah
                    ),
                  ),
                  label: Text('Enter OTP', style: AppTextStyle.smallText),
                ),
              ),
              const SizedBox(height: 20),
              // TextField New Password
              TextField(
                controller: newPasswordController,
                obscureText: true,
                style: AppTextStyle.smallText,
                decoration: InputDecoration(
                  hintStyle: AppTextStyle.smallTextGreyColor,
                  filled: true,
                  fillColor: AppColor.whiteNeutral,
                  // Hanya garis bawah yang ditampilkan
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor
                          .primaryColor, // Sesuaikan dengan warna yang diinginkan
                      width: 2, // Sesuaikan ketebalan garis bawah
                    ),
                  ),
                  label: Text('New Password', style: AppTextStyle.smallText),
                ),
              ),
              const SizedBox(height: 24),
              ButtonCustom(
                label: 'Confirm New Password',
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  // Validasi apakah OTP dan New Password sudah diisi
                  if (otpController.text.isEmpty ||
                      newPasswordController.text.isEmpty) {
                    // Jika ada field yang kosong, tampilkan Snackbar untuk meminta user mengisi field terlebih dahulu
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Isi field terlebih dahulu'),
                      ),
                    );
                  } else {
                    // Jika kedua field terisi, tampilkan Snackbar sukses
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password berhasil diubah!'),
                      ),
                    );
                    // kosongkan field OTP dan New Password
                    otpController.clear();
                    newPasswordController.clear();
                    // tampilkan form reset password
                    setState(() {
                      showOtpAndPasswordFields = false;
                    });
                  }
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
