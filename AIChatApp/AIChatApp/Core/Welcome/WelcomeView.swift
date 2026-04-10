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
          .font(.headline)
          .foregroundStyle(.white)
          .frame(maxWidth: .infinity)
          .frame(height: 55)
          .background(.accent)
          .clipShape(.rect(cornerRadius: 16))
      }
    }
    .padding(16)
  }
}

#Preview {
  NavigationStack {
    WelcomeView()
  }
}
