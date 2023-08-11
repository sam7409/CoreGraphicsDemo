import UIKit

class CustomView: UIView {

    override func draw(_ rect: CGRect) {
        // Call the drawing function
        drawRectangle()
    }

    func drawRectangle() {
        // Get the current context to draw into
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // Apply a translation to the context to move the rectangle
        let translationX: CGFloat = 100.0
        let translationY: CGFloat = 50.0
        context.translateBy(x: translationX, y: translationY)

        // Set the fill color (red in this case)
        context.setFillColor(UIColor.red.cgColor)

        // Set the border color (black in this case)
        context.setStrokeColor(UIColor.black.cgColor)

        // Set the border line width
        context.setLineWidth(2.0)

        // Create a rectangle with the specified dimensions
        let rectangle = CGRect(x: 0, y: 0, width: 200, height: 100)

        // Add the rectangle as a path to the context
        context.addRect(rectangle)

        // Fill and stroke the path (draw the rectangle)
        context.drawPath(using: .fillStroke)
    }
}
