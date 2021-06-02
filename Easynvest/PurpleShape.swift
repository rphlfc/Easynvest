//
//  PurpleShape.swift
//  Easynvest
//
//  Created by Raphael Cerqueira on 02/06/21.
//

import SwiftUI

struct PurpleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY * 0.75))
        return path
    }
}

struct PurpleShape_Previews: PreviewProvider {
    static var previews: some View {
        PurpleShape()
            .frame(height: 195)
    }
}
