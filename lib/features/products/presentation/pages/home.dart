import 'package:clean/features/products/presentation/blocs/remote_product_bloc.dart';
import 'package:clean/features/products/presentation/blocs/remote_product_events.dart';
import 'package:clean/features/products/presentation/blocs/remote_product_state.dart';
import 'package:clean/features/products/presentation/widgets/productItem.dart';
import 'package:clean/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductBloc>(
        create: (BuildContext context) => sl()..add(const GetProduct()),
        child: BlocBuilder<ProductBloc, productstate>(
          builder: (contexts, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: const Color(0xffdfdfdf),
                      child: ListView.builder(
                          itemCount: state.products != null
                              ? state.products!.length
                              : 0,
                          itemBuilder: (BuildContext context, int index) =>
                              ProductItem(
                                item: state.products![index],
                              )),
                    ),
                  ),
                  FloatingActionButton(
                      onPressed: () {
                        // print("clicked");
                        var pp = BlocProvider.of<ProductBloc>(contexts)
                            .state
                            .products;
                        print(pp);
                      },
                      child: const Icon(Icons.add))
                ],
              ),
            );
          },
        ));
  }
}
