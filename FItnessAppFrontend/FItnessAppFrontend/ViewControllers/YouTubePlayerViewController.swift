//
//  YouTubePlayerViewController.swift
//  FItnessAppFrontend
//
//  Created by Sudeshika Gunawardena on 2023-05-17.
//


import UIKit
import WebKit

class YouTubePlayerViewController: UIViewController {
    private var webView: WKWebView!
    private var videoURL: URL!

    init(videoURL: URL) {
        self.videoURL = videoURL
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }

    private func setupWebView() {
        webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.scrollView.isScrollEnabled = false  // Disable scrolling
        webView.navigationDelegate = self  // Set navigation delegate to handle YouTube video events
        view.addSubview(webView)

        let request = URLRequest(url: videoURL)
        webView.load(request)
    }
}

extension YouTubePlayerViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        // Check if the navigation action is a link that should be opened externally
        if let url = navigationAction.request.url, navigationAction.navigationType == .linkActivated {
            UIApplication.shared.open(url)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
}
