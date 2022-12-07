//
//  MainViewController.swift
//  Paper
//
//  Created by 선민재 on 2022/11/16.
//

import UIKit
import RxCocoa
import RxSwift
import Then
import SnapKit
import Lottie

class MainViewController: BaseViewController<MainViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.mainLogoImage()
        self.navigationItem.mainProfileImage()
        let blurEffect = UIBlurEffect(style: .regular)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = hotTextView.frame
//        visualEffectView.alpha = 30
        view.addSubview(visualEffectView)
//        carouselCollectionView.dataSource = self
//        carouselCollectionView.delegate = self
//        carouselCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func viewDidLayoutSubviews() {
        writeButton.glogGradient()
    }
    
    let mainLottie = LottieAnimationView(name: "SignUpEmoji").then {
        $0.loopMode = .loop
        $0.play()
    }
    
    let mainText = UILabel().then {
        $0.text = "너의 생각을 \n글로 표현해봐!"
        $0.font = UIFont.GlogFont(size: 40, family: .Bold)
        $0.textColor = .white
        $0.numberOfLines = 2
    }
    
    lazy var writeButton = UIButton().then {
        let text = NSAttributedString(string: "게시글 작성하러 가기")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor.black, for: .normal)
    }
    
    lazy var hotButton = UIButton().then {
        let text = NSAttributedString(string: "🔥 HOT'")
        $0.setAttributedTitle(text, for: .normal)
        $0.titleLabel?.font = UIFont.GlogFont(size: 18, family: .ExtraBold)
        $0.setTitleColor(UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1.0), for: .normal)
        $0.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.6)
        $0.layer.cornerRadius = 10
    }
    
//    let carouselCollectionView: UICollectionView = {
//
//        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.scrollDirection = .horizontal
//        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.backgroundColor = UIColor.red
//
//        return collectionView
//
//    }()
    
    let hotImage = UIImageView().then {
        $0.image = UIImage(named: "dummyImage.svg")
        $0.layer.cornerRadius = 10
    }
    
    let hotTextView = UIView().then {
        $0.backgroundColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 0.7)
        $0.layer.cornerRadius = 10
        $0.applyBlurEffect()
    }
    
    override func addView() {
        [mainLottie,mainText,writeButton,hotButton,hotImage,hotTextView].forEach {
            view.addSubview($0)
        }
    }

    override func setLayout() {
        mainLottie.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 6.59)
            $0.trailing.equalToSuperview().inset(13)
            $0.height.equalTo(134)
            $0.width.equalTo(134)
        }
        mainText.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset((bounds.height) / 5.7)
            $0.leading.equalToSuperview().offset(12)
        }
        writeButton.snp.makeConstraints {
            $0.top.equalTo(mainText.snp.bottom).offset(28)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        hotButton.snp.makeConstraints {
            $0.top.equalTo(writeButton.snp.bottom).offset((bounds.height) / 11.72)
            $0.leading.equalToSuperview().offset(12)
            $0.height.equalTo(42)
            $0.width.equalTo(90)
        }
//        carouselCollectionView.snp.makeConstraints {
//            $0.center.equalToSuperview()
//            $0.width.equalTo(300)
//            $0.height.equalTo(300)
//        }
        hotImage.snp.makeConstraints {
            $0.top.equalTo(hotButton.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(12)
        }
        hotTextView.snp.makeConstraints {
            $0.top.equalTo(hotImage.snp.bottom).inset(46)
            $0.centerX.equalTo(hotImage.snp.centerX).offset(0)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo((bounds.width) / 1.2)
            $0.height.equalTo((bounds.height) / 5.82)
        }
    }

}

//extension MainViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        cell.backgroundColor = UIColor.blue
//        return cell
//    }
//}
//
//extension MainViewController: UICollectionViewDelegate {
//
//}

extension UIView {
    func applyBlurEffect() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.7
        addSubview(blurEffectView)
    }
}
