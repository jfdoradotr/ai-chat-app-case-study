//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct OnboardingIntroView: View {
  var body: some View {
    VStack {
      Group {
        Text("Make your own ")
        +
        Text("avatars")
          .foregroundStyle(.accent)
          .fontWeight(.semibold)
        +
        Text(" and chat with them!\n\nHave ")
        +
        Text("real conversations")
          .foregroundStyle(.accent)
          .fontWeight(.semibold)
        +
        Text(" with AI generated responses.")
      }
      .baselineOffset(6)
      .frame(maxHeight: .infinity)
      .padding(24)

      NavigationLink {
        OnboardingCompletedView()
      } label: {
        Text("Continue")
      }
      .buttonStyle(.primary)
    }
    .padding(24)
    .font(.title3)
  }
}

#Preview {
  OnboardingIntroView()
}
