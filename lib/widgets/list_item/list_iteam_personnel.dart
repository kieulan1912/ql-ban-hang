import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ql_ban_hang/c_theme/c_theme.dart';
import 'package:ql_ban_hang/data/models/personnel.dart';
import 'package:ql_ban_hang/modules/acc_detail/account_detail_screen.dart';
import 'package:ql_ban_hang/widgets/compoment/icon_title_title.dart';
import 'package:ql_ban_hang/widgets/image_custom.dart';
import 'package:ql_ban_hang/widgets/text_custom.dart';
import 'package:ql_ban_hang/widgets/widgets.dart';

Widget itemPersonnel({
  Personnel? personnel,
  EdgeInsets? margin,
  double? quantity,
  Function?
      onHoverDelete, // ấn giữ xoá sp ra khỏi list - dùng cho các màn hoá đơn
}) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(AccountDetailScreen.routeName,
          arguments: {'type': 'view', 'personnelID': personnel?.id});
    },
    onLongPress: () {
      if (onHoverDelete != null) onHoverDelete();
    },
    child: Container(
      margin: margin ??
          const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12, right: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 2),
            )
          ]),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: imageNetwork(
                    url: personnel?.avatar ?? '', fit: BoxFit.cover)),
          ),
          cWidth(8),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        width: Get.width - 40,
                        child: textTitleMedium(personnel?.name ?? '',
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Icon(
                          personnel?.gender == 'Nam'
                              ? FontAwesomeIcons.mars
                              : FontAwesomeIcons.venus,
                          color: personnel?.gender == 'Nam' ? b500 : a500,
                        ))
                  ],
                ),
                cHeight(8),
                iconTitleTitle(
                    title1: personnel?.address ?? 'Trống',
                    icon: FontAwesomeIcons.mapLocation),
                cHeight(8),
                iconTitleTitle(
                    title1: personnel?.phone ?? 'Trống',
                    icon: FontAwesomeIcons.phone),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
