//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ExploreView: View {
  let avatar = AvatarModel.preview

  var body: some View {
    HeroCellView(
      title: avatar.name,
      subtitle: avatar.name,
      imageUrl: avatar.profileImageUrl
    )
    .frame(height: 200)
    .navigationTitle("Explore")
  }
}

#Preview {
  NavigationStack {
    ExploreView()
  }
}
