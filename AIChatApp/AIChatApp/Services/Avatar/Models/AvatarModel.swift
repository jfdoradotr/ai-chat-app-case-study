//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct AvatarModel {
  let avatarId: String
  let name: String?
  let characterOption: CharacterOption?
  let characterAction: CharacterAction?
  let characterLocation: CharacterLocation?
  let profileImageUrl: URL?
  let authorId: String?
  let dateCreated: Date?

  init(
    avatarId: String,
    name: String? = nil,
    characterOption: CharacterOption? = nil,
    characterAction: CharacterAction? = nil,
    characterLocation: CharacterLocation? = nil,
    profileImageUrl: URL? = nil,
    authorId: String? = nil,
    dateCreated: Date? = nil
  ) {
    self.avatarId = avatarId
    self.name = name
    self.characterOption = characterOption
    self.characterAction = characterAction
    self.characterLocation = characterLocation
    self.profileImageUrl = profileImageUrl
    self.authorId = authorId
    self.dateCreated = dateCreated
  }

  var characterDescription: String {
    AvatarDescriptionBuilder(avatar: self).description
  }
}

struct AvatarDescriptionBuilder {
  let characterOption: CharacterOption
  let characterAction: CharacterAction
  let characterLocation: CharacterLocation

  init(characterOption: CharacterOption, characterAction: CharacterAction, characterLocation: CharacterLocation) {
    self.characterOption = characterOption
    self.characterAction = characterAction
    self.characterLocation = characterLocation
  }

  init(avatar: AvatarModel) {
    self.characterOption = avatar.characterOption ?? .default
    self.characterAction = avatar.characterAction ?? .default
    self.characterLocation = avatar.characterLocation ?? .default
  }

  var description: String {
    let article = characterOption.startsWithVowelSound == true ? "An" : "A"
    let option = characterOption.displayName
    let action = characterAction.displayName
    let location = characterLocation.displayName
    return "\(article) \(option) that is \(action) in \(location)"
  }
}

enum CharacterOption {
  case man, woman, alien, dog, cat

  static var `default`: Self { .man }

  var startsWithVowelSound: Bool {
    switch self {
    case .alien: return true
    default: return false
    }
  }

  var displayName: String {
    switch self {
    case .man: return "man"
    case .woman: return "woman"
    case .alien: return "alien"
    case .dog: return "dog"
    case .cat: return "cat"
    }
  }
}

enum CharacterAction {
  case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying

  static var `default`: Self { .smiling }

  var displayName: String {
    switch self {
    case .smiling: return "smiling"
    case .sitting: return "sitting"
    case .eating: return "eating"
    case .drinking: return "drinking"
    case .walking: return "walking"
    case .shopping: return "shopping"
    case .studying: return "studying"
    case .working: return "working"
    case .relaxing: return "relaxing"
    case .fighting: return "fighting"
    case .crying: return "crying"
    }
  }
}

enum CharacterLocation {
  case park, mall, museum, city, desert, forest, space

  static var `default`: Self { .park }

  var displayName: String {
    switch self {
    case .park: return "the park"
    case .mall: return "the mall"
    case .museum: return "the museum"
    case .city: return "the city"
    case .desert: return "the desert"
    case .forest: return "the forest"
    case .space: return "space"
    }
  }
}

// MARK: - Mocks

extension [AvatarModel] {
  static var preview: [AvatarModel] {
    [
      AvatarModel(avatarId: "avatar_1", name: "Alpha", characterOption: .man, characterAction: .smiling, characterLocation: .park, profileImageUrl: Constants.randomImage, dateCreated: .now),
      AvatarModel(avatarId: "avatar_2", name: "Beta", characterOption: .woman, characterAction: .walking, characterLocation: .city, profileImageUrl: Constants.randomImage, dateCreated: .now),
      AvatarModel(avatarId: "avatar_3", name: "Gamma", characterOption: .alien, characterAction: .eating, characterLocation: .space, profileImageUrl: Constants.randomImage, dateCreated: .now),
      AvatarModel(avatarId: "avatar_4", name: "Delta", characterOption: .dog, characterAction: .sitting, characterLocation: .forest, profileImageUrl: Constants.randomImage, dateCreated: .now),
    ]
  }
}

extension AvatarModel {
  static var preview: AvatarModel {
    [AvatarModel].preview[0]
  }
}
