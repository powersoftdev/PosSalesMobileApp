// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../Model/rme.dart';

// ignore: must_be_immutable
class ReturnRequestPopup extends StatefulWidget {
  bool? posted;
  DateTime? postedDate;
  ReturnRme? rmaData;

  // const ReturnRequestPopup({super.key});

  ReturnRequestPopup({super.key, this.rmaData});

  @override
  State<ReturnRequestPopup> createState() => _ReturnRequestPopupState();
}

class _ReturnRequestPopupState extends State<ReturnRequestPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimelineTile(
              axis: TimelineAxis.vertical,
              indicatorStyle: IndicatorStyle(
                  color: Colors.amber,
                  height: 50,
                  width: 50,
                  iconStyle:
                      IconStyle(color: Colors.white, iconData: Icons.check)
                  //  IconStyle(color: Colors.white, iconData: Icons.circle),
                  ),
              isFirst: true,
              afterLineStyle: LineStyle(color: Colors.blue),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'RMA Submitted',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 5),
                          child: Text(
                            '${widget.rmaData!.postedDate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.vertical,
              indicatorStyle: IndicatorStyle(
                color: Colors.green,
                height: 50,
                width: 50,
                iconStyle: widget.rmaData!.posted ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
              ),
              isLast: true,
              beforeLineStyle: LineStyle(color: Colors.blue),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 20),
                          child: Text(
                            'RMA Completed',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
