# UI_AUDIT.md — Fruits Hub (e_coomerce_fruit)

Read-only audit. No code was changed. Palette untouched — every color proposal below is about
*where existing colors are referenced from*, never about new hues.

---

## 1. Project overview

- **Stack:** Flutter 3.44.8 / Dart SDK `^3.8.1`. Firebase (auth, firestore, storage), `flutter_bloc` +
  `get_it` for state/DI, `go_router` 16 for routing, `provider` for scoped entities in checkout.
- **UI packages:** `flutter_svg` (+ `flutter_svg_provider`), `skeletonizer` (loading), `animate_do`
  (empty-cart animation), `dots_indicator`, `modal_progress_hud_nsn`, `font_awesome_flutter`.
- **Structure:** feature-first — `lib/core/` (utils, widgets, repos, services) + `lib/feature/`
  (`splash`, `on_boarding`, `auth`, `home`, `best_selling_fruit`, `checkout`). Clean layering
  (data/domain/presentation) that is consistently applied; this part is genuinely well organized.
- **Routes** (`lib/core/helper_functions/app_router.dart:31`): `/SplashView`, `/OnBoardingView`,
  `/SigninView`, `/SignupView`, `/ForgetPassword`, `/OtpPassword`, `/HomeView` (shell with 4 tabs:
  Home, Products, Cart, Profile), `/BestSellingGridView`, `/BestSellingFruitView`, `/Checkout`.
  Two routes are commented out (`app_router.dart:47`, `:52`).
- **Theming:** `main.dart:32-36` — one `ThemeData` only. `useMaterial3` is not set, so on Flutter 3.44
  it defaults to **Material 3**. A full M3 palette is generated via
  `ColorScheme.fromSeed(seedColor: AppColors.primaryColor)` — and then **nothing in the app reads
  from it**. There is no `darkTheme`, no `themeMode`, no `TextTheme`, no `ThemeExtension`.
- **Fonts:** `Cairo` (4 weights) declared in `pubspec.yaml:57-66` and present in `assets/fonts/`.

### Current palette (all of it)

| Color | Defined at | Referenced how |
|---|---|---|
| `0xff1F5E3B` `primaryColor` | `core/utils/app_colors.dart:4` | 20 uses via `AppColors.primaryColor` — the one token used consistently |
| `0xFF2D9F5D` `lightPrimaryColor` | `app_colors.dart:5` | 2 uses (`sigin_view_body.dart:80`, `terms_and_conditions_widget.dart:57`) |
| `0xFFF4A91F` `secondryColor` | `app_colors.dart:6` | 5 uses |
| `0xFFF8C76D` `lightSecondryColor` | `app_colors.dart:7` | 3 uses |
| `0x7ff2f3f3` | `app_decorations.dart:8` | 1 use, via `AppDecorations.greyBoxDecorations` |

Everything else is inline. The recurring inline values are:
`0xFF949D9E` (7×), `0xFF4E5556` (6×), `0xffF3F5F7` (4×), `0xffDDDFDF` (3×), `0xFF1B5E37` (5×),
`0xFFF9FAFA`/`0xFFE6E9E9` (inputs), `0xFFEBF9F1`, `0xffEEF8ED`, `0xFFEEEEEE`, `0xffC9CECF`,
`0xFFDCDEDE`, `0xFFCACECE`, `0xff616A6B`, `0xff131F46`, `0xff888FA0`, `0xfff1f1f5`, `0xff0C0D0D`,
`0xffAAAAAA`, `0xffF2F3F3`, `0x33D9D9D9`, `0x19000000`, `0x66CACECE`.

> **Palette inconsistency worth flagging (not a palette change):** `0xFF1B5E37` is used as "the brand
> green" in `add_product_button.dart:16`, `active_navigation_item_bar.dart:33`, `cart_header.dart:18`
> and `empty_cart_Animation_widget.dart:24,35,55` — but `AppColors.primaryColor` is `0xff1F5E3B`.
> These are two *different* greens, 4 units apart in R/B. This is a copy-paste drift, not a design
> decision. Collapsing `1B5E37` → `primaryColor` keeps the palette and removes an accidental fifth color.

---

## 2. Findings

Severity: **S1** breaks/renders wrong on a common device · **S2** visibly inconsistent or degraded ·
**S3** polish.

