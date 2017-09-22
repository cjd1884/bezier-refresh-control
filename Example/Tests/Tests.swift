// https://github.com/Quick/Quick

import Quick
import Nimble
import BezierRefreshControl

class BezierRefreshControlSpec: QuickSpec {
    override func spec() {
        describe("Testing size") {

            it("calculating layer total height") {
                let topOffset: CGFloat = 0.0
                let shapeLayerHeight: CGFloat = 50.0
                let verticalPadding: CGFloat = 10.0
                let result = BezierRefreshControlSizing.calculateLayerTotalHeight(topOffset: topOffset, shapeLayerHeight: shapeLayerHeight, verticalPadding: verticalPadding)
                expect(result) == 70.0
            }
            
            it("calculating layer bounds offset x") {
                let viewWidth: CGFloat = 375
                let shapeLayerWidth: CGFloat = 30.1849403304917
                let result = BezierRefreshControlSizing.calculateLayerBoundsOffsetX(viewWidth: viewWidth, shapeLayerWidth: shapeLayerWidth)
                expect(result.rounded()) == -172.0
            }
            
            it("calculating layer bounds offset y") {
                let shapeLayerTotalHeight: CGFloat = 70.0
                let shapeLayerHeight: CGFloat = 50.0
                let result = BezierRefreshControlSizing.calculateLayerBoundsOffsetY(shapeLayerTotalHeight: shapeLayerTotalHeight, shapeLayerHeight: shapeLayerHeight)
                expect(result) == 60.0
            }
        }
    }
}
