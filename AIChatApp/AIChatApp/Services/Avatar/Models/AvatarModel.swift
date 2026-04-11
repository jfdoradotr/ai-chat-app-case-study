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
}

enum CharacterOption {
  case man, woman, alien, dog, cat
}

enum CharacterAction {
  case smiling, sitting, eating, drinking, walking, shopping, studying, working, relaxing, fighting, crying
}

enum CharacterLocation {
  case park, mall, museum, city, desert, forest, space
}
