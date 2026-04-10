//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
  private let url: URL?
  private let resizingMode: ContentMode

  init(
    url: URL? = URL(string: "https://picsum.photos/600/600"),
    resizingMode: ContentMode = .fill
  ) {
    self.url = url
    self.resizingMode = resizingMode
  }

  var body: some View {
    WebImage(url: url)
      .resizable()
      .indicator(.activity)
      .aspectRatio(contentMode: resizingMode)
  }
}

#Preview {
  ImageLoaderView()
    .frame(width: 100, height: 200)
}