| # | Issue | File:line | Category | Sev | Effort |
|---|---|---|---|---|---|
| 1 | `fontFamily: 'Cario'` — typo. Declared family is `Cairo` (`pubspec.yaml:58`). The whole app renders in Roboto, **Cairo is never applied**. Arabic text is being drawn by the fallback font. | `main.dart:33` | Polish | S1 | S |
| 2 | `height: 0.12` on a `TextStyle` — that's a 0.12× line-height multiplier; the line box collapses to ~1.5px and the text is clipped/overlapped. | `cart_header.dart:22` | Polish | S1 | S |
| 3 | `SizedBox(width: 237)` hardcoded inside a `Row`. Row content ≈ 60 + 237 + 50 = 347dp against ~296dp usable at 360dp. **Guaranteed overflow on every phone width.** | `order_summry_widget.dart:45` | Responsive | S1 | S |
| 4 | 6 OTP boxes × `width: 50` = 300dp + `spaceBetween` gaps, inside 32dp of padding. Needs ≥332dp; **overflows at 320dp**. | `otp_password_view.dart:160` | Responsive | S1 | S |
| 5 | `Duration(microseconds: 300)` — 0.3 **milliseconds**. Four page/step transitions are effectively instant. This is exactly the "abrupt transition" symptom. | `step_item.dart:22`, `checkout_view_body.dart:115`, `:141`, `shipping_addres_widget.dart:31` | Polish | S1 | S |
| 6 | `CustomPasswordField` declares `hintText` and `validator` but never forwards them — `hintText` is hardcoded to `'كلمة المرور'` at `:30` and `validator` is dropped. The OTP screen passes both (`otp_password_view.dart:112-113`); both are silently ignored, so the reset screen shows the wrong label and skips password validation. | `custom_password_field.dart:5,30` | Consistency | S1 | S |
| 7 | `CustomTextFormField.textDirection` declared at `:16`, never passed to the `TextFormField`. `forget_password_view.dart:75` passes `TextDirection.ltr` for a phone field; it does nothing. | `custom_text_form_field.dart:16` | Consistency | S2 | S |
| 8 | Only **one** `SafeArea` in the entire app (`on_boarding_view.dart:9`). Home/Cart/Products/Profile/Splash/BestSelling all draw under the status bar and gesture bar. Home fakes it with `SizedBox(height: 38)`. | `home_view_body.dart:36`, `product_view_body.dart:45`, `cart_view_body.dart:208`, `profile_view_body.dart:20`, `splash_view.dart:8`, `best_selling_fruit_view_body.dart:10` | Responsive | S1 | M |
| 9 | Cart's checkout button is `Positioned(bottom: height * .06)` floating over an unpadded `CustomScrollView` — the last cart item is permanently covered, and `.06` of height is 29dp on a small phone vs 60dp on a tablet. | `cart_view_body.dart:242-247` | Responsive | S1 | M |
| 10 | `Row` → `Column` of texts with no `Expanded`/`Flexible`. A long display name or email overflows. | `profile_home.dart:16`, `profile_view_body.dart:46` | Responsive | S1 | S |
| 11 | `SizedBox(width: 60)` fixed gap in a `Row` with unconstrained `Text`; `'تسجيل بواسطة فيسبوك'` at 16px semibold + icon + 60 exceeds 288dp at 320dp. | `custom_button_social_media.dart:78` | Responsive | S1 | S |
| 12 | `itemWidth = MediaQuery.width - 32`, but `FeaturedList` wraps each item in `EdgeInsets.symmetric(horizontal: 16)` (=32) *and* `HomeViewBody` adds another 16 per side. The card is ~64dp wider than its slot — the carousel peek is wrong at every width. | `featured_item.dart:13` + `featured_list.dart:127` | Responsive | S2 | S |
| 13 | No `darkTheme` and no `themeMode`. `scaffoldBackgroundColor: Colors.white` is hardcoded. In dark mode the OS/system chrome flips but every surface stays white — **and every hardcoded dark-grey text color listed in §1 stays dark-on-white while Material's own defaults (SnackBar, dialogs, cursor) go dark**. | `main.dart:32-36` | Polish/A11y | S1 | L |
| 14 | `ColorScheme.fromSeed` generates a complete M3 scheme that is then never referenced. Zero occurrences of `Theme.of(context).colorScheme` in `lib/`. | `main.dart:35` | Consistency | S2 | L |
| 15 | Zero `Theme.of(context).textTheme` usage. All 15 styles come from the static `TextStyles` class, plus 5 fully inline `TextStyle(fontSize:)`. | `cart_header.dart:17`, `profile_home.dart:21`, `empty_cart_Animation_widget.dart:32,43,67`, `search_home.dart:19` | Consistency | S2 | M |
| 16 | Touch targets under 48dp: cart +/− buttons are 24×24; the terms checkbox is 24×24; both back buttons are a bare `Icon` (~24dp) in a `GestureDetector`. | `cart_view_body.dart:270-271`, `custom_check_box.dart:21-22`, `custom_app_bar.dart:47-52`, `best_selling_fruit_view.dart:16-21` | A11y | S1 | S |
| 17 | **No press feedback anywhere.** Zero `InkWell`/`Material` ink in `lib/`; every tappable is a bare `GestureDetector` (15 live sites) — favorite, add-to-cart, delete, "المزيد", "تخطي", sort, checkout steps, nav tabs, both back buttons, the password eye. | `fruit_item.dart:116`, `best_selling_header.dart:16`, `page_view_item.dart:46`, `product_view_header.dart:123`, `checkout_steps.dart:23`, `custom_bottom_navigation.dart:105`, `cart_item.dart:56`, `cart_view_body.dart:267`, `shipping_item.dart:19`, `shipping_addres_widget.dart:27`, `custom_check_box.dart:16`, `custom_password_field.dart:21`, `custom_app_bar.dart:47`, `best_selling_fruit_view.dart:16`, `sigin_view_body.dart:73` | Polish | S2 | M |
| 18 | Zero `Semantics` labels and zero `tooltip:` in the app. Icon-only controls (favorite, notification bell, trash, sort, +/−) are unlabeled for screen readers. | app-wide | A11y | S2 | M |
| 19 | Error state is a bare centered string — no icon, no retry affordance. | `custom_err_message.dart:8` | Polish | S2 | S |
| 20 | `Image.network` with no `loadingBuilder` and no `errorBuilder` — product images pop in and render as a broken-image exception box on failure. Used for every grid tile and cart row. | `fruit_item.dart:142` | Polish | S1 | S |
| 21 | No empty state for the products grid — an empty `ProductsSuccess` renders a blank sliver. (The **cart** does have a good empty state.) | `products_grid_view_bloc+builder.dart:16` | Polish | S2 | S |
| 22 | RTL: `EdgeInsets.only(left:/right:)` in an Arabic-only app. Should be `EdgeInsetsDirectional.only(start:/end:)`. | `shipping_item.dart:24`, `active_navigation_item_bar.dart:19`, `add_product_button.dart:11`, `featured_item.dart:41` | Responsive | S2 | S |
| 23 | RTL: hardcoded `textAlign: TextAlign.right` instead of `.end` / inherited. Works today only because the locale is pinned to `ar`. | `fruit_item.dart:85`, `shipping_item.dart:50`, `order_summry_widget.dart:31,48` | Consistency | S3 | S |
| 24 | RTL: `Positioned(right: -3)` inside a `Stack` is a physical edge; `PositionedDirectional` is the RTL-safe form. | `fruit_item.dart:25-27`, `custom_notification.dart:18-20` | Responsive | S3 | S |
| 25 | `buildAppBar()` returns an `AppBar` but is used **both** as `Scaffold.appBar` (auth, checkout) **and** as an inline child inside a `Column` (home tabs). Inline, it loses status-bar padding and its own sizing contract. Two visually different app bars from one function — plus a third, hand-rolled one in `best_selling_fruit_view.dart:13` (§40). | `custom_app_bar.dart:28` vs `cart_view_body.dart:209`, `product_view_body.dart:46`, `profile_view_body.dart:21`, `best_selling_fruit_view.dart:13` | Consistency | S2 | M |
| 26 | Nested `Scaffold`s in three places — `ProductsView` and `ProfileView` each build their own `Scaffold` inside `MainView`'s `Scaffold.body`; `BestSellingFruitViewBody` builds one inside `BestSellingFruitView`'s. Doubles the `ScaffoldMessenger`/inset handling. | `product_view_body.dart:36`, `profile_view.dart:9` inside `main_view.dart:137`; `best_selling_fruit_view_body.dart:10` inside `best_selling_fruit_view.dart:12` | Consistency | S2 | S |
| 27 | Checkout is `Column` → `Expanded(PageView)` → fixed button + `SizedBox(32)`. Chrome is ~156dp fixed; in landscape (~360dp tall) with the keyboard up (~200dp) the `Expanded` goes to zero and overflows. | `checkout_view_body.dart:53-106` | Responsive | S1 | M |
| 28 | Non-scrolling `Column` bodies with text fields — keyboard causes a hard overflow. (Sign-in/sign-up/address **are** correctly wrapped in `SingleChildScrollView`; these two are not.) | `otp_password_view.dart:92`, `forget_password_view.dart:58` | Responsive | S1 | S |
| 29 | `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2)` — fixed 2 columns at every width. At 900dp each tile is ~430dp wide. | `best_selling_grid_view.dart:13-14` | Responsive | S2 | M |
| 30 | No max content width anywhere. Every screen stretches edge-to-edge at 600dp+. | app-wide | Responsive | S2 | M |
| 31 | Bottom nav is a fixed `height: 70` `Container` with no bottom `SafeArea` — overlaps the gesture bar on modern phones; content is not `Flexible`, so at 1.5× text scale the label overflows. | `custom_bottom_navigation.dart:79`, `active_navigation_item_bar.dart:41` | Responsive/A11y | S1 | S |
| 32 | Text scale: all 15 `TextStyles` are fixed `fontSize` inside fixed-height boxes (`CustomButton` h54, social button h54, search h40, OTP h60, nav h70, `CircleAvatar` r11.5). At 1.5×–2× these clip. No `MediaQuery.textScaler` clamp in `main.dart`. | `app_text_styles.dart`, `custom_button.dart:58` | A11y | S1 | M |
| 33 | 3 checkout steps in `Expanded` cells: at 320dp each gets ~96dp, but `CircleAvatar(r:11.5)` + 4 + `'المراجعه'` at semiBold16 ≈ 97dp. Overflows at 320dp and at any raised text scale. | `checkout_steps.dart:22`, `in_active_item_step.dart:23` | Responsive | S2 | S |
| 34 | `SnackBar(backgroundColor: Colors.blue)` — off-palette entirely; also duplicates `build_error_bar.dart`'s `showBar()`, which is the version actually used (8 call sites). | `custom_show_message.dart:7` | Consistency | S2 | S |
| 35 | Dividers are three different unstyled implementations: `CustomDivider` (`0xfff1f1f5`, h22), `OrDivider` (`0xffDDDFDF`, thickness 2), and a bare inset `Divider` (`0xFFCACECE`). No `DividerThemeData`. | `custom_divider.dart:8`, `on_divider.dart:11,17`, `order_summry_widget.dart:56-61` | Consistency | S3 | S |
| 36 | Icon sizes are ad-hoc: 34 (bell), 22 (add), 18 (check), 100 (empty cart), 24 (SVGs), default 24 elsewhere. No `IconThemeData`. | `custom_notification.dart:17`, `add_product_button.dart:21`, `active_item_step.dart:16` | Consistency | S3 | S |
| 37 | Border radius uses 9 distinct values: 4, 8, 12, 16, 20, 22, 30, 40, 100. `22` and `40` are used to mean "circle" on 36×36 and 40×40 boxes. | `custom_button.dart:64` (16), `fruit_item.dart:20` (4), `custom_check_box.dart:31` (8), `empty_cart_Animation_widget.dart:57` (12), `add_product_button.dart:17` (22), `custom_notification.dart:11` (40), `custom_bottom_navigation.dart:85` (30) | Consistency | S2 | M |
| 38 | Elevation/shadow: exactly one shadow in the app (`0x19000000`, blur 25) on the nav bar; every card is a flat `Container`. `AppBar` uses M3 default elevation and will show a scroll tint that no other surface has. | `custom_bottom_navigation.dart:89-95` | Consistency | S3 | S |
| 39 | `.withOpacity()` is deprecated on Flutter 3.44 (use `.withValues(alpha:)`); 4 occurrences will start emitting analyzer warnings. | `custom_button.dart:63`, `on_boarding_view_body.dart:53`, `shipping_item.dart:52`, `product_view_header.dart:133` | Polish | S3 | S |
| 40 | `BestSellingFruitView` hand-rolls its own `AppBar` (`:13-30`) instead of calling `buildAppBar` — a 4th app-bar implementation, and its back button repeats the same bare-`Icon`-in-`GestureDetector` pattern as §16. Its body then builds **another** `Scaffold` (`best_selling_fruit_view_body.dart:10`), and contains a stray empty `SliverToBoxAdapter()` at `:13`. Padding is `12` (off the 4dp scale, and inconsistent with the app-wide `16`). *The screen itself renders acceptably — this is duplication, not breakage.* | `best_selling_fruit_view.dart:13,16,32`, `best_selling_fruit_view_body.dart:10,13` | Consistency | S2 | S |
| 41 | Spacing magic numbers: **29 distinct values** — 2, 4, 4.5, 6, 7, 8, 9, 10, 11, 12, 13, 16, 17, 18, 20, 22, 24, 25, 26, 28, 29, 30, 31, 32, 33, 38, 43, 60, 237. | app-wide (198 hits / 45 files) | Consistency | S2 | M |
| 42 | Large blocks of commented-out UI left in place — makes it genuinely hard to tell which widget is live. `main_view.dart` is 96 lines of dead code before line 97; `featured_list.dart` 111; `product_view_header.dart` 101; `cart_view_body.dart` 181. | `main_view.dart:1-96`, `featured_list.dart:1-111`, `product_view_header.dart:1-101`, `cart_view_body.dart:1-181`, `custom_bottom_navigation.dart:1-60`, `custom_button.dart:1-38`, `custom_app_bar.dart:1-21` | Consistency | S2 | S |

