//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    VStack {
      Text("Welcome!")
        .frame(maxHeight: .infinity)

      NavigationLink {
        Text("Onboarding Completed")
      } label: {
        Text("Get Started")
      }
      .buttonStyle(.primary)
    }
    .padding(16)
  }
}

#Preview {
  NavigationStack {
    WelcomeView()
  }
}
