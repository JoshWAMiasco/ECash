import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/components/popup_card.dart';
import 'package:ecash/components/primary_button.dart';
import 'package:ecash/components/primary_icon_button.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserProfileCard extends StatelessWidget {
  const UserProfileCard({Key? key, this.profilePhoto, this.displayName, this.mobileNumber, this.userAccountNumber}) : super(key: key);
  final String? profilePhoto;
  final String? displayName;
  final String? mobileNumber;
  final String? userAccountNumber;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          mobileNumber ?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Verified',
                        style: TextStyle(),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CachedNetworkImage(
                  imageUrl: profilePhoto!,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 2),
                            color: Colors.white,
                            blurRadius: 1.2,
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: PrimaryIconButton(
                      icon: Icons.qr_code_rounded,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => PopupCard(
                            borderRadius: 20,
                            margin: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height * 0.12, 20, MediaQuery.of(context).size.height * 0.3),
                            body: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  // Center(
                                  //   child: QrImage(
                                  //     data: userAccountNumber ?? '',
                                  //     version: QrVersions.auto,
                                  //     size: 220,
                                  //     gapless: false,
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      displayName ?? '',
                                      style: TextStyle(
                                        color: AppColor.primary,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                      mobileNumber ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  PrimaryButton(
                                    title: "Close",
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    child: PrimaryIconButton(
                      icon: Icons.edit,
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
