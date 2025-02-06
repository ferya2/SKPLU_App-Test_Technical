import 'package:flutter/material.dart';
import 'package:test_technical/core/resources/padding.dart';
import 'package:test_technical/core/resources/texstyle.dart';

import '../../../core/resources/colors.dart';
import 'widget/reusable_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteNeutral,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background_homepage.png',
            fit: BoxFit.cover, // Cover the entire area
            height: MediaQuery.of(context).size.height * 0.36,
            width: double.infinity, // Make sure the image takes full width
          ),
          SafeArea(
            child: Padding(
              padding: CustomPadding.kSidePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // Top bar widget
                  TopBarItem(),
                  const SizedBox(height: 30),
                  // Textfield search
                  TextFieldSearch(),
                  const SizedBox(height: 30),
                  Text('Recomend for you',
                      style: AppTextStyle.smallTextWhiteColor),
                  const SizedBox(height: 10),
                  // Promo banner
                  PromoBanner(),
                  // Near with SPKLU
                  const SizedBox(height: 40),
                  Text('Near with your location',
                      style: AppTextStyle.smallTextBlackColor),
                  const SizedBox(height: 10),
                  // Banner SPKLU
                  SPKLUCard(
                    imagePath: 'assets/images/chargestation.png',
                    title: 'SPKLU Mandalajati',
                    subtitle: '1,3 km',
                    backgroundColor: AppColor.secondaryColor,
                    borderColor: Colors.white,
                    textColor: AppColor.blackNeutral,
                    subtitleColor: Colors.red,
                    onTap: () {
                      print('SPKLU Mandalajati diklik!');
                    },
                  ),
                  const SizedBox(height: 20),
                  // Banner History Transaction
                  Text('History Transaction',
                      style: AppTextStyle.smallTextBlackColor),
                  const SizedBox(height: 10),
                  SPKLUCard(
                    imagePath: 'assets/images/transactionhistory.png',
                    title: 'History Transaction',
                    subtitle: 'check your history transaction',
                    backgroundColor: AppColor.secondaryColor,
                    borderColor: Colors.white,
                    textColor: AppColor.blackNeutral,
                    subtitleColor: AppColor.greyDark,
                    onTap: () {
                      print('History Transaction diklik!');
                    },
                  ),
                  const SizedBox(height: 20),
                  // Energy Consumption Banner
                  Text('Energy Consumption',
                      style: AppTextStyle.smallTextBlackColor),
                  const SizedBox(height: 10),
                  SPKLUCard(
                    imagePath: 'assets/images/energyconsumption.png',
                    title: 'History Energy Consumption',
                    subtitle: '1,3 km',
                    backgroundColor: AppColor.secondaryColor,
                    borderColor: Colors.white,
                    textColor: AppColor.blackNeutral,
                    subtitleColor: Colors.red,
                    onTap: () {
                      print('SPKLU Mandalajati diklik!');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PromoBanner extends StatelessWidget {
  const PromoBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white, // Border putih
          width: 2,
        ),
      ),
      child: Row(children: [
        const SizedBox(width: 10),
        Image.asset(
          'assets/images/cart.png',
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROMO 30% OFF',
              style: AppTextStyle.smallTextBlackColor,
            ),
            Text(
              'Get 30% off on your first purchase',
              style: AppTextStyle.smallTextBlackColor
                  .copyWith(color: Colors.red, fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: GestureDetector(
            onTap: () {
              print('tapped');
            },
            child: CircleAvatar(
              backgroundColor: AppColor.primaryColor,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class TextFieldSearch extends StatelessWidget {
  const TextFieldSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.secondaryColor,
        hintText: 'Cari SPKLU terdekat',
        hintStyle: AppTextStyle.smallTextGreyColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}

class TopBarItem extends StatelessWidget {
  const TopBarItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2), // Outline putih
          ),
          child: CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.greyNeutral,
            child: Text(
              'AF',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),

        Expanded(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Tengah secara vertikal
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi Ade Fery!',
                style: AppTextStyle.smallTextWhiteColor,
              ),
              Row(
                children: [
                  Text(
                    'Jl.A.H Nasution no 256, Kota Bandung',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: AppColor.greyDark,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('tapped');
                    },
                    child: Icon(
                      Icons.location_on_outlined,
                      color: AppColor.greyDark,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Icon tetap di kanan
        Icon(
          Icons.notifications_active_outlined,
          color: const Color.fromARGB(255, 230, 111, 102),
          size: 28,
        ),
      ],
    );
  }
}
