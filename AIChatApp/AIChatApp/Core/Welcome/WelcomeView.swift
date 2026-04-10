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
      titleSection
        .padding(.top, 24)
      ctaButtons
        .padding(16)
      policyLinks
    }
  }

  private var titleSection: some View {
    VStack(spacing: 8) {
      Text("AI Chat 🤖")
        .font(.largeTitle)
        .fontWeight(.semibold)
      Text("Website @ SwiftyJourney.com")
        .font(.caption)
        .foregroundStyle(.secondary)
    }
  }

  private var ctaButtons: some View {
    VStack(spacing: 8) {
      NavigationLink {
        OnboardingCompletedView()
      } label: {
        Text("Get Started")
      }
      .buttonStyle(.primary)

      Text("Already have an account? Sign in!")
        .underline()
        .font(.body)
        .padding(8)
        .tappableBackground()
        .onTapGesture {
        }
    }
  }

  private var policyLinks: some View {
    HStack(spacing: 8) {
      Link(destination: Constants.termsOfServiceURL) {
        Text("Terms of Service")
      }
      Circle()
        .fill(.accent)
        .frame(width: 4, height: 4)
      Link(destination: Constants.privacyPolicyURL) {
        Text("Privacy Policy")
      }
    }
  }
}

#Preview {
  NavigationStack {
    WelcomeView()
  }
}
