//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.headline)
      .foregroundStyle(.white)
      .frame(maxWidth: .infinity)
      .frame(height: 55)
      .background(.accent)
      .clipShape(.rect(cornerRadius: 16))
      .opacity(configuration.isPressed ? 0.8 : 1.0)
  }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
  static var primary: PrimaryButtonStyle { PrimaryButtonStyle() }
}
