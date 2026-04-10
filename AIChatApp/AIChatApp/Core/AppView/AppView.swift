//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct AppView: View {
  @AppStorage("showTabBarView") private var showTabBar: Bool = false

  var body: some View {
    AppViewBuilder(
      showTabBar: showTabBar,
      tabBarView: {
        TabBarView()
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
}

#Preview {
  AppView()
}
