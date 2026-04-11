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
