//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
  @State private var showSettingsView: Bool = false

  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
      .navigationTitle("Profile")
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button {
            showSettingsView = true
          } label: {
            Label("Settings", systemImage: "gear")
          }
        }
      }
  }
}

#Preview {
  NavigationStack {
    ProfileView()
  }
}
