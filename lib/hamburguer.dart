import 'package:flutter/material.dart';
import 'package:prisma/views/login.dart';
import 'package:prisma/views/carrinho.dart';
import 'package:prisma/views/principal.dart';

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
        leading: const Icon(Icons.home),
        title: Text("Home"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal() ));},
      ),

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
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Principal() ));},
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