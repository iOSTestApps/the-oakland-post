//
//  EnlargedPhotoDelegate.swift
//  The Oakland Post
//
//  Created by Andrew Clissold on 7/23/14.
//  Copyright (c) 2014 Andrew Clissold. All rights reserved.
//

class EnlargedPhotoDelegate: NSObject, UIScrollViewDelegate {

    weak var delegator: PhotosViewController!

    init(delegator: PhotosViewController!) {
        self.delegator = delegator
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return delegator.enlargedPhoto!.imageView
    }

    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
        func showLinkButton() {
            if delegator.enlargedPhoto!.linkButton.alpha == 1 { return }
            
            UIView.animateWithDuration(0.15) {
                self.delegator.enlargedPhoto!.linkButton.alpha = 1
            }
        }
        
        func hideLinkButton() {
            if delegator.enlargedPhoto!.linkButton.alpha == 0 { return }
            
            UIView.animateWithDuration(0.15) {
                self.delegator.enlargedPhoto!.linkButton.alpha = 0
            }
        }

        if scale == 1.0 {
            showLinkButton()
        } else {
            hideLinkButton()
        }
    }
    
}