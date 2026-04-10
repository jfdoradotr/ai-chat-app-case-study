//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
  var url = URL(string: "https://picsum.photos/600/600")

  var body: some View {
    WebImage(url: url)
  }
}

#Preview {
  ImageLoaderView()
}