### Proposed spacing scale (derived from what's already there)

The existing values cluster cleanly. A 4dp base covers 27 of the 29:

`xxs 2` · `xs 4` · `sm 8` · `md 12` · **`lg 16`** · `xl 24` · `xxl 32` · `xxxl 40`

Mapping: `4.5→4` · `6,7,9→8` · `10,11,13→12` · `17,18,20→16` · `22,25,26→24` · `28,29,30,31,33→32` ·
`38,43→40` · `60→32` (`custom_button_social_media.dart:78`, replaced by `Expanded`) ·
`237→` deleted (`order_summry_widget.dart:45`, replaced by `Spacer`).
`16` is already the de-facto unit via `kHorizintalPadding`/`kVerticalPadding`/`kTopPadding`
(`constants.dart:1-3`), which is used correctly on 9 screens.

### Proposed radius scale

`sm 4` (cards, inputs, chips) · `md 8` (checkbox) · `lg 16` (buttons) · `full` (circles).
Maps 12→16, 20/22/30/40/100→full or lg. Radius `4` is already dominant and stays the default.

### Widgets that should be unified

| Duplicated today | Should become |
|---|---|
| `CustomButton` (`custom_button.dart:43`), `CustomButtonSocialMediaa` (`:47`), `FeaturedItemButton` (`:5`), `ElevatedButton.icon` (`empty_cart_Animation_widget.dart:49`), `AddProductButton` (`:3`) | One `AppButton` with `primary` / `outlined` / `compact` variants, backed by `FilledButtonTheme` + `OutlinedButtonTheme` |
| `CartItemActionCircual` (`cart_view_body.dart:253`), `AddProductButton` (`add_product_button.dart:3`), `FruitItem`'s add `CircleAvatar` (`fruit_item.dart:120`) | One `CircleIconButton(size, filled)` — with a 48dp tap target |
| `ActiveShippingItemDot` / `InActiveShippingItemDot` (`shipping_item.dart:75,99`), `ActiveItemStep` / `InActiveItemStep`, `ActiveNavigationItemBar` / `InActiveNavigationItemBar` | Three `isActive`-driven widgets instead of six classes |
| `PaymentItem`'s grey box (`payment_item.dart:16`), `FruitItem`'s grey card (`fruit_item.dart:19`), `CartItem`'s grey thumb (`cart_item.dart:37`), `CartHeader` (`:10`) | One `AppSurface` card reading a `CardTheme` |
| `CustomDivider`, `OrDivider`, inline `Divider` | One `DividerThemeData` + a single `LabeledDivider` for the "أو" case |
| `showBar()` (`build_error_bar.dart:3`) vs `showMessage()` (`custom_show_message.dart:5`) | Keep `showBar`, delete the other |
| `SearchTextField` (`search_home.dart:12`) vs `CustomTextFormField` (`custom_text_form_field.dart:25`) | One `InputDecorationTheme`; both then just set `hintText`/icons |

