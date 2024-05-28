//
//  CardView.swift
//  FlashZilla
//
//  Created by Robert Bates on 5/28/24.
//

import SwiftUI

struct CardView: View {
    @State private var isShowingAnswer = false
    let card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.white)
                .shadow(radius: 10)
            VStack {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                if(isShowingAnswer) {
                    Spacer()
                    Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                    Spacer()
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
