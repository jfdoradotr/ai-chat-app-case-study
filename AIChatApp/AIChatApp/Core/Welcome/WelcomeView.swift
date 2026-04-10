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
        Text("Welcome!")
          .frame(maxHeight: .infinity)

        NavigationLink {
          OnboardingCompletedView()
        } label: {
          Text("Get Started")
        }
        .buttonStyle(.primary)
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
