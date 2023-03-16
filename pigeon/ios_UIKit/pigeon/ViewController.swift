//
//  ViewController.swift
//  pigeon
//
//  Created by 長崎 晋士 on 2023/03/10.
//

import UIKit
import Flutter

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    // Make a button to call the showFlutter function when pressed.
    let button = UIButton(type:UIButton.ButtonType.custom)
    button.addTarget(self, action: #selector(showFlutter), for: .touchUpInside)
    button.setTitle("Show Flutter!", for: UIControl.State.normal)
    button.frame = CGRect(x: 80.0, y: 210.0, width: 160.0, height: 40.0)
    button.backgroundColor = UIColor.blue
    self.view.addSubview(button)
  }

  @objc func showFlutter() {
    let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
    let flutterViewController =
        FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

    let api: FlutterParamApi!
    api = FlutterParamApi.init(binaryMessenger: flutterEngine.binaryMessenger)

    let paramColor = ParamColor(a: 230, r: 0, g: 200, b: 160)

    var base64String: String = ""
    if let image = UIImage(named: "usa") {
      if let imageData = image.pngData() {
          base64String = imageData.base64EncodedString()
      }
    }
  
    api.setParams(param: Param(str: "success", num: 100, color: paramColor, image: base64String), completion: {})

    present(flutterViewController, animated: true, completion: nil)
  }
}
