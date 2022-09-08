import ComposableArchitecture

// MARK: - Rocket providers

func getRocketList() -> Effect<[Rocket], APIError> {
    // TODO: implement
    return Effect(value: [])
}

func getRocketListFromMock() -> Effect<[Rocket], APIError> {
    return Effect(value: Rocket.all)
}
