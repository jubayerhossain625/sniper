import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:sniper/feature/presentation/pages/Hash_cracker/hash_cracker.dart';
import 'package:sniper/feature/presentation/pages/directory_search_page/directory_search_page.dart';
import 'package:sniper/feature/presentation/pages/forum/from.dart';
import 'package:sniper/feature/presentation/pages/path_traversal_page/path_traversal_page.dart';
import 'package:sniper/feature/presentation/pages/simple_test_page/simple_text_page.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/text_widget.dart';

import '../../widgets/button_widget.dart';
import '../Hash_Identify_page/hash_identify.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _a = GlobalKey();
  final GlobalKey _b = GlobalKey();
  final GlobalKey _c = GlobalKey();
  final GlobalKey _d = GlobalKey();
  final GlobalKey _e = GlobalKey();
  final GlobalKey _f = GlobalKey();


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
          (_)  =>  ShowCaseWidget.of(context)
          .startShowCase([
            _a, _b, _c, _d, _e, _f
          ]),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.green.withOpacity(0.5)
                ),
                child:const TextLtdWidget(title: "SELECT YOUR TEST",color: Colors.white,weight: FontWeight.bold,size: 26,),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Showcase(
                  key: _a,
                    description: "Testing to your site vlunabilit of security",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SimpleTestPage()));
                    },
                    widget: const TextLtdWidget(title: "SIMPLE\n  TEST",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  Showcase(
                    key: _b,
                    description: "Security of directory path of only status Code of 200",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DirectorySearchPage()));
                    },
                      widget: const TextLtdWidget(title: "DIRECTORY \n   SEARCH",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Showcase(
                    key:_c,
                    description: "Testing of path Traversal ",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PathTraversalPage()));
                    },
                      widget: const TextLtdWidget(title: "    PATH\nTRAVERSAL",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  Showcase(
                    key:_d,
                    description: " Hash cheeking of security",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  HashIdentifyPage()));
                    },
                      widget: const TextLtdWidget(title: "   HASH\nIDENTIFIER",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [

                  Showcase(
                    key:_e,
                    description: "hash cheek of Cracker",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const HashCrackerPage()));
                    },
                      widget: const TextLtdWidget(title: "   HASH\nCRACKER",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                    ),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  Showcase(
                    key: _f,
                    description: "click view to Blog,Video Guideline of Sniper ",
                    child: ButtonWidget(height: 100,width: 150,onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const Forum()));
                    },
                      widget: const TextLtdWidget(title: "  FORUM",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                    ),
                  ),
                ],
              ),
            ),
           const Expanded(child: SizedBox(height: 10,)),
            Container(
              decoration:  BoxDecoration(
                color: Colors.deepPurple.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(200.00),
                  topRight: Radius.circular(200),

                )
              ),
              alignment: Alignment.center,
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: const TextLtdWidget(title: "Test your URL with us",color: Colors.white,weight: FontWeight.w600,size: 18,),
            )
          ],
        ),
      )
      ),
    );
  }
}
