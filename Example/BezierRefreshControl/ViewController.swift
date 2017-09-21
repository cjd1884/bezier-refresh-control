//
//  ViewController.swift
//  BezierRefreshControl
//
//  Created by k.dimitros@gmail.com on 09/21/2017.
//  Copyright (c) 2017 k.dimitros@gmail.com. All rights reserved.
//

import UIKit
import BezierRefreshControl

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
        
        // Aesthetic customisations
        //self.refreshControl.color = UIColor.red
        //self.refreshControl.lineWidth = 3.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Sample bezier paths
    fileprivate func createSampleFlamePath() -> UIBezierPath {
        
        // Create the flame path - Code exported from PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 16.5, y: -0.5))
        bezierPath.addCurve(to: CGPoint(x: 20.5, y: 22.5), controlPoint1: CGPoint(x: 16.5, y: -0.5), controlPoint2: CGPoint(x: 24.26, y: 7.46))
        bezierPath.addCurve(to: CGPoint(x: 1.5, y: 64.5), controlPoint1: CGPoint(x: 13.5, y: 50.5), controlPoint2: CGPoint(x: 4.78, y: 49.35))
        bezierPath.addCurve(to: CGPoint(x: 28.5, y: 103.5), controlPoint1: CGPoint(x: -6.5, y: 101.5), controlPoint2: CGPoint(x: 28.5, y: 103.5))
        bezierPath.addCurve(to: CGPoint(x: 23.5, y: 82.5), controlPoint1: CGPoint(x: 28.5, y: 103.5), controlPoint2: CGPoint(x: 18.5, y: 93.5))
        bezierPath.addCurve(to: CGPoint(x: 31.5, y: 60.5), controlPoint1: CGPoint(x: 28.5, y: 71.5), controlPoint2: CGPoint(x: 31.5, y: 60.5))
        bezierPath.addCurve(to: CGPoint(x: 42.5, y: 86.5), controlPoint1: CGPoint(x: 31.5, y: 60.5), controlPoint2: CGPoint(x: 42, y: 73))
        bezierPath.addCurve(to: CGPoint(x: 38.5, y: 100.5), controlPoint1: CGPoint(x: 43, y: 100), controlPoint2: CGPoint(x: 38.5, y: 100.5))
        bezierPath.addCurve(to: CGPoint(x: 61.5, y: 55.5), controlPoint1: CGPoint(x: 38.5, y: 100.5), controlPoint2: CGPoint(x: 70.5, y: 92.5))
        bezierPath.addCurve(to: CGPoint(x: 16.5, y: -0.5), controlPoint1: CGPoint(x: 52.5, y: 18.5), controlPoint2: CGPoint(x: 16.5, y: -0.5))
        bezierPath.close()
        
        return bezierPath
    }
    
    func createSampleCirclePath() -> UIBezierPath {
        
        // Create the path - Code exported from PaintCode
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: -0.5, y: 15.5))
        bezierPath.addCurve(to: CGPoint(x: 29.5, y: 0.5), controlPoint1: CGPoint(x: 10.5, y: -3.5), controlPoint2: CGPoint(x: 29.5, y: 0.5))
        bezierPath.addCurve(to: CGPoint(x: 60.5, y: 12.5), controlPoint1: CGPoint(x: 29.5, y: 0.5), controlPoint2: CGPoint(x: 60.5, y: 1.5))
        bezierPath.addCurve(to: CGPoint(x: 54.5, y: 59.5), controlPoint1: CGPoint(x: 60.5, y: 23.5), controlPoint2: CGPoint(x: 73.5, y: 36.5))
        bezierPath.addCurve(to: CGPoint(x: 9.5, y: 40.5), controlPoint1: CGPoint(x: 35.5, y: 82.5), controlPoint2: CGPoint(x: 1.5, y: 61.5))
        bezierPath.addCurve(to: CGPoint(x: 37.5, y: 5.5), controlPoint1: CGPoint(x: 17.5, y: 19.5), controlPoint2: CGPoint(x: 20.5, y: 10.5))
        bezierPath.addCurve(to: CGPoint(x: 51.5, y: 36.5), controlPoint1: CGPoint(x: 54.5, y: 0.5), controlPoint2: CGPoint(x: 59.5, y: 23.5))
        bezierPath.addCurve(to: CGPoint(x: 41.5, y: 62.5), controlPoint1: CGPoint(x: 43.5, y: 49.5), controlPoint2: CGPoint(x: 65.5, y: 49.5))
        bezierPath.addCurve(to: CGPoint(x: 29.5, y: 25.5), controlPoint1: CGPoint(x: 17.5, y: 75.5), controlPoint2: CGPoint(x: 17.5, y: 38.5))
        bezierPath.addCurve(to: CGPoint(x: 47.5, y: 19.5), controlPoint1: CGPoint(x: 41.5, y: 12.5), controlPoint2: CGPoint(x: 43.5, y: 13.5))
        bezierPath.addCurve(to: CGPoint(x: 47.5, y: 33.5), controlPoint1: CGPoint(x: 51.5, y: 25.5), controlPoint2: CGPoint(x: 53.5, y: 18.5))
        bezierPath.addCurve(to: CGPoint(x: 41.5, y: 48.5), controlPoint1: CGPoint(x: 41.5, y: 48.5), controlPoint2: CGPoint(x: 41.5, y: 48.5))
        bezierPath.addCurve(to: CGPoint(x: 33.5, y: 59.5), controlPoint1: CGPoint(x: 41.5, y: 48.5), controlPoint2: CGPoint(x: 42.5, y: 63.5))
        bezierPath.addCurve(to: CGPoint(x: 33.5, y: 33.5), controlPoint1: CGPoint(x: 24.5, y: 55.5), controlPoint2: CGPoint(x: 29.5, y: 41.5))
        bezierPath.addCurve(to: CGPoint(x: 41.5, y: 25.5), controlPoint1: CGPoint(x: 37.5, y: 25.5), controlPoint2: CGPoint(x: 41.5, y: 25.5))
        bezierPath.addCurve(to: CGPoint(x: 37.5, y: 51.5), controlPoint1: CGPoint(x: 41.5, y: 25.5), controlPoint2: CGPoint(x: 52.5, y: 14.5))
        
        return bezierPath
        
    }
}

// MARK: - Extensions
extension UIViewController: BezierRefreshControlDelegate {
    public func loadingDidStart(terminateLoading: @escaping () -> Void) {
        
        // Do some thread work (Data loading, API call, etc.)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { // 2 second delay
            // Terminate animation
            terminateLoading()
        }
        
    }
    
    public func loadingDidCanceled() {
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
