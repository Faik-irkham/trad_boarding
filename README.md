# 💸 TRAD BOARDING

A dynamic and highly animated onboarding screen for a conceptual finance app, built with Flutter. This project demonstrates a clean UI design brought to life with complex animations, including continuous random movement and a Light/Dark mode toggle.

---

## 🚀 Key Features

- **Clean & Modern UI/UX:** Faithfully reproduces a clean, modern UI design.
- **Dynamic Card Animations:** Asset cards move randomly and continuously in the background using `AnimationController` and `LayoutBuilder`.
- **Wide Range of Motion:** Card movement includes an "overhang," allowing them to move partially off-screen for a more fluid effect.
- **Collision-Proof Layout:** Uses `Column` and `Expanded` to separate the card animation area from the text/button area below, ensuring no overlap.
- **Custom Grid Background:** A clean grid background drawn using `CustomPainter`.
- **Text Animations:** Bottom text and buttons feature a fade-in and slide-up animation on load.
- **Light / Dark Mode:** Full-featured toggle between light and dark modes, with all UI colors (cards, text, background) adapting automatically.

---

## 🛠️ Tech Stack & Concepts

- **Flutter** & **Dart**
- **State Management:** Uses `StatefulWidget` and _lifting state up_ to manage the theme.
- **Complex Animations:**
  - `AnimationController`
  - `AnimatedBuilder`
  - `SingleTickerProviderStateMixin`
  - `Tween<Offset>` for movement
  - `FadeTransition` & `SlideTransition`
- **Custom Layouts:**
  - `Stack` for overlapping elements.
  - `LayoutBuilder` to get animation area constraints.
  - `Column` + `Expanded` to divide the screen.
- **Custom Rendering:**
  - `CustomPainter` to draw the background grid.
- **Theming:**
  - `ThemeData` to define light and dark color palettes.
  - `ThemeMode` to manage the theme state globally.

---

## 💻 Installation & Running

1.  Clone this repository:

    ```bash
    git clone [https://github.com/YourUsername/YourRepoName.git](https://github.com/Faik-irkham/trad_boarding.git)
    ```

2.  Navigate to the project directory:

    ```bash
    cd trad_boarding
    ```

3.  Get dependencies:

    ```bash
    flutter pub get
    ```

4.  Run the app:
    ```bash
    flutter run
    ```

---

## 📄 License

This project is licensed under the MIT License - see the `LICENSE` file (if available) for details.
