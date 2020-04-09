//
//  ViewController.swift
//  Admob
//
//  Created by Mohamad El Bohsaly on 4/9/20.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    var banner: GADBannerView!
    var interstitial: GADInterstitial!
    var rewarded: GADRewardedAd!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //displays banner ad
        banner = GADBannerView(adSize: kGADAdSizeBanner)
        banner.adUnitID = "ca-app-pub-7142967589737903/2607835245"
        banner.rootViewController = self
        addBannerToView(banner)
        
        //displays 1 interstitial ad for 1-time-use
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-7142967589737903/5576779368")
        interstitial.load(GADRequest())
        
    }
    
    // MARK: Ads configuration (programmatically)
    
    func addBannerToView(_ bannerView: GADBannerView){
        bannerView.translatesAutoresizingMaskIntoConstraints = false //intrinsic content size to size the view
        view.addSubview(bannerView)
        view.addConstraints([NSLayoutConstraint(item: bannerView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
                             NSLayoutConstraint(item: bannerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
    }

    
    // MARK: Triggers that invoke changes upon pressing on a type

    @IBAction func bannerTriggered(_ sender: UIButton) {
        //properties placed and configured, then load ad
        banner.load(GADRequest())
    }
    
    @IBAction func interstitalTriggered(_ sender: UIButton) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad not ready to be displayed between app's flow")
        }
    }
    
    @IBAction func rewardedTriggered(_ sender: Any) {
        
    }
    
}

extension ViewController: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }
}

extension ViewController:GADInterstitialDelegate {
    //Tells the delegate that the interstitial ad has been dismissed
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        print("interstitial dismissed from view")
        
    }
    
    /// Tells the delegate an ad request succeeded.
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
      print("interstitialDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
      print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that an interstitial will be presented.
    func interstitialWillPresentScreen(_ ad: GADInterstitial) {
      print("interstitialWillPresentScreen")
    }

    /// Tells the delegate the interstitial is to be animated off the screen.
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
      print("interstitialWillDismissScreen")
    }

    /// Tells the delegate that a user click will open another app
    /// (such as the App Store), backgrounding the current app.
    func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
      print("interstitialWillLeaveApplication")
    }
}

