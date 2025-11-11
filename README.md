Fruits Hub — E-Commerce Fruit App 🍉🍎

A simple, Arabic-first Flutter e-commerce app for browsing and searching fruit products.
Implements local search, BLoC state management, Firebase integration and a clean modular structure suitable for learning and extension.

-------------------------------------------------------------------------------------------------------
Project Overview

Fruits Hub is a Flutter mobile app (with web/desktop plugin glue present) that provides a product catalog for fruits, search functionality, cart management and auth integrations (Google / Facebook / Firebase). The app bootstraps Firebase, sets Arabic locale by default, and uses BLoC cubits to manage UI state (search, cart, etc.). See app entry point and router setup in main.dart. 

-------------------------------------------------------------------------------------------------------

Tech Stack

Language & Framework: Dart & Flutter (project targets Flutter 3.x / Dart 3.x). 
State management: flutter_bloc (BLoC / Cubit pattern). 

Backend / Services: Firebase (Core, Auth, Firestore, Storage) with generated firebase_options. 

Packages & Utilities: provider, get_it, go_router, dio, shared_preferences, flutter_svg, font_awesome_flutter, uuid, etc. (see package listing). 

Plugins: flutter_inappwebview, google_sign_in, flutter_facebook_auth, flutter_secure_storage, and platform implementations. 

-------------------------------------------------------------------------------------------------------

Architecture (high level)

Modular / feature-based layout — features live under lib/feature/... with presentation, cubits and domain entities. Example: search feature under lib/feature/home/presntation/.... 

BLoC / Cubit pattern for UI logic (e.g., SearchCubit handles loading products and filtering). 

Service layer & DI: get_it is used for service registration (setupGetIt() called in main). Shared preferences and other singletons are initialized on app startup. 

Routing: Uses a router configuration (AppRouter.router) and go_router for navigation. 

-------------------------------------------------------------------------------------------------------

Features

Arabic-first UI with localization delegates loaded (app locale set to Arabic). 

Product search (client-side): loads all products and filters by product name (case-insensitive .contains(...)). Recent searches are saved to SharedPreferences. 

Search UI with live filtering, recent search chips and clear button. 

Cart management (add/remove/update) via cubits. 

Firebase integration (Auth, Firestore, Storage). 

Social sign-in hooks (Google, Facebook) and platform plugin registration for web/desktop. 

-------------------------------------------------------------------------------------------------------

Important Implementation Notes (observations from code)

The search implementation currently loads all products via productsRepo.getProducts() and filters in-memory by product.name.toLowerCase().contains(query.toLowerCase()). This means:

        Search is simple substring matching (no fuzzy matching, no stemming, no diacritic stripping). 

        Availability check (e.g., available_quantity > 0) is not enforced in the search filter — search will return products regardless of stock status unless additional filtering is added. (Good candidate for a fix / improvement.) 

Recent searches are stored using Prefs (shared preferences wrapper). 

-------------------------------------------------------------------------------------------------------

Folder Structure (representative)

/lib
  /core
    /services            # DI, shared prefs, helpers
    /entities            # domain models (ProductEntity, CartItemEntity, ...)
    /utils               # colors, images, styles
    /helper_functions    # router, etc.
  /feature
    /home
      /presntation
        /views
        /widgets
        /cubits          # SearchCubit, CartCubit, ...
      /domain
      /data
  /generated             # localization generated files
  firebase_options.dart
/test
/pubspec.yaml

(Structure above is inferred from code snippets — files like main.dart, search_cubit, search_view_body show this layout).

-------------------------------------------------------------------------------------------------------

How Search Works (short)
App loads all products once through ProductsRepo.getProducts(). 

SearchCubit holds _allProducts and filters them in-memory using product.name.toLowerCase().contains(query.toLowerCase()). 

If filtered results exist, the query is added to recent searches and saved via Prefs. 

UI (SearchViewBody) listens to cubit states and shows results, recent searches, loading and failure states. 

-------------------------------------------------------------------------------------------------------

Testing

The project includes flutter_test in dev_dependencies and follows standard Flutter testing conventions. 

Recommended tests to add / maintain:
            Unit tests for SearchCubit behaviors (empty query, existing query, recent searches).
            
            Repository mocks for ProductsRepo (use Mockito / mocktail or bloc_test) to simulate
            Firestore results.

            Widget tests for SearchViewBody to assert UI for loading, empty results, and result lists.

-------------------------------------------------------------------------------------------------------

How to Run the Project (dev)

Ensure Flutter SDK installed (compatible with project SDK constraints).

Clone repo and enter project:

    git clone <your-repo-url>
    cd e_coomerce_fruit

Install dependencies:

    flutter pub get

Configure Firebase:

    The project already contains firebase_options and firebase.json snippets — ensure your own Firebase project is configured or replace firebase_options.dart with your credentials. 

Run on device / emulator:

    flutter run

Run tests:

    flutter test

-------------------------------------------------------------------------------------------------------

Future Improvements (prioritized)

    Enforce availability in search results: filter out out-of-stock items (available_quantity > 0) or show “غير متوفر الآن” message for unavailable items. (Currently search does not check stock.) 

    Move search to server / indexed search: for large catalogs implement Firestore queries, Algolia, or Elasticsearch for performance and fuzzy matching.

    Fuzzy matching & Arabic normalization: remove diacritics, normalize hamza/taa marbuta, and implement fuzzy matching (e.g., fuse.js on web, Algolia/Elasticsearch backend).

    Notify-on-restock: allow users to subscribe for back-in-stock notifications.

    Pagination / lazy loading: avoid loading all products at once if catalog grows.

    Add end-to-end tests & CI: GitHub Actions to run flutter test and static analysis on PRs.

    Polish i18n: add English fallback and make localization more flexible via S.delegate usage already in project. 

-------------------------------------------------------------------------------------------------------

Screenshots

Add screenshots to assets/screenshots/ then reference them here using Markdown image links.

Example:
![Home screen](assets/screenshots/home.png)
![Search screen](assets/screenshots/search.png)

The project contains many SVG/png assets in assets/images (logo, icons, onboarding) — use those to prepare screenshots. 

-------------------------------------------------------------------------------------------------------

Contributing

    Fork the repository.

    Create a feature branch: git checkout -b feat/some-feature.

    Write tests for new behavior.

    Make a Pull Request with a clear description and screenshots if applicable.

-------------------------------------------------------------------------------------------------------

License

    Add your preferred license (e.g., MIT). If none provided, add a LICENSE file to make the terms explicit.

-------------------------------------------------------------------------------------------------------

Maintainers / Social Links

    GitHub: @donnShehab

    Contact / Email: shehab.saidi2002@gmail.com

-------------------------------------------------------------------------------------------------------

Quick Recommendations I can implement for you (if you want)

    Add a small change to SearchCubit.searchProducts to exclude unavailable products (I can provide the exact patch). 

    Add diacritic-insensitive matching for Arabic queries.

    Implement a “Notify me” modal and persistence for out-of-stock subscription.

-------------------------------------------------------------------------------------------------------




