//
//  AnnotationView.swift
//  Week7SwiftUIMapKitBhushansVersion
//
//  Created by Payam Karbassi on 10/05/2023.
//

import SwiftUI

struct AnnotationView: View {
    var title : String
    var body: some View {
        VStack{
            Text(title)
                .font(.callout)
                .padding(5)
                .background(.white)
                .cornerRadius(5)
            
//            Image(systemName: "mappin.circle.fill")
//                .font(.title)
//                .foregroundColor(.red)
            
            AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg")) { image in
                image.resizable()
                    .frame(width: 50, height: 50, alignment: .center).cornerRadius(25)
            } placeholder: {
                Text("")
            }

            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption2)
                .foregroundColor(.red)
                .offset(x: 0, y: -3)
                
        }
    }
}

struct AnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationView(title: "Hello")
    }
}
