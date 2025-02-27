//
//  StatsFooterView.swift
//  Discussion_four
//
//  Created by Dylan Chhum on 2/27/25.
//

import SwiftUI

struct StatsFooterView: View {
    let activeCount: Int
    let completedCount: Int
    
    var body: some View {
        HStack {
            Text("\(activeCount) items left")
                .foregroundColor(.secondary)
            Spacer()
            Text("\(completedCount) completed")
                .foregroundColor(.secondary)
        }
        .font(.caption)
    }
}
#Preview {
    StatsFooterView(activeCount: 5, completedCount: 6)
}
