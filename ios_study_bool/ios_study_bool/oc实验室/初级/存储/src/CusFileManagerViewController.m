//
//  CusFileManagerViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/17.
//

#import "CusFileManagerViewController.h"
#import "IntroductionViewController.h"
#import "ToastUtil.h"
@interface CusFileManagerViewController ()<IntroductionViewControllerDelegate>

@end

@implementation CusFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"NSFileManager文件存储介绍";
    vc.introContentLabel.text = @"\n \
    NSFileManager 是 Cocoa 框架中的一个类，用于在文件系统中执行文件和目录管理任务。 \n \
    它提供了许多方法来创建、复制、移动、删除文件或目录，以及检查文件属性等功能。 \n \
    ";
    
    vc.attributeContentLabel.text = @" \n \
    属性 \n \
    currentDirectoryPath: 获取当前工作目录路径。 \n \
    fileSystemRepresentation: 获取文件系统表示形式，用于 C 语言 API。 \n \
    delegate: 设置 NSFileManager 对象的代理对象。 \n \
    \n \
    方法 \n \
    fileExistsAtPath:isDirectory:: 检查指定路径的文件是否存在，并判断是文件还是目录。 \n \
    createFileAtPath:contents:attributes:: 创建文件并写入内容。 \n \
    copyItemAtPath:toPath:error:: 复制文件或目录到指定路径。 \n \
    moveItemAtPath:toPath:error:: 移动文件或目录到指定路径。 \n \
    removeItemAtPath:error:: 删除文件或目录。 \n \
    ";
    [vc setAttributeTipBtns:@[@"当前目录"]];
    
    
    vc.applicationContentLabel.text = @" \n \
    读取、写入或操作文件系统中的文件和目录。\n \
    创建临时文件或缓存文件。\n \
    管理应用程序的文件存储。\n \
    备份或还原用户数据。\n \
    ";
    [vc setApplicationTipBtns:@[@"创建文件", @"写入文件", @"读取内容", @"文件存在", @"删除文件"]];
    
    vc.useStepContentLabel.text = @" \n \
    1.获取[NSFileManager defaultManager]单例  \n \
    2.文件路径 @\"/xx/xx.txt\" \n \
    3.文件内容 @\"xxx\"  \n \
    4.创建文件 [fileManager createFileAtPath:xx] \n \
    ";
    
    
 
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"当前目录"]) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *currentDir = [fileManager currentDirectoryPath];
        [ToastUtil showToastCenter:[NSString stringWithFormat:@"currentDirectoryPath：%@  ", currentDir]];
    } else if([title isEqualToString:@"创建文件"]) {
        [self createFile:^(BOOL isSuccess) {
            [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"创建成功": @"创建失败"]];
        }];
    } else if([title isEqualToString:@"写入文件"]) {
        [self writeContentToFile:^(BOOL isSuccess) {
           [ToastUtil showToastCenter:isSuccess ? @"写入成功" : @"写入失败"];
        }];
    } else if([title isEqualToString:@"读取内容"]) {
        [self readContentFromFile:^(NSString *fileContent) {
           [ToastUtil showToastCenter:fileContent == nil ? @"没读取到" : fileContent];
        }];
    } else if([title isEqualToString:@"文件存在"]) {
        [self isFileExist:^(BOOL isExist) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isExist ? @"true": @"false"]];
        }];
    } else if([title isEqualToString:@"删除文件"]) {
        [self deleteFile:^(BOOL isSuccess) {
            [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"删除成功": @"删除失败"]];
        }];
    }
}

// 获取沙盒目录
- (NSString *)getShaBoxDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

//创建文件
- (void)createFile:(void (^)(BOOL isSuccess))completion {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docDir = [self getShaBoxDir];

    NSString *filePath = [docDir stringByAppendingPathComponent: @"test.txt"];
    
    BOOL isSuccess = [fileManager createFileAtPath:filePath contents:nil attributes:nil];
    if(completion != nil) {
      completion(isSuccess);
    }
}

//写入文件
- (void)writeContentToFile:(void(^)(BOOL isSuccess))completion {
    NSString *docDir = [self getShaBoxDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"test.txt"];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    if (fileHandle) {
        [fileHandle seekToEndOfFile]; //定位到文件末尾
        NSString *fileContent = @"我是写入文件的内容 \n";
        NSData *data = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
        [fileHandle writeData:data]; //写入数据
        [fileHandle closeFile]; //关闭文件
        if (completion != nil) {
            completion(YES);
        }
    } else {
        if (completion != nil) {
            completion(NO);
        }
    }
}


//读取文件内容
- (void)readContentFromFile:(void(^)(NSString* fileContent))completion {
    NSString *docDir = [self getShaBoxDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"test.txt"];
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    if(completion != nil) {
      completion(fileContent);
    }
}

//文件存在
- (void)isFileExist:(void(^)(BOOL isExist))completion {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *docDir = [self getShaBoxDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"test.txt"];
    
    BOOL isExist = [fileManager fileExistsAtPath:filePath];
    if (completion != nil) {
        completion(isExist);
    }
}

//删除文件
- (void)deleteFile:(void(^)(BOOL isSuccess))completion {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //获取沙盒目录
    NSString *docDir = [self getShaBoxDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:@"test.txt"];
    
    BOOL isSuccess = [fileManager removeItemAtPath:filePath error:nil];
    if (completion != nil) {
      completion(isSuccess);
    }
}
@end
