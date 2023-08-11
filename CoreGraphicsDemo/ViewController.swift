import UIKit

enum ShapeType {
    case rectangle
    case ellipse
    // Add more shape types as needed
}

class ViewController: UIViewController {

    @IBOutlet weak var shapeView: UIView!
    var selectedShape: ShapeType = .rectangle // Default shape is rectangle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Draw the default shape
        drawShape(shapeType: selectedShape, on: shapeView)
    }

    func drawShape(shapeType: ShapeType, on view: UIView) {
        UIGraphicsBeginImageContext(view.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        switch shapeType {
        case .rectangle:
            // Draw rectangle
            context.setStrokeColor(UIColor.red.cgColor)
            context.setLineWidth(2.0)
            // Set the drawing properties for fill
            context.setFillColor(UIColor.blue.cgColor) // Set the fill color
            context.stroke(shapeView.bounds)
        case .ellipse:
            // Draw ellipse
            context.setStrokeColor(UIColor.blue.cgColor)
            context.setLineWidth(2.0)
            context.strokeEllipse(in: shapeView.bounds)
        // Add more cases for other shapes if needed
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        view.layer.contents = image?.cgImage
    }
}
