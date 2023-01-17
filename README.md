## Weather App

### Implementation
It includes 4 layers:

1. Data layer (data provider)
2. Repository layer
3. Business layer (cubit/state)
3. Presentation layer (front-end/UI)

And you start coding them respectively. Overall concept for this architecture will be:

**Your Data Layer must be hidden/abstracted from your business/presentation layer, so the point of interaction will be the repository layer**

### Terminologies
#### Barrel
- Just a file that exports other files to clean-up imports

### Extensions
#### Bloc
- VS Code extension: https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc
- Dart Data Class Generator: https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator

### Project structure

### Business and Presentation layer

```
lib
    - extensions
        - ...
    -  screens/
        - weather/
            - cubits (Business layer)
                - weather_cubit.dart
                - weather_state.dart
            - models
                - models.dart (Barrel)
            - views (Presentation layer)
                - weather_view.dart (Entry point of UI)
                - widgets/
                    - error.dart
                    - loading.dart
                    - success.dart
                    - widgets.dart (Barrel)
```

### Data and Repository layers

```
packages
    - weather_data_provider/ (Data layer - Abstracted/Hidden)
        - lib/
            - src/
                - models/
                    - models.dart (barrel)
                    - location.dart
                    - weather.dart
            - weather_data_provider.dart (data provider implementation)
        - weather_data_provider (Barrel)

    - weather_repository (Repository layer)
        - lib/
            - src/
                - models
                    - models.dart (barrel)
                    - weather.dart
            - weather_repository.dart (repository implementation)
        - weather_repository.dart (barrel)
```