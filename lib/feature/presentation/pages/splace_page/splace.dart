
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sniper/feature/presentation/pages/homepage/home_page.dart';
import 'package:sniper/feature/presentation/widgets/button_widget.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/text_widget.dart';

class SlpacePage extends StatefulWidget {
  const SlpacePage({Key? key}) : super(key: key);

  @override
  State<SlpacePage> createState() => _SlpacePageState();
}

class _SlpacePageState extends State<SlpacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBox(widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  [
          const SizedBox(height: 50,),
          const TextLtdWidget(title: "Sniper",size: 34,weight: FontWeight.bold,color: Colors.white,),
          const SizedBox(height: 85,),
          Container(height: 300,width: MediaQuery.of(context).size.width,
          child:  Lottie.asset('assets/lottie/hacker.json'),
          ),
          const SizedBox(height: 10,),
          const TextLtdWidget(title: "Test Your Security",size: 25,weight: FontWeight.bold,color: Colors.white,),
          const SizedBox(height: 90,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonWidget(onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
              },
              radius: 50,
              height: 70,
              width: 70,
              widget: const TextLtdWidget(title: "GO ",color: Colors.white,size: 22,weight: FontWeight.w700,),
              bgColor: Colors.blueAccent,
            ),
          ),
          const Expanded(child: SizedBox(height: 10,)),
        ],
      )),
    );
  }
}
