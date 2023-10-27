import 'package:flutter/material.dart';
import 'package:news_app/data/model/news_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final productId = ModalRoute.of(context)!.settings.arguments == null ? "NULL":ModalRoute.of(context)!.settings.arguments as String;

    final Result arguments =
        ModalRoute.of(context)!.settings.arguments as Result;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${arguments.pubDate}  ${arguments.country?.first}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  arguments.title ?? "no title",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${arguments.category?[0].name}  ${arguments.language?.name}",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 10,
                ),
                Hero(
                  tag: arguments.title ?? "no arguments",
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                        width: double.infinity,
                        height: 300,
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(arguments.imageUrl ??
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcs7QeC2_kP0lJEj7Q25mpHyeNkLt_oQ43uP2_jLnhozFShnw-Mba_ataiwQd_W1aByyU&usqp=CAU'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(arguments.description ?? "no description"),
                const SizedBox(
                  height: 20,
                ),
                Text(arguments.content ?? "no content"),
              ],
            ),
          ),
        ),
        floatingActionButton: _FloatingButtom(),
      ),
    );
  }
}

class _FloatingButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Comentarios",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Ingresa tu comentario",
                        filled: true,
                        fillColor: Colors.black38,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: const Icon(Icons.chat),
    );
  }
}
