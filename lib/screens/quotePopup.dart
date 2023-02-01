import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class QuotePopup extends StatefulWidget {
  const QuotePopup({super.key});

  @override
  State<QuotePopup> createState() => _QuotePopupState();
}

class _QuotePopupState extends State<QuotePopup> {
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
                color: Colors.blue,
                height: 50,
                width: 50,
                iconStyle:
                    IconStyle(color: Colors.white, iconData: Icons.check),
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 8),
                          child: Text(
                            'Quote Recieved',
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
                            '24/1/2023',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
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
              indicatorStyle: const IndicatorStyle(
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
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8, top: 20),
                          child: Text(
                            'Completed',
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