### What is already done well — leave it alone

- **Skeleton loading on the products grid** (`products_grid_view_bloc+builder.dart:23`) — `Skeletonizer.sliver`
  over dummy products is exactly the right pattern, better than a spinner. Reuse this shape elsewhere.
- **Empty cart state** (`empty_cart_Animation_widget.dart`) — icon + headline + subtext + CTA, with a
  tasteful `FadeInUp`/`Bounce`. This is the model for the missing empty states.
- **RTL foundation is correct**: `locale: Locale('ar')` + `GlobalWidgetsLocalizations.delegate`
  (`main.dart:30,42-47`) gives the whole tree an RTL `Directionality`. `Row`/`Spacer`/`Expanded` are
  used throughout rather than absolute positioning, so most layouts already mirror correctly. The
  `EdgeInsets.only` cases in §22 are the only real leaks.
- **`CustomButton` disabled state** (`custom_button.dart:61-63`) — correctly dims on `onPressed == null`,
  and both `forget_password_view.dart:80` and `otp_password_view.dart:118` wire it to the loading state.
- **`AutomaticKeepAliveClientMixin` on `ShippingSection`** (`shipping_section.dart:14,56`) — correct,
  keeps the payment selection alive across `PageView` pages.
- **`AnimatedCrossFade` / `AnimatedContainer` / `AnimatedSwitcher`** are already reached for
  (`step_item.dart:16`, `custom_check_box.dart:20`, `shipping_item.dart:21`) — the instinct is right,
  only the `microseconds` durations (§5) undermine it.
