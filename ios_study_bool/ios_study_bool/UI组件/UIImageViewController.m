//
//  UIImageViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/1/23.
//

#import "UIImageViewController.h"
#import "ScreenUtil.h"
@interface UIImageViewController ()
@property(nonatomic, strong, readwrite) UIImageView *imageView;
@property(nonatomic, strong, readwrite) UIScrollView *scollView;
@property(nonatomic, strong, readwrite) UIView *contentView;
@property(nonatomic, strong, readwrite) UIImageView* animateImgView;
@end

@implementation UIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _scollView = [[UIScrollView alloc] initWithFrame:[self.view bounds]];

    [self.view addSubview:_scollView];
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 2)];
    
    _scollView.contentSize = _contentView.frame.size;
    
    [_scollView addSubview:_contentView];
    
    [self buildViews];
    
}

- (void)tapImageView:(UITapGestureRecognizer*)sender {
    [_imageView setHighlighted:!_imageView.isHighlighted];
}

- (void)buildViews {
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400)];
        label.text = @"UIImageView 是 iOS 开发中用于展示图片的视图控件，继承自 UIView。可以通过 image 属性设置要展示的图片，也可以通过 highlightedImage 属性设置图片被高亮时要展示的图片。\n \
        除此之外，UIImageView 还有其他一些常用的属性和方法，例如：\n \
        contentMode：设置图片在 UIImageView 中的展示方式； \n \
        animationImages 和 animationDuration：设置多张图片进行动画播放； \n \
        startAnimating 和 stopAnimating：开始和停止动画播放； \n \
        isAnimating：判断当前是否正在播放动画； \n \
        imageWithContentsOfFile: 和 imageNamed:：从文件或 bundle 中加载图片等。\n \
";
        label.numberOfLines = 0;
        label.textColor = [UIColor grayColor];
        label;
    })];
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 370, self.view.frame.size.width, 90)];
        label.text = @"imgView.highlightedImage 设置后要[_imageView setHighlighted:!_imageView.isHighlighted]; 才会生效";
        label.font = [UIFont boldSystemFontOfSize:17];
        label.numberOfLines = 0;
        label;
    })];
    
    [self.contentView addSubview:({
            _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 460, 100, 100)];
            _imageView.backgroundColor = [UIColor yellowColor];
            _imageView.image = [UIImage imageNamed:@"圣诞叶"];
            _imageView.highlightedImage = [UIImage imageNamed:@"圣诞礼物"];
            
            _imageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
            [_imageView addGestureRecognizer:tapGes];
            _imageView;
    })];
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 560, self.view.frame.size.width, 30)];
        label.text = @"imgView.contentMode 设置图片的对齐方式";
        label.font = [UIFont boldSystemFontOfSize:17];
        label;
    })];
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 590, self.view.frame.size.width, 30)];
        label.text = @"ScaleToFill  ScaleAspectFit ScaleAspectFill ";
        label;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 620, 50, 50)];
            imgView.backgroundColor = [UIColor blackColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeScaleToFill;
            imgView;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 620, 50, 50)];
            imgView.backgroundColor = [UIColor blackColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView;
    })];
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 620, 50, 50)];
            imgView.backgroundColor = [UIColor blackColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeScaleAspectFill;
            imgView;
    })];
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 670, self.view.frame.size.width, 30)];
        label.text = @"Top Bottom Left Right";
        label;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 700, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeTop;
            imgView;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 700, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeBottom;
            imgView;
    })];

    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 700, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeLeft;
            imgView;
    })];
    
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(180, 700, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeRight;
            imgView;
    })];
    
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 760, self.view.frame.size.width, 30)];
        label.text = @"BottomLeft BottomRight TopLeft TopRight";
        label;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 790, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeBottomLeft;
            imgView;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 790, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeBottomRight;
            imgView;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(120, 790, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeTopLeft;
            imgView;
    })];
    
    [self.contentView addSubview:({
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(180, 790, 50, 50)];
            imgView.backgroundColor = [UIColor yellowColor];
            imgView.image = [UIImage imageNamed:@"size20"];
            imgView.contentMode = UIViewContentModeTopRight;
            imgView;
    })];
    
    [self.contentView addSubview:({
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 850, self.view.frame.size.width, 150)];
        label.text = @"imgView播放动画， \n \
         a. 设置 animationImages 和 animationDuration  \n  \
         b. 播放/停止动画 startAnimating 和 stopAnimating   \n  \
         c. 是否正在播放动画 isAnimating \
";
        label.numberOfLines = 0;
        label.font = [UIFont boldSystemFontOfSize:17];
        label;
    })];
    
    [self.contentView addSubview:({
        _animateImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 1040, 120, 120)];
        NSMutableArray<UIImage*> *animateImages = @[].mutableCopy;
        for (int i=1 ; i<25; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"animate%d", i]];
  
            if (image) {
                NSLog(@"image != nil");
                [animateImages addObject:image];
            } else {
                NSLog(@"image == nil");
            }
        }
        _animateImgView.backgroundColor = [UIColor blackColor];
        _animateImgView.animationImages = animateImages;
        _animateImgView.contentMode = UIViewContentModeCenter;
        [_animateImgView setAnimationDuration:4.0];
        _animateImgView;
    })];
    if (_animateImgView) {
        [_animateImgView startAnimating]; // 开始动画
    }

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
