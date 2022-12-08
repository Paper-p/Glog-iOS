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
    
    let titleText = UILabel().then {
        $0.text = "유저 리서치(User Research)란?"
        $0.font = UIFont.GlogFont(size: 20, family: .SemiBold)
        $0.textColor = .white
    }
    
    let subtitleText = UILabel().then{
        $0.text = "일상에서 제품을 이해하고 사용하는데 영향을 미\n치는 사람의 행위와 동기, 니즈를 특정 맥락 안..."
        $0.font = UIFont.GlogFont(size: 16, family: .Medium)
        $0.textColor = UIColor(red: 133/255, green: 136/255, blue: 141/255, alpha: 1)
        $0.numberOfLines = 2
    }
    
    let heartLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "heartIcon.svg")
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: "90.9M"))
        $0.font = UIFont.GlogFont(size: 14, family: .Medium)
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.attributedText = attributedString
    }
    
    let viewLabel = UILabel().then {
        let attributedString = NSMutableAttributedString(string: "")
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(named: "viewIcon.svg")
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        attributedString.append(NSAttributedString(string: "90.9M"))
        $0.font = UIFont.GlogFont(size: 14, family: .Medium)
        $0.textColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
        $0.attributedText = attributedString
    }
    
    override func addView() {
        [mainLottie,mainText,writeButton,hotButton,hotImage,hotTextView,titleText,subtitleText
        , heartLabel, viewLabel].forEach {
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
        titleText.snp.makeConstraints {
            $0.top.equalTo(hotTextView.snp.top).offset(10)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        subtitleText.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset(4)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        heartLabel.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset((bounds.height) / 10.292)
            $0.leading.equalTo(hotTextView.snp.leading).offset(10)
        }
        viewLabel.snp.makeConstraints {
            $0.top.equalTo(titleText.snp.bottom).offset((bounds.height) / 10.292)
            $0.leading.equalTo(heartLabel.snp.leading).offset(8)
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
