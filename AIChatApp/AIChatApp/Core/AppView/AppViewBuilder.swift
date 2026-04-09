//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct AppViewBuilder<TabbarView: View, OnboardingView: View>: View {
  var showTabBar: Bool = false

  @ViewBuilder var tabBarView: TabbarView
  @ViewBuilder var onboardingView: OnboardingView

  var body: some View {
    ZStack {
      if showTabBar {
        tabBarView
          .transition(.move(edge: .trailing))
      } else {
        onboardingView
          .transition(.move(edge: .leading))
      }
    }
    .animation(.smooth, value: showTabBar)
  }
}

#Preview {
  @Previewable @State var showTabBar: Bool = false

  AppViewBuilder(
    showTabBar: showTabBar,
    tabBarView: {
      ZStack {
        Color.red.ignoresSafeArea()
        Text("TabBar")
      }
    },
    onboardingView: {
      ZStack {
        Color.blue.ignoresSafeArea()
        Text("Onboarding")
      }
    }
  )
  .onTapGesture {
    showTabBar.toggle()
  }
}
