import 'package:flutter/material.dart';



class ListViewBuilder extends StatefulWidget {
  const ListViewBuilder({super.key});

  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
 List<String> title = ['Sparrow', 'Elephant', 'Humming Bird', 'Lion']; 
  
 List image = [
   'https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg',
  'https://cdn.pixabay.com/photo/2014/09/08/17/32/humming-bird-439364_960_720.jpg',
  'https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg',
  ];
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beautiful Sample App',
        ),
      ),
      body: RefreshIndicator(
        edgeOffset: 0,
        displacement: 200,
        strokeWidth: 5,
        color: Colors.green,
        onRefresh:_refresh ,
        child: ListView.builder(
          itemCount: image.length,
          shrinkWrap: true,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
           
             return Card(
       elevation: 4.0,
       child: Column(
         children: [
          ListTile(
          subtitle:Text(title[index]),
             trailing: const Icon(Icons.pets_outlined,
              color: Colors.green,
              size: 24.0,
            ),
           ),
           SizedBox(
             height: 200.0,
             child: Image.network(
               (image[index]),
             height: MediaQuery.of(context).size.width * (3 / 4),
            width: MediaQuery.of(context).size.width,
             ),
           ),
           Container(
             padding: const EdgeInsets.all(16.0),
             alignment: Alignment.centerLeft,
             child: const Text("Animals are multicellular, eukaryotic organisms in the biological kingdom Animalia. With few exceptions, animals consume organic material, breathe oxygen, have myocytes and are able to move, can reproduce sexually. Birds are a group of warm-blooded vertebrates constituting the class Aves, characterised by feathers, toothless beaked jaws, the laying of hard-shelled eggs, a high metabolic rate, a four-chambered heart, and a strong yet lightweight skeleton."),
           ),
           ButtonBar(
             children: [
               TextButton(
                 child: const Text('LEARN MORE'),
                 onPressed: () {/* ... */},
               ),
               TextButton(
                 child:const Icon(Icons.arrow_forward),
                 onPressed: () { 
                  var snackBar = const SnackBar(content: Text('Hey, you have Clicked on more images'));
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const MoreImage()));
                                },
               )
             ],
           )
         ],
       ));
          }
        ),
      ),
    );
  }
}

Future<void> _refresh(){

  return Future.delayed(
    const Duration(seconds:2),
    );
}
class MoreImage extends StatelessWidget {
	
const MoreImage({super.key});

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(title: const Text('MORE IMAGES'),),
  	body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
               
              // Image.network(src)             
              child: Image.network("https://cdn.pixabay.com/photo/2021/06/01/07/03/sparrow-6300790_960_720.jpg"),
  
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("https://cdn.pixabay.com/photo/2017/10/20/10/58/elephant-2870777_960_720.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network("https://cdn.pixabay.com/photo/2018/05/03/22/34/lion-3372720_960_720.jpg"),
            )
          ]
        ),
      ),
	);
}
}