- `constants.dart` + `AppColors` + `TextStyles` already exist and are honestly a decent starting point.
  Phase 1 is mostly about *routing them through `ThemeData`*, not inventing anything new.

---

## 3. Top 10 by impact ÷ effort

1. **Fix `'Cario'` → `'Cairo'`** (`main.dart:33`) — *every Arabic glyph in the app changes to the intended
   typeface.* One character. Nothing else on this list comes close.
2. **`Duration(microseconds: 300)` → `milliseconds`** (4 sites, §5) — *checkout step transitions and page
   swipes become visible animations instead of instant cuts.* Four words.
3. **Delete `SizedBox(width: 237)`, use `Spacer()`** (`order_summry_widget.dart:45`) — *removes a yellow-black
   overflow stripe from the order summary on every phone.*
4. **`cart_header.dart:22` remove `height: 0.12`** — *the cart's item-count banner becomes readable text
   instead of a crushed line.*
5. **Wrap the four tab bodies in `SafeArea`** (§8) — *content stops sliding under the notch and gesture bar;
   also lets the fake `SizedBox(height: 38)` go away.*
6. **`Expanded` around the name/email `Column`s** (`profile_home.dart:16`, `profile_view_body.dart:46`)
   and the social-button label (`custom_button_social_media.dart:78`) — *long names and the Facebook label
   ellipsize instead of overflowing.*
