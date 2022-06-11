import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/app_font.dart';
import 'package:ecash/constants/functions.dart';
import 'package:flutter/material.dart';

class UserWalletCard extends StatelessWidget {
  const UserWalletCard({Key key, this.photoUrl, this.balance, this.onTap}) : super(key: key);
  final String photoUrl;
  final double balance;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.bottomRight,
            child: ImageIcon(
              AssetImage('assets/ecash_logo.png'),
              size: MediaQuery.of(context).size.height * 0.25,
              color: Colors.white.withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moneyFormatter(balance),
                      style: AppFont.bold(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'wallet balance',
                      style: AppFont.regular(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(child: Container()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Grace Faith',
                      style: AppFont.semiBold(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'E123-123-1234',
                      style: AppFont.regular(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: onTap,
                      child: CachedNetworkImage(
                        imageUrl: photoUrl,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 2),
                                  color: Colors.grey,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Profile',
                      style: AppFont.regular(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
