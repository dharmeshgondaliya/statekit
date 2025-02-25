# Statekit

Statekit is an extra-light and powerful state management solution for Flutter. It provides high-performance, efficient state management without relying on Streams, ChangeNotifier, or any other third-party state management package. Designed with performance and resource efficiency in mind, Statekit simplifies the process of managing dependencies and state updates while keeping the development experience seamless and intuitive.

## Installation

To get started with Statekit, install it by running the following command in your Flutter project:

```sh
flutter pub add statekit
```

## Dependency Management

Statekit provides built-in methods to efficiently manage dependencies, ensuring seamless initialization and retrieval of objects across your application.

### Adding Dependencies

- `Statekit.put<T>(T())` - Registers an instance of a dependency.
- `Statekit.putIfAbsent<T>(T())` - Adds an instance only if it does not already exist.

**Example:**
```dart
Statekit.put<MyController>(MyController());
```

### Retrieving Dependencies

- `Statekit.find<T>()` - Retrieves an existing dependency by type.
- `Statekit.findOrNull<T>()` - Retrieves an existing dependency or returns null if not found.

**Example:**
```dart
MyController controller = Statekit.find<MyController>();
```

### Replacing and Deleting Dependencies

- `Statekit.replace<T>(T())` - Replaces an existing dependency with a new instance.
- `Statekit.delete<T>()` - Deletes a dependency by its type.
- `Statekit.deleteObject<T>(T())` - Deletes a specific instance of an object.
- `Statekit.deleteAll()` - Clears all stored dependencies.
 
**Example:**
```dart
Statekit.delete<MyController>();
```

These methods make dependency injection simple and effective, reducing boilerplate code and ensuring a clean architecture.


## Creating a Controller

A controller in Statekit extends `StateController`. Controllers are responsible for managing business logic and updating UI states when needed.

```dart
class MyController extends StateController {
  void increment() {
    // Business logic
  }
}
```

## State Provider

A `StateProvider` manages the lifecycle of a controller. It automatically adds the controller when a screen is pushed and removes it when navigating back.

```dart
<screen_name>: (context) => StateProvider(
  stateProvider: StatekitProvider(create: () => MyController()),
  child: ...,
)
```

To access the controller inside a screen, use:

```dart
Statekit.find<MyController>();
```

This ensures that the controller is available throughout the screen's lifecycle without unnecessary re-creation.

## State Management Widgets

### StateView

`StateView` is a reactive widget that listens to state changes and updates the UI accordingly.

```dart
StInt counter = StInt(0);

StateView(
  value: counter,
  builder: (value) => Text("Count: ${value.value}"),
)
```

#### Updating State

To update the UI, simply modify the state value:

```dart
counter.value += 1;
```

### StateViewPlatform

`StateViewPlatform` enables platform-specific UI rendering while keeping state reactivity intact.

```dart
StateViewPlatform(
  value: counter,  
  android: (value, child) => ...,  
  ios: (value, child) => ...,  
  web: (value, child) => ...,  
  builder: (value, child) => Text("Count: ${value.value}"),
  child: ...,
)
```

### StateViewResponsive

`StateViewResponsive` dynamically adjusts the UI based on the device type, ensuring a seamless experience across different screen sizes.

```dart
StateViewResponsive(
  value: counter,
  mobile: (value, child) => ...,  
  tablet: (value, child) => ...,  
  desktop: (value, child) => ...,  
  builder: (value, child) => Text("Count: ${value.value}"),
  child: ...,
)
```

## StateBuilder

### StateBuilder

`StateBuilder` listens to state changes in a controller and rebuilds the UI accordingly.

```dart
StateBuilder<MyController>(
  builder: (context, controller, child) {
    return ...
  },
)
```

#### Updating the UI from a Controller

```dart
void updateUi(){
  ...
  update();
}
```

### StateBuilderPlatform

`StateBuilderPlatform` enables platform-specific UI building based on the controller state, ensuring optimal user experience on different platforms.

```dart
StateBuilderPlatform<MyController>(
  android: (context, controller, child) => ...,  
  ios: (context, controller, child) => ...,  
  web: (context, controller, child) => ...,  
  builder: (context, controller, child) => ...,  
  child: ...,  
)
```

### StateBuilderResponsive

`StateBuilderResponsive` allows device-type-based UI rendering while keeping state management intact.

```dart
StateBuilderResponsive<MyController>(
  mobile: (context, controller, child) => ...,  
  tablet: (context, controller, child) => ...,  
  desktop: (context, controller, child) => ...,  
  builder: (context, controller, child) => ...,  
  child: ...,  
)
```

## StatekitView and State Binding

`StatekitView` binds a controller to a screen, enabling direct interaction between the UI and state logic.

### Implementing a Controller with Binding

```dart
class MyController extends StateController<HomeScreenBinding> {
  void something(){
    binding?.doSomething(obj);
  }
}
```

### Defining a State Binding

`StateBinding` allows seamless communication between the controller and the screen, making it easy to trigger UI updates or execute logic from the controller.

```dart
abstract interface class HomeScreenBinding implements StateBinding {
  void doSomething(Object);
}
```

### Integrating Binding with `StatekitView`

Extend `StatekitView` to integrate binding and state management:

```dart
class HomeScreen extends StatekitView<MyController> implements HomeScreenBinding {
  @override
  Widget build(BuildContext context) {
    return ...;
  }

  @override
  void doSomething(Object obj) {
    // Handle logic
  }
}
```

## Conclusion

Statekit provides a robust, lightweight, and efficient way to manage state in Flutter applications. By eliminating unnecessary dependencies and focusing on high performance, it ensures smooth and responsive UI updates. Whether managing dependencies, creating controllers, or utilizing advanced state management widgets, Statekit offers a seamless and developer-friendly experience.