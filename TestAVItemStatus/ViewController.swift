//
//  ViewController.swift
//  TestAVItemStatus
//
//  Created by Guillaume Sabran on 4/6/17.
//  Copyright © 2017 PaperoInc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {


	@IBOutlet weak var label: UILabel!
	var player: AVPlayer!
	var item: AVPlayerItem!

	override func viewDidLoad() {
		super.viewDidLoad()

		item = AVPlayerItem(url: URL(fileURLWithPath: Bundle.main.path(forResource: "video", ofType: "mp4")!))
		player = AVPlayer(playerItem: item)
		player.play()


		item.addObserver(
			self,
			forKeyPath: #keyPath(AVPlayerItem.status),
			options: [.initial, .old, .new],
			context: nil)

		if player.currentItem?.status == .readyToPlay {
			videoDidLoad()
		}
	}

	func videoDidLoad() {
		label.text = "video ready"
	}

	override func observeValue(forKeyPath keyPath: String?,
	                           of object: Any?,
	                           change: [NSKeyValueChangeKey : Any]?,
	                           context: UnsafeMutableRawPointer?) {

		guard let item = object as? AVPlayerItem
			else { return }

		if item.status == .readyToPlay {
			DispatchQueue.main.async {
				self.videoDidLoad()
			}
		}
	}
}

