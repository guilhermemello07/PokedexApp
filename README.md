# Pokedex App

## Table of Contents
- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [API Integration](#api-integration)
- [App Features](#app-features)
- [Architecture](#architecture)
- [Technologies and Libraries Used](#technologies-and-libraries-used)
- [Known Issues and Limitations](#known-issues-and-limitations)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)
- [Contact Information](#contact-information)

## Description
This project is an iOS app that fetches and displays Pokémon data from PokeAPI. Users can view a list of Pokémon and see detailed information about each Pokémon.
This app was developed for a technical interview with Móveo.

## Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/guilhermemello07/PokedexApp
    ```
2. Open the project in Xcode:
    ```bash
    cd PokedexApp
    open PokedexApp.xcodeproj
    ```
3. Run the app on a simulator or device.

## Usage
- Launch the app.
- Browse the list of Pokémon.
- Search for any pokemon the app has already downloaded.
- Tap on a Pokémon to see detailed information.

## API Integration
This app uses [PokeAPI](https://pokeapi.co/) to fetch Pokémon data. The main endpoints used are:
- `api/v2/pokemon`: to fetch the list of Pokémon.
- `api/v2/pokemon/{id}`: to fetch detailed information about a specific Pokémon.

## App Features
### Home/List View
- Displays a list of Pokémon with their names and images.

### Detail View
- Shows detailed information about a selected Pokémon, including its type, characteristics, and stats.

## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture:
- **Model**: Represents the data structures.
- **View**: SwiftUI views that display the UI.
- **ViewModel**: Handles business logic and API calls, providing data to the view.

## Technologies and Libraries Used
- Swift
- SwiftUI
- Async/Await
- Pagination
- Error handling
- Cached images

## Known Issues and Limitations
- Unit tests can be included
- UI tests can be included

## Future Improvements
- Create thorough unit tests
- Depending on the company, they prefer to divide the ViewModel into a WebServise or NetworkManager

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request.

## License
This project is licensed under the MIT License.

## Contact Information
For any questions or feedback, please contact [guilhermemello1988@gmail.com](mailto:guilhermemello1988@gmail.com).
