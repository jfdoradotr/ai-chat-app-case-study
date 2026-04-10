//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
  @State private var imageURL = Constants.randomImage

  var body: some View {
    VStack {
      ImageLoaderView(url: imageURL)
        .ignoresSafeArea()

      VStack {
        VStack {
          Text("AI Chat 🤖")
            .font(.title)
            .bold()
          Text("SwiftyJourney.com")
            .font(.caption)
            .foregroundStyle(.secondary)
          NavigationLink {
            OnboardingCompletedView()
          } label: {
            Text("Get Started")
          }
          .buttonStyle(.primary)
          Button("Already have an account? Sign in.") {

          }
          Text("Terms of Service • Privacy Policy")
        }
        .frame(maxHeight: .infinity)
      }
      .padding(16)
    }
  }
}

#Preview {
  NavigationStack {
    WelcomeView()
  }
}
