import 'package:bookly_app/Core/utils/service_locator.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementaion.dart';
import 'package:bookly_app/Features/home/presentation/manager/FeaturedBooksCubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/SimilierBooksCubit/similerbooks_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_view.dart';
import 'package:bookly_app/Features/search/presentation/views/search_view.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetails = '/bookDetails';
  static const kBookSearch = '/bookSearch';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  //Look at file service locator in utilis folder
                  FeaturedBooksCubit(getIt.get<HomeRepoImplementaion>())
                    ..fetchFeaturedBooks(),
            ),
            BlocProvider(
              create: (context) =>
                  //Look at file service locator in utilis folder
                  NewestBooksCubit(getIt.get<HomeRepoImplementaion>())
                    ..fetchNewestBooks(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kBookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilerbooksCubit(getIt.get<HomeRepoImplementaion>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kBookSearch,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
