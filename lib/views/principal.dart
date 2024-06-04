import 'package:flutter/material.dart';
import 'package:prisma/views/login.dart';
import 'package:prisma/views/carrinho.dart';
 
class Principal extends StatefulWidget {
  const Principal({super.key});
 
  @override
  State<Principal> createState() => _PrincipalState();
}
 
class _PrincipalState extends State<Principal> {

 List a = [
  Image.asset("img/1.jpg"),
  Image.asset("img/2.jpg"),
  Image.asset("img/3.jpg"),
  Image.asset("img/4.jpg"),
  Image.asset("img/5.jpg"),
  Image.asset("img/6.jpg"),
  Image.asset("img/7.jpg"),
  Image.asset("img/8.jpg"),
  Image.asset("img/9.jpg"),
  Image.asset("img/10.jpg"),
  Image.asset("img/11.jpg"),
  Image.asset("img/12.jpg"),
  Image.asset("img/13.jpg"),
  Image.asset("img/14.jpg"),
  Image.asset("img/15.jpg"),
  Image.asset("img/16.jpg"),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      drawer: const hamburguer(),

      appBar: AppBar(

        toolbarHeight: 100,
        
        backgroundColor: Color(0xFF7D95FF),

        title: Image.asset("img/logo.jpg"),  
 
        actions:[

        IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate(),
            );
          },
        ),
      ],
    ),

      body:
      Container(
        height: 160,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 8,
          itemBuilder: (BuildContext ctx, int index)
          {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Image.asset("img/4.jpg"),
                ),
              );
          },
        )
      ),
    
      );
  }
}

/*
      body: 
      
      ListView.builder(itemBuilder: (BuildContext ctx, int index)
      {
        return a[index];
      }, 
      itemCount: a.length),
*/

class hamburguer extends StatelessWidget{
  const hamburguer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        headerHamburguer(context),
        itemHamburguer(context),
      ],
    )
  );
  
 Widget headerHamburguer(BuildContext context) => Container(
  padding: EdgeInsets.only(
    top: MediaQuery.of(context).padding.top,
  ),
 );
  
Widget itemHamburguer(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
    runSpacing: 16,
    children: [
      ListTile(
        leading: const Icon(Icons.star),
        title: Text("Favoritos"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal() ));},
      ),

      ListTile(
        leading: const Icon(Icons.checklist_rounded),
        title: Text("Categorias"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal() ));},
      ),

      ListTile(
        leading: const Icon(Icons.shopping_cart),
        title: Text("Carrinho"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Carrinho() ));},
      ),  

      const Divider(color: Colors.black),

      ListTile(
        leading: const Icon(Icons.account_circle),
        title: Text("Perfil"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login() ));},
      ),
    ]
    )
);
}

class MySearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(onPressed: () {
      if(query.isEmpty){
        close(context,null);
      }
      else{
        query = '';
      }
    }, icon: const Icon(Icons.clear))
  ];
 
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context,null),
   );
 
  @override //zoom que vai virar uma pesquisa funcional
  Widget buildResults(BuildContext context) => Container(
   //child: onPressed: () {},
   );
   
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Aventura',
      'Romance',
      'Mistério',
    ];
 
    return ListView.builder(
      itemCount: suggestions.length ,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
 
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
 
            showResults(context);
          },
        );
      });
  }
}