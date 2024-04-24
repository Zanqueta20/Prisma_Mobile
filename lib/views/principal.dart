import 'dart:html';

import 'package:flutter/material.dart';
import 'package:prisma/views/login.dart';
import 'package:prisma/views/carrinho.dart';
 
class Principal extends StatefulWidget {
  const Principal({super.key});
 
  @override
  State<Principal> createState() => _PrincipalState();
}
 
class _PrincipalState extends State<Principal> {

    void abrirCarrinho(){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>Carrinho() ));
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      drawer: const hamburguer(),

      appBar: AppBar(

        toolbarHeight: 100,
        
        backgroundColor: Color(0xFF7D95FF),
 
        actions:[
          
        Image.asset("img/logo.jpg"),  

        IconButton(icon: const Icon(Icons.shopping_basket), onPressed: abrirCarrinho, padding: EdgeInsets.only(bottom: 40),),

        IconButton(
          icon: const Icon(Icons.search),
          onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate(),
            );
          },
        ),
      ],
    ),

        body: Container(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          Image.asset("img/logo.jpg"),
        ],),
      ),
    );
  }
}

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
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login() ));},
      ),

      ListTile(
        leading: const Icon(Icons.checklist_rounded),
        title: Text("Categoria"),
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Login() ));},
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