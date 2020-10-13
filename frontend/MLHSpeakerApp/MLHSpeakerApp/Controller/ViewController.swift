//
//  ViewController.swift
//  MLHSpeakerApp
//
//  Created by Mondale on 10/11/20.
//  Copyright © 2020 Mondale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


        var firstView: OnboardingPage!
        var secondView: OnboardingPage!
        var thirdView: OnboardingPage!
        
        var pagesArray: [OnboardingPage] = []
        
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            return scrollView
        }()

        let container: UIStackView = {
            let view = UIStackView()
            view.axis = .horizontal
            view.spacing = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            view.distribution = .fillEqually
            return view
        }()
        
        let pageControl: UIPageControl = {
            let pageControl = UIPageControl()
            pageControl.currentPage = 0
            pageControl.isUserInteractionEnabled = false
            pageControl.pageIndicatorTintColor = UIColor.systemGray
            pageControl.currentPageIndicatorTintColor = UIColor.white
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            return pageControl
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            setupScrollView()
            setViews()
            setPageControl()
            
        }

        func setupScrollView(){
            scrollView.delegate = self
            view.addSubview(scrollView)
            
            scrollView.addSubview(container)
            
            NSLayoutConstraint.activate([
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.topAnchor.constraint(equalTo: view.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                container.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                container.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                container.topAnchor.constraint(equalTo: scrollView.topAnchor),
                container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                container.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            ])
        }

        
        func setViews() {
            firstView = OnboardingPage(message:"Organize your conferences with ease", imageName:"book", isLastPage: false, color: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))
            secondView = OnboardingPage(message:"Connect with leading speakers across the globe", imageName:"connect", isLastPage: false, color: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
            thirdView = OnboardingPage(message:"Filter through speakers using our patent design", imageName:"filter", isLastPage: true, color: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1))
            
            pagesArray = [firstView,secondView,thirdView]
            
            for page in pagesArray{
                container.addArrangedSubview(page)
                page.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
            }
        }
        
        
        func setPageControl(){
            pageControl.numberOfPages = pagesArray.count
            view.addSubview(pageControl)
            NSLayoutConstraint.activate([
                pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                pageControl.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }



    extension ViewController: UIScrollViewDelegate {
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl.currentPage = Int(pageNumber)
        }
    }

