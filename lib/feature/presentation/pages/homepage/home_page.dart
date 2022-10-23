import 'package:flutter/material.dart';
import 'package:sniper/feature/presentation/pages/directory_search_page/directory_search_page.dart';
import 'package:sniper/feature/presentation/pages/path_traversal_page/path_traversal_page.dart';
import 'package:sniper/feature/presentation/pages/simple_test_page/simple_text_page.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/text_widget.dart';

import '../../widgets/button_widget.dart';
import '../burte_force_page/bruth_force_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBox(widget:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white
                ),
                child:const TextLtdWidget(title: "SELECT YOUR TEST",color: Colors.black,weight: FontWeight.w600,size: 34,),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SimpleTestPage()));
                  },
                  widget: const TextLtdWidget(title: "SIMPLE\n  TEST",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DirectorySearchPage()));
                  },
                    widget: const TextLtdWidget(title: "DIRECTORY \n   SEARCH",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PathTraversalPage()));
                  },
                    widget: const TextLtdWidget(title: "    PATH\nTRAVERSAL",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BruthForcePage()));
                  },
                    widget: const TextLtdWidget(title: " BURTE\nFOURCE",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ButtonWidget(height: 100,width: 150,onTap: (){},
                    widget: const TextLtdWidget(title: "   HASH\nINDENTIFR",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  ButtonWidget(height: 100,width: 150,onTap: (){},
                    widget: const TextLtdWidget(title: "   HASK \nCRACKER",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                ],
              ),
            ),
           const Expanded(child: SizedBox(height: 10,)),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(200.00),
                  topRight: Radius.circular(200),

                )
              ),
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: const TextLtdWidget(title: "Project your network with us",color: Colors.white,weight: FontWeight.w600,size: 18,),
            )
          ],
        ),
      )
      ),
    );
  }
}
