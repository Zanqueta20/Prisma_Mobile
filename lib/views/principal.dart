import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prisma/views/login.dart';
import 'package:prisma/views/carrinho.dart';
import 'package:prisma/hamburguer.dart';
 
class Principal extends StatefulWidget {
  const Principal({super.key});
 
  @override
  State<Principal> createState() => _PrincipalState();
}
 
class _PrincipalState extends State<Principal> {


 



//   Widget mostrarLista(){
//     for(int tamanho = 0; tamanho < 15; tamanho++)
//       {
//         Padding(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//         child: listaDeImagens[tamanho]),);
//       }

//       return mostrarLista();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
     
//       drawer: const hamburguer(),

//       appBar: AppBar(

//         toolbarHeight: 100,
        
//         backgroundColor: Color(0xFF7D95FF),

//         title: Image.asset("img/logo.jpg"),  
 
//         actions:[

//         IconButton(
//           icon: const Icon(Icons.search),
//           onPressed: (){
//             showSearch(context: context, delegate: MySearchDelegate(),
//             );
//           },
//         ),
//       ],
//     ),

//       body:
//       mostrarLista()
     
//     );
//   }
// }

// /*class destaques extends State<Principal>{
    
    
//     @override
//     Widget build(BuildContext context) {

//     }
   
// } */

// /*
//       body: 
      

// */


 List todos = [
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

List destaques = [
  Image.asset("img/1.jpg"),
  Image.asset("img/2.jpg"),
  Image.asset("img/3.jpg"),
  Image.asset("img/4.jpg"),
  Image.asset("img/5.jpg"),
  Image.asset("img/6.jpg"),
  Image.asset("img/7.jpg"),
];

List novidades = [
  Image.asset("img/8.jpg"),
  Image.asset("img/9.jpg"),
  Image.asset("img/10.jpg"),
  Image.asset("img/11.jpg"),
  Image.asset("img/12.jpg"),
  Image.asset("img/13.jpg"),
  Image.asset("img/14.jpg")
];

//  List<Widget> listaDeImagens = [];

//     Widget carregarLista() {
//     for (int contador = 1; contador < 16; contador++) {
//       listaDeImagens.add(Image.asset("img/$contador.jpg"));
//     }
//     return listaDeImagens[listaDeImagens.length];
//   }

Widget carrossel()
{
   return Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destaques.length,
          itemBuilder: (BuildContext ctx, int index)
          {
            return  Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
            child: destaques[index]),
              );
          },
        ),
  );
}

Widget mostrardestaques()
{
  return Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: destaques.length,
          itemBuilder: (BuildContext ctx, int index)
          {
            return  Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
            child: destaques[index]),
              );
          },
        ),
  );
}

Widget mostrarnovidades()
{
  return Container(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: novidades.length,
          itemBuilder: (BuildContext ctx, int index)
          {
            return  Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
            child: novidades[index]),
              );
          },
        ),
  );
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      drawer: hamburguer(),

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

     body: Column(
      children: [
        Image.asset("img/banner.png", width: 450),
        Text("Destaques", textAlign: TextAlign.left),
        Expanded(child: mostrardestaques(),), 
        Text("Novidades"),
        Expanded(child: mostrarnovidades(),),
      ],)
      );
  }
}