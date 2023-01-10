import 'package:flutter/material.dart';
import 'package:sniper/feature/presentation/pages/forum/components/all_labs.dart';
import 'package:sniper/feature/presentation/pages/forum/components/faq.dart';
import 'package:sniper/feature/presentation/pages/forum/components/videos.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/custom_box.dart';
import '../../widgets/text_widget.dart';
import '../Hash_Identify_page/hash_identify.dart';
import '../directory_search_page/directory_search_page.dart';
import '../path_traversal_page/path_traversal_page.dart';
import '../simple_test_page/simple_text_page.dart';
import 'components/blogs.dart';

class Forum extends StatelessWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomBox(
        widget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon( Icons.arrow_back_ios,color: Colors.white.withOpacity(0.8),size: 35,)) ,

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white.withOpacity(0.8)
                        ),
                        child:const TextLtdWidget(title: "FORUM",color: Colors.black,weight: FontWeight.w600,size: 18,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1,),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BlogsPage()));
                  },
                    widget: const TextLtdWidget(title: "Blogs",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VideosPage()));
                  },
                    widget: const TextLtdWidget(title: "Videos",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FAQPage()));
                  },
                    widget: const TextLtdWidget(title: "FAQ",color: Colors.white,weight: FontWeight.w700,line: 2,size: 18,),
                  ),
                  const Expanded(child: SizedBox(width: 2,)),
                  ButtonWidget(height: 100,width: 150,onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllLabPage()));
                  },
                    widget: const TextLtdWidget(title: "All Labs",color: Colors.white,weight: FontWeight.w700,size: 18,line: 2,),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            const Spacer(flex: 1,),
          ],
        ),
        ),
      );
  }
}
