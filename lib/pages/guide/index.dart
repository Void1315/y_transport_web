import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GuidePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuidePageState();
}

class GuidePageState extends State<GuidePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.vertical,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 260,
              child: Swiper(
                autoplay:true,
                pagination: SwiperPagination(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset("assets/images/swiper_${index+1}.png",fit: BoxFit.contain,);
                },
              ),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ],
    )
    );
  }
}
