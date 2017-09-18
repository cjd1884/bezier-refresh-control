//
//  ViewController.swift
//  BezierRefreshControl
//
//  Created by Konstantinos Dimitros on 18/09/2017.
//  Copyright © 2017 cjd1884. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: BezierRefreshControl!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add pull-to-refresh bezier control
        self.refreshControl = BezierRefreshControl(inScrollView: self.tableView, withPath: createSampleFlamePath(), bindsScrollViewDelegate: true)
        self.refreshControl.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Sample bezier paths
    fileprivate func createSampleFlamePath() -> UIBezierPath {
        
        // Create the flame path - Code exported from PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 47.5, y: 7.5))
        bezierPath.addCurve(to: CGPoint(x: 51.5, y: 30.5), controlPoint1: CGPoint(x: 47.5, y: 7.5), controlPoint2: CGPoint(x: 55.26, y: 15.46))
        bezierPath.addCurve(to: CGPoint(x: 32.5, y: 72.5), controlPoint1: CGPoint(x: 44.5, y: 58.5), controlPoint2: CGPoint(x: 35.78, y: 57.35))
        bezierPath.addCurve(to: CGPoint(x: 59.5, y: 111.5), controlPoint1: CGPoint(x: 24.5, y: 109.5), controlPoint2: CGPoint(x: 59.5, y: 111.5))
        bezierPath.addCurve(to: CGPoint(x: 54.5, y: 90.5), controlPoint1: CGPoint(x: 59.5, y: 111.5), controlPoint2: CGPoint(x: 49.5, y: 101.5))
        bezierPath.addCurve(to: CGPoint(x: 62.5, y: 68.5), controlPoint1: CGPoint(x: 59.5, y: 79.5), controlPoint2: CGPoint(x: 62.5, y: 68.5))
        bezierPath.addCurve(to: CGPoint(x: 73.5, y: 94.5), controlPoint1: CGPoint(x: 62.5, y: 68.5), controlPoint2: CGPoint(x: 73, y: 81))
        bezierPath.addCurve(to: CGPoint(x: 69.5, y: 108.5), controlPoint1: CGPoint(x: 74, y: 108), controlPoint2: CGPoint(x: 69.5, y: 108.5))
        bezierPath.addCurve(to: CGPoint(x: 92.5, y: 63.5), controlPoint1: CGPoint(x: 69.5, y: 108.5), controlPoint2: CGPoint(x: 101.5, y: 100.5))
        bezierPath.addCurve(to: CGPoint(x: 47.5, y: 7.5), controlPoint1: CGPoint(x: 83.5, y: 26.5), controlPoint2: CGPoint(x: 47.5, y: 7.5))
        bezierPath.close()
        
        return bezierPath
    }
}

// MARK: - Extensions
extension UIViewController: BezierRefreshControlDelegate {
    func loadingDidStart(terminateLoading: @escaping () -> Void) {
        
        // Do some thread work (Data loading, API call, etc.)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { // 2 second delay
            // Terminate animation
            terminateLoading()
        }
        
    }
    
    func loadingDidCanceled() {
        // Do sth in case of user cancelation (e.g. cancel an HTTP request)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
