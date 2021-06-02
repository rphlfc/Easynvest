//
//  PinkShape.swift
//  Easynvest
//
//  Created by Raphael Cerqueira on 02/06/21.
//

import SwiftUI

struct PinkShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        return path
    }
}

struct PinkShape_Previews: PreviewProvider {
    static var previews: some View {
        PinkShape()
            .frame(height: 240)
    }
}
