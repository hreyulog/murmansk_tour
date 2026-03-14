# Murmansk Tour

A HarmonyOS tourism application for Murmansk, the capital of the Russian Arctic.

## Features

- **Home** - Banner carousel, featured sights and events
- **Sights** - City attractions with details and map links
- **Events** - Annual events and festivals
- **More** - Infrastructure (museums, theaters, cinemas, etc.), transport info, contacts

## Tech Stack

- HarmonyOS SDK 6.0.2(22)
- ArkTS / ArkUI
- Hvigor build system

## Project Structure

```
entry/src/main/ets/
├── entryability/
│   └── EntryAbility.ets
├── models/
│   └── DataModels.ets
└── pages/
    ├── Index.ets
    ├── SightDetail/
    ├── EventDetail/
    ├── Infrastructure/
    ├── Transport/
    └── Contact/
```

## Getting Started

1. Install DevEco Studio
2. Clone this repository
3. Open project in DevEco Studio
4. Configure signing in `build-profile.json5`:
   - Set your certificate paths
   - Replace `YOUR_KEY_PASSWORD` and `YOUR_STORE_PASSWORD`
5. Build and run

## Data Source

Tourism information from [tour.citymurmansk.ru](https://tour.citymurmansk.ru)

## License

MIT
