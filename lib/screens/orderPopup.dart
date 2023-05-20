// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:sales_order/Model/custormerorder.dart';

class OrderPopup extends StatefulWidget {
  List? orderDetails;
  Datum? orderData;
  DateTime? postedDate;
  DateTime? pickedDate;
  DateTime? invoiceDate;

  OrderPopup({super.key, this.orderData});

  @override
  State<OrderPopup> createState() => _OrderPopupState();
}

class _OrderPopupState extends State<OrderPopup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: sized_box_for_whitespace
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
                iconStyle: widget.orderData!.posted ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
              ),
              isFirst: true,
              afterLineStyle: LineStyle(color: Colors.amber),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    // color: Colors.amber[100],
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Order Recieved',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 5),
                          child: Text(
                            '${widget.orderData!.postedDate}',
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
                color: Colors.blue,
                height: 50,
                width: 50,
                iconStyle: widget.orderData!.picked ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
              ),
              beforeLineStyle: LineStyle(color: Colors.amber),
              afterLineStyle: LineStyle(color: Colors.blue),
              alignment: TimelineAlign.manual,
              lineXY: 0.15,
              endChild: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 30),
                    // color: Colors.amber[100],
                    height: 60,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Ready for Pickup',
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
                            '${widget.orderData!.pickedDate}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TimelineTile(
              axis: TimelineAxis.vertical,
              indicatorStyle: IndicatorStyle(
                iconStyle: widget.orderData!.invoiced ?? false
                    ? IconStyle(color: Colors.white, iconData: Icons.check)
                    : IconStyle(color: Colors.white, iconData: Icons.circle),
                color: Colors.green,
                height: 50,
                width: 50,
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
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Completed',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 5),
                          child: Text(
                            '${widget.orderData!.invoiceDate}',
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
            )
          ],
        ),
      ),
    );
  }
}
