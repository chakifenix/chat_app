import 'package:chat_app/core/styles/text_styles.dart';
import 'package:chat_app/extensions/space_exs.dart';
import 'package:chat_app/uiKit/ui_colors.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 162,
            padding: const EdgeInsets.only(top: 10, bottom: 16),
            color: UiColor.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    'Заявки на диалог: 0',
                    style: AppTextStyles.h9.copyWith(color: Colors.white),
                  ),
                ),
                21.h,
                Expanded(
                    child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 34,
                          ),
                          10.h,
                          Text(
                            'Айнура',
                            style:
                                AppTextStyles.h9.copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    );
                  },
                )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: UiColor.lighter))),
            width: double.infinity,
            child: const Text(
              'Активный чат',
              style: AppTextStyles.h9,
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: UiColor.lighter))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 13),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  const CircleAvatar(
                                    radius: 25,
                                  ),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red),
                                    child: Text(
                                      '2',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.h8
                                          .copyWith(color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                              16.w,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Команда Joop',
                                    style: AppTextStyles.h7,
                                  ),
                                  SizedBox(
                                      width: 214,
                                      child: Text(
                                        'Приветствую. Рада знакомству...',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ))
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '10:21',
                                style: AppTextStyles.h8
                                    .copyWith(color: UiColor.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