7. **`Image.network` → `loadingBuilder` + `errorBuilder`** (`fruit_item.dart:142`) — *product images fade in
   over a placeholder instead of popping, and a dead URL shows a fruit glyph, not a broken-image box.*
8. **Give the OTP boxes `Expanded` and make the two auth `Column`s scrollable** (§4, §28) — *the OTP screen
   stops overflowing at 320dp and stops overflowing when the keyboard opens.*
9. **Bottom padding on the cart list + `SafeArea` on the nav bar** (§9, §31) — *the last cart item and the
   checkout total stop being hidden behind the floating button and the gesture bar.*
10. **Wrap tappables in `InkWell` inside `Material`** (§17) — *every tap gets a ripple; the app stops feeling
    unresponsive on the grid, nav, and checkout steps.*

Items 1–4 are roughly 15 minutes total and fix four S1 defects.

---

## 4. Phased plan

### Phase 1 — Foundation (no intended visual change)

**Goal:** every color/size/style already in the app becomes reachable from `Theme.of(context)`.
The rendered pixels should be identical at the end of this phase.

- Fix `main.dart:33` `'Cario'` → `'Cairo'`. **This one *is* a visual change** — it is the correct one, and
  it should land first and alone so the type change is reviewable in isolation.
- Build `ColorScheme.light` **from the existing values**: `primary` = `0xff1F5E3B`, `secondary` = `0xFFF4A91F`,
  `surface`/`background` = white, `surfaceContainer` = `0xffF3F5F7`, `outline` = `0xFFE6E9E9`,
  `outlineVariant` = `0xffDDDFDF`, `onSurfaceVariant` = `0xFF4E5556`. Add a `ThemeExtension` for the
  greys that have no M3 slot (`0xFF949D9E` hint, `0xFFF9FAFA` input fill, `0xFFEBF9F1` success tint).
  Collapse `0xFF1B5E37` → `primary` (§1 note).
- Map `TextStyles`' 15 entries onto a `TextTheme` (`bold28→displaySmall` … `regular11→labelSmall`), keeping
  `TextStyles` as thin aliases so no call site breaks yet.
