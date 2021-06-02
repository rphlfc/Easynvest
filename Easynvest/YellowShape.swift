//
//  YellowShape.swift
//  Easynvest
//
//  Created by Raphael Cerqueira on 02/06/21.
//

import SwiftUI

struct YellowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        return path
    }
}

struct YellowShape_Previews: PreviewProvider {
    static var previews: some View {
        YellowShape()
            .frame(height: 340)
    }
}
