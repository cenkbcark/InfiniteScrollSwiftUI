//
//  Home.swift
//  InfiniteScrollSwiftUI
//
//  Created by Cenk Bahadır Çark on 1.03.2024.
//

import SwiftUI

struct Home: View {
    ///Sample items
    @State private var items: [Item] = [.red, .blue, .green, .yellow, .black].compactMap({return .init(color: $0)})
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                GeometryReader {
                    let size = $0.size
                    LoopingScrollView(width: size.width, spacing: 0, items: items) { item in
                        RoundedRectangle(cornerRadius: 15)
                            .fill(item.color.gradient)
                            .padding(.horizontal, 15)
                            
                    }
                    .scrollTargetBehavior(.paging)
                }
                .frame(height: 220)
            }
            .padding(.vertical, 15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    Home()
}