- Add `AppSpacing` / `AppRadius` constants from the scales in §2. Do not rewrite call sites yet.
- Add `InputDecorationTheme`, `DividerThemeData`, `IconThemeData`, `AppBarTheme`, `FilledButtonTheme`
  seeded with the values already hardcoded in `custom_text_form_field.dart`, `custom_divider.dart`,
  `custom_app_bar.dart`, `custom_button.dart`.
- Add `darkTheme` + `themeMode`. **Do not ship it enabled** — build it, gate it, verify later.
- Add a `MaterialApp.builder` clamping `textScaler` to ≤1.3 as an interim guard for §32.

**Files:** `main.dart`, `core/utils/app_colors.dart`, `app_text_styles.dart`, `app_decorations.dart`,
`constants.dart`, + 2 new theme files.
**Risk: low.** Nothing reads the theme yet, so regressions can only come from the `AppBarTheme` /
`InputDecorationTheme` defaults leaking into widgets that currently rely on M3 defaults — check the
auth screens and the checkout app bar after this phase.
**Caveat:** once real dark support lands, the ~25 hardcoded greys in §1 are what will break. Phase 1
only makes the fix *possible*; Phase 4 does it.

### Phase 2 — Shared widgets

Unify per the table in §2, in this order (least entangled first):

1. `showMessage` → delete; `AppSurface` card; `DividerThemeData`.
2. `CircleIconButton` — replaces `CartItemActionCircual`, `AddProductButton`, `FruitItem`'s avatar; this is
   also where the 48dp tap target (§16) lands.
3. `AppButton` — `CustomButton` + social + featured + the empty-cart `ElevatedButton`.
4. Collapse the six active/inactive pairs into three `isActive` widgets.
5. `buildAppBar` → a real `PreferredSizeWidget` used only as `Scaffold.appBar`; remove the nested
   `Scaffold`s (§26) and give the home tabs a proper app bar slot.
6. Delete the dead commented blocks (§42) as each file is touched.

**Files:** all of `core/widgets/`, `home/.../widgets/` (~14 files), `checkout/.../widgets/` (~6 files).
**Risk: medium.** Item 5 changes the layout contract of the four tab screens — the app bar moves from
inside the scroll view to above it, which changes scroll behavior. It is the one item here worth doing
on its own branch. Items 1–4 are mechanical.

### Phase 3 — Responsive, screen by screen (most broken first)

1. **Checkout** — §3 (`SizedBox(237)`), §27 (landscape/keyboard overflow), §33 (steps at 320dp),
   §22 (`EdgeInsets.only` in `shipping_item.dart`). Wrap the body in `SafeArea` + scroll, move the
   button into `bottomNavigationBar`.
2. **Cart** — §9 (button overlays list), §8 (`SafeArea`), §16 (24dp +/− targets).
3. **OTP + Forget password** — §4 (`Expanded` OTP boxes), §28 (scrollable), §7 (`textDirection`).
4. **Home + Products** — §8 (`SafeArea`, drop the fake 38), §12 (carousel width math), §10 (`Expanded`),
   §29 (`SliverGridDelegateWithMaxCrossAxisExtent` ≈ 200dp → 2 cols at 360, 3 at 600, 4–5 at 900).
5. **Profile** — §10, §8. Currently the thinnest screen; it is also the easiest to make look intentional.
6. **BestSellingFruitView** — §29 (grid columns) and the `12`→`16` padding. Its structural cleanup
   (§40: duplicate app bar, nested `Scaffold`, stray sliver) belongs to Phase 2, not here.
7. **Bottom nav** — §31 (`SafeArea` bottom, `Flexible` label).
8. **Global** — max content width (~600dp centered) for 600dp+; RTL `EdgeInsetsDirectional` sweep (§22–24).

**Expected behavior after this phase, by width:**

| Width | Now | After |
|---|---|---|
| 320dp | OTP overflows; order summary overflows; social button overflows; checkout steps overflow | All fit; grid 2 cols |
| 360dp | Order summary overflows; carousel peek wrong; content under status bar | Clean; grid 2 cols |
| 390dp | Order summary overflows; content under status bar | Clean; grid 2 cols |
| 430dp | Order summary overflows; cart button floats too high | Clean; grid 2 cols |
| 600dp+ | Everything stretches full-bleed; 2 giant grid tiles; cart button 36dp off the bottom | Centered ~600dp column; grid 3 cols |
| 900dp+ | 430dp-wide product tiles; unusable proportions | Centered column; grid 4–5 cols. *Two-pane (list + detail) is a Phase 5 question — see §5.* |
| Landscape | Checkout overflows; onboarding image eats 50% of a 360dp height; splash `spaceBetween` collapses | Scrollable; `PageViewItem` height becomes `min(height*.5, 320)` |

