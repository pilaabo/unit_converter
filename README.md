# Measures Convertor App

This is a simple Flutter application for converting between different units of measurement. The app allows users to input a value, select the unit of the measurement they are converting from, and choose the unit they want to convert to. The result of the conversion is then displayed to the user.

## Features

- **Unit Conversion**: The app supports conversions between different units such as meters, kilometers, grams, kilograms, feet, miles, pounds, and ounces.
- **Dynamic User Interface**: Users can input the value to be converted and select the units from dropdown menus.
- **Responsive Design**: The app layout adjusts based on the screen size to provide a better user experience.

## Supported Units

- Meters
- Kilometers
- Grams
- Kilograms
- Feet
- Miles
- Pounds (lbs)
- Ounces

## How It Works

The app uses a predefined conversion matrix to handle the unit conversions. Each unit is mapped to an index, and a formula matrix is used to convert between these indices.

## Code Structure

- **`main.dart`**: The main file containing the app logic and UI.
- **`MyApp`**: The main widget that initializes the app and sets up the UI.
- **`MyAppState`**: The state class where the logic for the unit conversion is handled. It also manages the UI state and handles user input.

## Functions and Widgets

- **`convert(double value, String from, String to)`**: Converts the value from the selected unit to the target unit using the predefined formula matrix.
- **`build(BuildContext context)`**: Builds the user interface with input fields, dropdown menus, and buttons for conversion.
- **`initState()`**: Initializes the app's state variables.

## How to Use

1. **Value Input**: Enter the numerical value you want to convert in the text field.
2. **Select Units**:
    - **From**: Choose the unit of the value you've entered.
    - **To**: Select the unit you want to convert the value into.
3. **Convert**: Press the 'Convert' button to perform the conversion.
4. **Result**: The converted value is displayed below the button.

## Getting Started

1. **Install Flutter**: Ensure you have Flutter installed and set up on your development environment.
2. **Clone the Repository**: Download or clone the code to your local machine.
3. **Run the App**: Open the project in your preferred IDE (like VS Code or Android Studio) and run the `main.dart` file.