# Project: Flutter E-Commerce (Login + Cart)
# Task Planning File (`plan.md`)

This file serves as an execution guide for the AI Agent. Execute one phase at a time and mark the corresponding checkboxes as completed ` - [x] ` before advancing to the next phase.

---

## CRITICAL ARCHITECTURAL FORESIGHT & ADAPTABILITY PROTOCOL
- **Architectural Autonomy:** You are NOT strictly locked into this blueprint. If you discover a cleaner, more efficient, or more robust way to implement a feature (e.g., better state handling, optimized widget tree, cleaner separation of concerns), you are ENCOURAGED to adapt the approach.
- **Change Log Requirement:** If you decide to deviate from the planned approach in any phase, you must append a brief `### Agent Optimization Note` at the bottom of that phase's checklist explaining *what* you changed and *why* it improves the codebase.
- **Lookahead Constraint:** When building UI in early phases, always implement states, controllers, and keys if a subsequent phase requires interactivity, form validation, or global state consumption. Never write throwaway `StatelessWidgets` for primary screens.
- **Patterns:** Apply Clean Architecture, SOLID, and DRY principles. Separate UI (Widgets) from business logic and data layers.
- **Data & State:** Use the DTO pattern for API models, enforce Dependency Inversion via abstract repositories, and use `provider` for global state management.
- **Quality:** Provide fully functional, complete production code. No placeholders, truncated snippets, or "TODO" comments.

---

## PHASE 1: Basic Visual Structure & Layout Foundations (Stage 1)
- [x] Create the core project directory structure (`lib/core`, `lib/features/auth`, `lib/features/shop`).
- [x] Create the `LoginPage` using a `Scaffold`. **[Lookahead]** It MUST be implemented as a `StatefulWidget` wrapped in a `Form` widget with a `GlobalKey<FormState>`, initializing `TextEditingController`s for username and password to seamlessly support Phase 2.
- [x] Implement the centered title text: "Minha aplicação".
- [x] Create the username input field (`TextFormField`) with the hint/label "usuário", passing the controller down.
- [x] Create the password input field (`TextFormField`) with the hint/label "senha", obscuring the text (`obscureText: true`) and passing the controller down.
- [x] Add a large blue button (`ElevatedButton`) with the text "Login". **[Lookahead]** Pass an empty callback or placeholder method from the State class to avoid refactoring widget signatures later.
- [x] Add text buttons (`TextButton`) for "Esqueceu a senha?" and "Não tem uma conta? Cadastre-se".
- [x] Modularize the widget tree components into clean, private or public sub-widgets to ensure scannability.

## PHASE 2: Interactivity, Form Validation, and Static Routing (Stage 2)
- [x] Hook up the `TextEditingController`s from Phase 1 to capture username and password values.
- [x] Add validation logic on the login button click: expected username = "admin" and expected password = "12345678".
- [x] Implement an error state variable. Display the red error message "Credenciais inválidas" right above the login button if validation fails.
- [x] Configure structured routing to navigate to `HomePage` using route replacement (`Navigator.pushReplacement`) upon successful validation.
- [x] Create the `HomePage` with an `AppBar` containing the title "Loja Online", a shopping cart icon, and a logout icon ("Sair").
- [x] Create a static/mock data model for `Product` (id, title, price, description, imageUrl).
- [x] Implement a grid layout component (`GridView.builder`) on the `HomePage`.
- [x] Create a modular `ProductCard` widget that accepts a `Product` instance via its constructor and features a "Comprar" button. **[Lookahead]** Design the card to easily accept a global state provider trigger in Phase 4.

## PHASE 3: Asynchronous API Consumption and Session Persistence (Stage 3)
- [x] Create the Data Transfer Object (DTO) for the product model with a `fromJson` factory mapper.
- [x] Create an abstract contract (`IProductRepository`) and its concrete implementation (`ProductRepository`) to perform the HTTP `GET` request to `https://fakestoreapi.com/products`.
- [x] Integrate a state manager or a `FutureBuilder` in `HomePage` to consume data from the repository, displaying a `CircularProgressIndicator` while loading.
- [x] Implement local persistence: Save an active session flag (e.g., `isLogged: true`) in `shared_preferences` after a successful login.
- [x] Refactor the initialization flow in `main.dart` to check `shared_preferences` on startup. If the user is logged in, redirect straight to `HomePage`.
- [x] Implement storage clearing inside the logout action ("Sair" icon) on the `AppBar`, routing the user back to `LoginPage`.

## PHASE 4: Global Cart State Management & Reactivity (Stage 4)
- [ ] Add the `provider` dependency to `pubspec.yaml` and inject it at the top of the widget tree in `main.dart`.
- [ ] Create a `CartProvider` state management class (extending `ChangeNotifier`) to store cart items, quantities, modification methods, and total price calculations.
- [ ] Bind the "Comprar" button action inside `ProductCard` to trigger item addition via `CartProvider`.
- [ ] Display visual feedback using a `SnackBar` when an item is added: "[Product Name] adicionado ao carrinho!".
- [ ] Create the `CartPage` ("Meu Carrinho") screen accessible from the `AppBar` cart icon.
- [ ] Consume the global state in `CartPage` to map and render the list of selected items.
- [ ] Implement increment (+), decrement (-), and removal (trash bin icon) buttons for each cart item, updating the state reactively.
- [ ] Render the dynamically formatted total price ("Total: R$ XX.XX") and a "Confirmar Compra" action button at the bottom of `CartPage`.