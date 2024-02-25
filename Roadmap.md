# Roadmap for Flutter Bloc TDD Template Project

1. Migrate from Navigator to Go Router - `Deep Linking`
2. Basic Homepage UI
3. README Update for:
    * Asset Generation with Flutter_Gen
    * Folder Structure for Each Feature
        - Data: Data Management and Massaging
            - Data Sources: _Local, Remote, CoreAPI, SomeOtherAPI_
            - Models: Handling of Domain Entity and Data Manipulation
            - Repositories: Injecting Dependency into abstract Repo Layer

        - Domain: Basic Data Model, Abstract Repositories, and Usecase to 
            - Model _(Or **Entity** to avoid confusion)_: Abstract Model or Entity present in App
            - Repositories: Abstract Repo Layer for Business Needs
            - Use Cases: Layer to handle Business Requirement, UI Layer, and 3rd Party Calls

        - View
            - Views
            - Widgets

        - Bloc
            - Feature_Bloc _(Or **Feature_Cubit**)_
            - Feature_State
            - Feature_Event

    * Test Cases - Unit Testing, Widget Testing, Integration Testing
    * Implement Flavorizr Guide
    * 