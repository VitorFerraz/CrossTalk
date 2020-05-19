//
//  ChatScrollView.swift
//  CrossTalk
//
//  Created by Vitor Ferraz Varela on 19/05/20.
//  Copyright © 2020 vitor.ferrazvarela. All rights reserved.
//

import SwiftUI

struct ChatScrollView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.messages) { message  in
                    MessageView(message: message)
                }
            }
        }
    }
}

struct ChatScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScrollView()
    }
}
