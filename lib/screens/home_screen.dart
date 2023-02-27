import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../manager/availability_manager.dart';
import 'widget/business_model_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            SizedBox(
              height: width * 60 / 375,
              child: Row(
                children: [
                  SizedBox(
                    width: width * 10 / 375,
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    'Book Table',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 22 / 375,
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Consumer(
                builder:
                    (BuildContext context, WidgetRef widgetRef, Widget? child) {
                  var response = widgetRef.watch(availabilityManager);

                  return response.when(
                    data: (data) {
                      if (data == null) {
                        return const Center(
                          child: Text('Can not load Data'),
                        );
                      } else {
                        return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BusinessModelWidget(
                              item: data.listed![index],
                            ),
                          ),
                          separatorBuilder: (_, index) => SizedBox(
                            height: width * 30 / 375,
                          ),
                          itemCount: data.listed!.length,
                        );
                      }
                    },
                    error: (_, __) => const Center(
                      child: Text('An error has occurred, please try again'),
                    ),
                    loading: () => const Center(
                      child: CupertinoActivityIndicator(color: Colors.white,),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}