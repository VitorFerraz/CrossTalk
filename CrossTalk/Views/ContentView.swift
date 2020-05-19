//
//  ContentView.swift
//  CrossTalk
//
//  Created by Vitor Ferraz Varela on 19/05/20.
//  Copyright © 2020 vitor.ferrazvarela. All rights reserved.
//

import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject private var viewModel: ChatViewModel
    @State private var showActionSheet = false
    private let formatter = DateFormatter(dateStyle: .short, timeStyle: .short)
    var body: some View {
        NavigationView {
            VStack {
                ChatScrollView()
                    .navigationBarTitle(Text(viewModel.appState.rawValue), displayMode: .inline)
                
                ToolbarView(showActionSheet: $showActionSheet)
                    .padding()
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: viewModel.keyboardOffset)
                    .animation(.easeInOut(duration: viewModel.keyboardAnimationDuration))
            }
            .animation(.easeInOut)
            .onTapGesture {
                UIApplication.shared.windows.first(where: {$0.isKeyWindow})?.endEditing(true)
            }
        }.actionSheet(isPresented: $showActionSheet, content: {
            ActionSheet(title: Text(viewModel.actionSheetTitle), message: nil, buttons: actionSheetButtons())
        })
    }
    
    private func actionSheetButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        switch viewModel.appState {
        case .inactive:
            buttons += [
                .default(Text("Host Chat")){
                    self.viewModel.startAdvertising()
                },
                .default(Text("Join Chat"), action: {
                    self.viewModel.startBrowsing()
                })]
        default:
            buttons += [.default(Text("Disconnect"), action: {
                self.viewModel.disconnect()
            })]
        }
        buttons.append(.cancel())
        return buttons
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("iPhone 11 Pro Max")
            
            ContentView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
                .environment(\.colorScheme, .dark)
            
        }
    }
}
