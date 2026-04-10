//
//  Copyright © Juan Francisco Dorado Torres. All rights reserved.
//

import SwiftUI

struct ImageLoaderView: View {
  let url: URL?

  var body: some View {
    Rectangle()
      .opacity(0)
      .overlay { content }
      .clipped()
      .aspectRatio(1, contentMode: .fit)
  }

  @ViewBuilder
  private var content: some View {
    if let url {
      CachedImageView(url: url)
    } else {
      placeholder
    }
  }

  private var placeholder: some View {
    ZStack {
      Rectangle()
        .fill(.gray.opacity(0.3))
      Image(systemName: "photo")
        .font(.largeTitle)
        .foregroundStyle(.gray)
    }
  }
}

private struct CachedImageView: View {
  let url: URL

  @State private var image: Image?
  @State private var isLoading = true
  @State private var didFail = false

  var body: some View {
    ZStack {
      if let image {
        image
          .resizable()
          .scaledToFill()
      } else if isLoading {
        ProgressView()
      } else {
        failurePlaceholder
      }
    }
    .task(id: url) {
      await loadImage()
    }
  }

  private var failurePlaceholder: some View {
    ZStack {
      Rectangle()
        .fill(.gray.opacity(0.3))
      Image(systemName: "photo")
        .font(.largeTitle)
        .foregroundStyle(.gray)
    }
  }

  private func loadImage() async {
    isLoading = true
    didFail = false

    // Check cache first
    if let cached = await ImageCache.shared.image(for: url) {
      image = cached
      isLoading = false
      return
    }

    // Download
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      guard let uiImage = UIImage(data: data) else {
        didFail = true
        isLoading = false
        return
      }
      await ImageCache.shared.store(data, for: url)
      image = Image(uiImage: uiImage)
    } catch {
      didFail = true
    }

    isLoading = false
  }
}

#Preview("With URL") {
  ImageLoaderView(url: URL(string: "https://picsum.photos/600/600"))
    .padding()
}

#Preview("No URL") {
  ImageLoaderView(url: nil)
    .padding()
}
