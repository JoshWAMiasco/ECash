import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/functions.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class UserWalletCard extends ConsumerStatefulWidget {
  const UserWalletCard({this.onTap,Key? key,}) : super(key: key);
  final VoidCallback? onTap;
  @override
  ConsumerState<UserWalletCard> createState() => _UserWalletCardState();
}

class _UserWalletCardState extends ConsumerState<UserWalletCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              const AssetImage('assets/ecash_logo.png'),
              size: MediaQuery.of(context).size.height * 0.25,
              color: Colors.white.withOpacity(0.3),
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
                      'PHP ${moneyFormatter(ref.watch(authProvider.notifier).user!.walletBalance ?? 0)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'wallet balance',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(child: Container()),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      ref.watch(authProvider.notifier).state.user!.firstname! + ' ' + ref.watch(authProvider.notifier).state.user!.lastname!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                     ref.watch(authProvider.notifier).state.user!.mobileNumber ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: widget.onTap,
                      child: CachedNetworkImage(
                        imageUrl: ref.watch(authProvider.notifier).state.user!.profilePicture ?? '',
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              boxShadow: const [
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
                        placeholder: (context, url) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade500,
                            highlightColor: Colors.white.withOpacity(0.8),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(1, 2),
                                    color: Colors.grey,
                                  )
                                ],
                                shape: BoxShape.circle,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
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
