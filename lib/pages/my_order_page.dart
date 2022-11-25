import 'package:badges/badges.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:ecash/components/no_order_placeholder.dart';
import 'package:ecash/components/order_card.dart';
import 'package:ecash/constants/app_color.dart';
import 'package:ecash/constants/image.dart';
import 'package:ecash/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyOrderPage extends ConsumerStatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends ConsumerState<MyOrderPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getData());
  }

  void getData() async {
    await ref.read(productProvider).getMyOrder().whenComplete((){
      ref.read(productProvider).addListenerToOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            Center(
              child: Text(
                'My Order',
                style: GoogleFonts.charmonman(fontWeight: FontWeight.bold, fontSize: 25.sp, color: AppColor.primary),
              ),
            ),
            SvgPicture.asset(
              classicDivider,
            ),
            SizedBox(
              height: 5.h,
            ),
            Visibility(
              visible: ref.read(authProvider).user != null,
              child: ref.watch(productProvider).orders.when(
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                data: (orders) {
                  if(orders.isNotEmpty) {
                    return Column(
                      children: List.generate(orders.length, (index){
                        return OrderCard(
                          order: orders[index],
                        );
                      }),
                    );
                  } else {
                    return Text('No Order');
                  }
                },
                error: (error, stact) {
                  return const NoOrderPlaceHolder();
                },
              ),
            )
            //const NoOrderPlaceHolder(),
          ],
        ),
      ),
    );
  }
}
