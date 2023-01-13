
import 'package:flutter/material.dart';
import 'package:table_app/quid_page.dart';

class Tablee extends StatefulWidget{
  const Tablee({super.key});

  @override
  State<StatefulWidget> createState() => TableState();
}
class TableState extends State<Tablee> {
  var noControler = TextEditingController();
  var rangeControler = TextEditingController();
  var flag = false;
  final formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
 static var range;
 // ignore: prefer_typing_uninitialized_variables
 static var number;
  String onchange = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text('Table Generator'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 15,right: 10,left: 10,bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              TextFormField(
                onChanged: (value){
                  onchange = value;
                  setState(() {});
                },
                maxLength: 4,
                keyboardType: TextInputType.number,
              controller: noControler,
              validator: (value){
                if(value!.isEmpty){
                  return 'Table Field Cannot Be Empty';
                }
                return null;
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.numbers_rounded),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText:'i.e 2',
                  label: const Text('Enter Number You Want'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
            ),
                const SizedBox(height: 20,),
            TextFormField(
              maxLength: 2,
              controller: rangeControler,
              // ignore: prefer_const_constructors
              keyboardType: TextInputType.numberWithOptions(),
              validator: (value){
                if(value!.isEmpty){
                  return 'Range Field Cannot Be Empty';
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                suffixIcon: const Icon(Icons.table_restaurant_outlined),
                  hintText:'i.e 10',
                  label: const Text('Enter Range'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
              ),
            ),
                const SizedBox(height: 15,),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: range,
                      itemBuilder: (context, index) {
                        if(flag == true){
                          return Center(child: Text('$number  *  ${index+1}  =  ${number * ++index}',
                            style: const TextStyle(fontSize: 35,fontStyle: FontStyle.italic),));
                        }else{
                          return const Text('');
                        }
                      },),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        style: TextButton.styleFrom(
                          fixedSize: const Size(165, 40)
                        ),
                        onPressed: (){
                      flag = true;
                      range = int.parse(rangeControler.text.toString());
                      number = int.parse(noControler.text.toString());
                      setState(() {});
                    }, child: Text('Generate Table $onchange')),
                    ElevatedButton(
                        style: TextButton.styleFrom(
                          fixedSize: const Size(150, 40)
                        ),
                        onPressed: (){
                           if(formKey.currentState!.validate()){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => Quizz(total: rangeControler.text.toString(),)));
                          }
                    }, child: const Text('Take Quiz'))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}