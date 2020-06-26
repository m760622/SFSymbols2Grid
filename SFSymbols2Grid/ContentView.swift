// https://github.com/m760622/SFSymbols2Grid
//  ContentView.swift
//  SFSymbols2Grid
// m7606225@gmail.com
//  Created by Mohammed Abunada on 2020-06-27.
// https://github.com/m760622

import SwiftUI

private var colors: [Color] = [.red, .blue, .secondary, .gray, .green, .yellow, .orange, .pink, .purple]

struct ContentView: View {
    let columns = [ GridItem(.adaptive(minimum: 50)) ]

    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(sfSymbols2, id: \.self){item in
                            NavigationLink(destination: SFSymbolsImage(imageName: item, detailView: true) )
                            {
                                SFSymbolsImage(imageName: item, detailView: false)
                            }//NavigationLink
                        }
                    }//LazyVGrid
                }//ScrollView
                .padding(.all, 10)
            }//VStack
            .navigationBarTitle(Text("New SF Symbols 2 Grid in SwiftUI 2") , displayMode: .inline)
        }//NavigationView
    }//body
}//ContentView

struct SFSymbolsImage: View {
    var imageName: String
    var detailView: Bool
    var body: some View {
        VStack {
            if detailView{
                Text(imageName)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .foregroundColor(colors.randomElement())
                    .padding(.all, 10 )
            }
            Image(systemName: imageName)
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .frame(width: detailView ? 300 : 50, height: detailView ? 300 : 50, alignment: .center)
                .foregroundColor(colors.randomElement())
                .padding(.all, 10)
        }//HStack
    }//body
}//SFSymbolsImage

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
