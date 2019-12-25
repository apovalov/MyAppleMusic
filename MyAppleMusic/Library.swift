//
//  Library.swift
//  MyAppleMusic
//
//  Created by Macbook on 25.12.2019.
//  Copyright © 2019 Big Nerd Ranch. All rights reserved.
//

import SwiftUI
import URLImage

struct Library: View {
    var tracks = UserDefaults.standard.savedTracks()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack {
                        Button(action: {
                            print("12345")
                        }, label: {
                            Image(systemName: "play.fill")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                                .accentColor(Color.init(#colorLiteral(red: 0.9872928262, green: 0.1708706319, blue: 0.3288083076, alpha: 1) ))
                                .background(Color.init(#colorLiteral(red: 0.9599773288, green: 0.9494747519, blue: 0.9589639306, alpha: 1)))
                                .cornerRadius(10)
                        })
                        Button(action: {
                            print("12345")
                        }, label: {
                            Image(systemName: "arrow.2.circlepath")
                                .frame(width: geometry.size.width / 2 - 10, height: 50)
                        })
                            .accentColor(Color.init(#colorLiteral(red: 0.9872928262, green: 0.1708706319, blue: 0.3288083076, alpha: 1) ))
                            .background(Color.init(#colorLiteral(red: 0.9599773288, green: 0.9494747519, blue: 0.9589639306, alpha: 1)))
                            .cornerRadius(10)
                    }
                }.padding().frame(height: 50)
                
                Divider().padding(.leading).padding(.trailing)
                Spacer()
                
                List(tracks) { track in
                    LibraryCell(cell: track)
                }
            }
                
            .navigationBarTitle("Library")
        }
    }
}


struct LibraryCell: View {
    var cell: SearchViewModel.Cell
    
    var body: some View {
        HStack {
            //Image("SonhImage").resizable().frame(width: 60, height: 60).cornerRadius(2)
            URLImage(URL(string: cell.iconUrlString ?? "")!, content: {
                $0.image
                .resizable()
            }).frame(width: 60, height: 60).cornerRadius(2)
            VStack(alignment: .leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}


struct Library_Previews: PreviewProvider {
    static var previews: some View {
        Library()
    }
}
