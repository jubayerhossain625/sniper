
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sniper/feature/presentation/widgets/button_widget.dart';
import 'package:sniper/feature/presentation/widgets/custom_box.dart';
import 'package:sniper/feature/presentation/widgets/getre.dart';
import 'package:sniper/feature/presentation/widgets/text_field_widget.dart';
import '../../../datamodel/model.dart';
import '../../widgets/text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:regexed_validator/regexed_validator.dart';

class SimpleTestPage extends StatefulWidget {
  const SimpleTestPage({Key? key}) : super(key: key);

  @override
  State<SimpleTestPage> createState() => _SimpleTestPageState();
}

class _SimpleTestPageState extends State<SimpleTestPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =  GlobalKey<ScaffoldState>();
  TextEditingController data = TextEditingController();

  bool? isCheeked = false;
  bool? isCheekedp = false;
  bool? isloaded = false;
  late DataModel dataModel;
  List<DataModel> getData =[];
  List out =[];
  String path='assets/lottie/simple.json';



  fetchAlbum(String url)async {
    var x = {
      "url": url.toString(),
      "type":"s"
    };
    var response = await http.post(Uri.parse("http://192.168.0.156:2000"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(x),

    );
    var jsonBody = json.decode(response.body);
    getData.clear();
    for (var data in jsonBody) {
      setState(() {
        getData.add(DataModel(statusCode: data["a"], path: data["b"]));
      });
    }
    isloaded = true;
  }



  void _fetchData(BuildContext context) async {
    // show the loading dialog
    showDialog(
      // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  // The loading indicator
                  SizedBox(height: 300,width: MediaQuery.of(context).size.width,
                    child:  Lottie.asset('assets/lottie/lodercat.json'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  const Text('Loading...')
                ],
              ),
            ),
          );
        });

    // Your asynchronous computation here (fetching data from an API, processing files, inserting something to the database, etc)
    await Future.delayed(const Duration(seconds: 6));
    // Close the dialog programmatically
    Navigator.of(context).pop();
  }


  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      body: CustomBox(
        widget: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                          child:const TextLtdWidget(title: "SIMPLE TEST",color: Colors.black,weight: FontWeight.w600,size: 18,),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,)
                  ],
                ),
              ),
            const  SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SizedBox(
                  height: 50,
                  child: TextFieldLTDWidget(controller: data, inputType:TextInputType.text,hint: "Target URL", borderColor: Colors.white,),
                ),
              ),
              const  SizedBox(height: 20,),

              const SizedBox(height: 20,),
              ButtonLTDWidget(widget: const TextLtdWidget(title: "Start",
                weight: FontWeight.w700,size: 18.0,color: Colors.white,
              ),bgColor: Colors.brown,
              onTap: ()async{
                isloaded = false;
                if(validator.url(data.text)){
                  _fetchData(context);
                  getData.clear();
                  fetchAlbum(data.text);
                  setState(() {
                    path="assets/lottie/getres.json";
                  });
                }
                else{
                  setState(() {
                    path='assets/lottie/simple.json';
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pleaser Enter valid Url')),
                  );
                }

              },
              ),

              const SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(10),
                child:  Container(
                    height: h*0.6,
                    width: double.infinity,
                    padding: const EdgeInsets.all(5.00),
                   decoration: BoxDecoration(
                     color: Colors.white.withOpacity(0.8),
                     borderRadius: BorderRadius.circular(12),
                   ),
                    child: Column(
                      children:  [
                        const TextLtdWidget(title: "Testing Result",size: 19.00,weight: FontWeight.w600,),

                       Expanded(
                          child:getData.isNotEmpty? ListView.builder(
                            itemCount: getData.length,
                              itemBuilder: (context,index){
                            return  TextLtdWidget(title: "${getData[index].statusCode}    ----   ${getData[index].path}",size: 14.00,weight: FontWeight.w600,);
                          }): simpleLoader(path),
                        )
                      ],
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


}
