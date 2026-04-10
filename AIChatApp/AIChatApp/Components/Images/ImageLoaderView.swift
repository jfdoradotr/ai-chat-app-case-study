//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
  private let url: URL?
  private let resizingMode: ContentMode

  init(
    url: URL? = Constants.randomImage,
    resizingMode: ContentMode = .fill
  ) {
    self.url = url
    self.resizingMode = resizingMode
  }

  var body: some View {
    Rectangle()
      .opacity(0)
      .overlay(
        WebImage(url: url)
          .resizable()
          .indicator(.activity)
          .aspectRatio(contentMode: resizingMode)
          .allowsHitTesting(false)
      )
      .clipped()
  }
}

#Preview {
  ImageLoaderView()
    .frame(width: 100, height: 200)
}