**Risk: medium-high.** This phase moves widgets between scroll containers; the cart and checkout changes
touch the paid flow. Every change here is layout-only — no cubit, repo, or navigation logic should move.

### Phase 4 — Polish

- Loading: reuse the `Skeletonizer` pattern for cart items and the profile header (§21).
- Empty: products grid, search results, order summary — modeled on `EmptyCartAnimationWidget`.
- Error: rebuild `CustomErrMessage` with icon + message + retry (§19); wire retry to the cubit.
- Images: `loadingBuilder`/`errorBuilder` on `CustomNetworkImage` (§20).
- Motion: fix the four `microseconds` (§5); add `AnimatedSwitcher` to the nav bar (the commented-out
  `AnimatedNavigationBarItem` in `navigation_item_bar.dart:33-75` is already written and looks right).
- Ripples (§17), `Semantics` labels (§18), 48dp targets (§16), `.withOpacity` → `.withValues` (§39).
- **Enable dark mode**: replace the ~25 hardcoded greys with the Phase 1 tokens, then flip `themeMode`.
- Remove the interim `textScaler` clamp and fix the fixed-height boxes properly (§32).

**Files:** broad but shallow — mostly one-to-three-line edits across ~30 files.
**Risk: low**, except the dark-mode flip, which touches every hardcoded color and needs a pass over
all 11 screens in both modes.

---

## 5. Open questions — I need these answered before writing code

1. **Platforms.** All six platform folders exist (`android`, `ios`, `web`, `windows`, `macos`, `linux`).
   Which are actually shipping? If it's Android + iOS only, I skip desktop/web breakpoints and Phase 3's
   900dp work shrinks a lot. **This is the single biggest scoping question.**
2. **Tablet.** Does tablet matter as a real target, or just "don't look broken if someone rotates an
   iPad"? Two very different amounts of work: a max-width wrapper + responsive grid (~half a day) versus
   two-pane master/detail layouts for Products and Checkout (~several days).
3. **Landscape.** Nothing locks orientation today — `AndroidManifest.xml:12` handles it and
   `Info.plist:31-36` permits it on iPhone. Do you want landscape supported, or should I lock to portrait
   with `SystemChrome.setPreferredOrientations`? Locking deletes a meaningful chunk of Phase 3.
4. **Dark mode — required, or nice-to-have?** It's the largest single item in the plan (§13), because it
   forces all ~25 hardcoded colors to be tokenized. If it's not needed now, Phase 1 still lands the
   groundwork and Phase 4 drops by roughly half.
5. **Which screens matter most to you?** My ordering in Phase 3 is by how broken each screen is, which
   may not match how much you care. Checkout is the most broken; Home is the most seen.
6. **Locale.** `main.dart:30` pins `locale: const Locale('ar')` while `l10n` ships both `ar` and `en`
   (`generated/intl/messages_en.dart`). Is English a real target? If yes, the RTL/LTR items (§22–24)
   move from "tidiness" to S1, and I should also check every hardcoded Arabic string — there are many,
   e.g. `fruit_item.dart:92,108`, `cart_header.dart:16`, `checkout_steps.dart:48`.
7. **The `0xFF1B5E37` / `0xff1F5E3B` split** (§1). I'm reading this as accidental drift and proposing to
   collapse it to `primaryColor`. Confirm that's right — if `1B5E37` was a deliberate second green, I'll
   add it to `AppColors` as a named token instead and leave both.
8. **Text scale ceiling.** Do you want to genuinely support 2× (which means the fixed-height buttons,
   nav bar, and OTP boxes all need to become intrinsic-height), or clamp at ~1.3× and call it done?
9. **The commented-out code** (§42, ~550 lines across 7 files). May I delete it as I touch each file?
   It's in git history, and it makes the live widget hard to find.
10. **Two dead routes** — `kAddingProductView` and `kMoreProductView` are commented out in
    `app_router.dart:47,52`, but `more_product_view.dart` and `add_product_button.dart:20`'s navigation
    target still exist. Are those screens planned, or should they come out?

---

**Nothing in this report has been implemented.** Awaiting your answers to §5 and approval of the phasing.
