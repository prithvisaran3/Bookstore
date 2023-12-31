import 'package:appavengers_bookstore/view_model/home/newest_books_cubit/newest_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_book_card.dart';

class ListViewBooks extends StatelessWidget {
  const ListViewBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NewestBookCubit, NewestBookState>(
        //TODO: use shimmer package for loading
        builder: (context, state) {
          if (state is NewestBookSucess) {
            return ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                if (state.books[index].volumeInfo.imageLinks?.thumbnail !=
                    null) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 5.0, right: 10, bottom: 10),
                    child: BestSellerBookCard(
                      book: state.books[index],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            );
          } else if (state is NewestBookFailure) {
            return Text(state.errorMessage.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
