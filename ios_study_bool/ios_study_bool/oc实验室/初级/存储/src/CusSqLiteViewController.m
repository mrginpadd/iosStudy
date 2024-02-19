//
//  CusSqLiteViewController.m
//  ios_study_bool
//
//  Created by xushihao on 2024/2/19.
//

#import "CusSqLiteViewController.h"
#import "IntroductionViewController.h"
#import <sqlite3.h>
#import "ToastUtil.h"
@interface CusSqLiteViewController ()<IntroductionViewControllerDelegate>
@property(nonatomic, assign, readwrite) sqlite3 *database;
@end

@implementation CusSqLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IntroductionViewController *vc = [[IntroductionViewController alloc] init];
    [self addChildViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    vc.delegate = self;
    
    vc.introTitleLabel.text = @"SQLite介绍";
    vc.introContentLabel.text = @"\n \
    SQLite 是一个轻量级的数据库引擎，它在许多应用程序中被广泛使用，特别是在移动应用和嵌入式系统中。\n \
    SQLite 是一个开源的关系型数据库管理系统，它支持大部分 SQL 标准。\n \
    SQLite 是一个嵌入式数据库引擎，不需要独立的服务器进程。\n \
    SQLite 数据库存储在单个磁盘文件中，便于管理和传输。\n \
    ";
    
    vc.attributeContentLabel.text = @"\n \
    SQLITE_OPEN_READWRITE：打开数据库以进行读写操作。\n \
    SQLITE_OPEN_READONLY：只读方式打开数据库，不能对数据库进行写操作。\n \
    SQLITE_OPEN_CREATE：如果数据库文件不存在，创建一个新的数据库文件。\n \
    SQLITE_OPEN_FULLMUTEX：启用多线程模式，所有数据库连接都是互斥的。\n \
    SQLITE_OPEN_SHAREDCACHE：启用共享缓存模式，多个连接可以共享一个缓存。\n \
    SQLITE_OPEN_PRIVATECACHE：禁用共享缓存模式，每个连接都有自己的私有缓存。\n \
    SQLITE_CONFIG_SERIALIZED：设置数据库为串行化模式，保证同一时刻只有一个线程访问数据库。\n \
    SQLITE_CONFIG_MULTITHREAD：设置数据库为多线程模式，允许多个线程同时访问数据库。\n \
    ";
    
    vc.applicationContentLabel.text = @" \n \
    移动应用开发：在 iOS 和 Android 开发中广泛使用 SQLite 存储本地数据。 \n \
    嵌入式系统：由于其轻量级特点，适合嵌入式设备中的数据存储。 \n \
    小型项目：对于小规模的数据存储需求，SQLite 是一个简单有效的选择。 \n \
    测试和原型开发：在开发阶段快速搭建本地数据库进行测试和原型验证。 \n \
    ";
    
    vc.useStepContentLabel.text = @" \n \
    注意每次执行数据库操作前，需要连接数据库，操作结束后关闭连接 \n \
    1.创建数据库  \n \
    sqlite3_open([dbPath UTF8String], &database);  \n \
    2.创建数据表 \n \
    NSString *createTableSQL = @\"CREATE TABLE IF NOT EXISTS Users (ID INTEGER PRIMARY KEY, Name TEXT, Age INTEGER)\";   \n \
    int res = sqlite3_exec(self.database, [createTableSQL UTF8String], NULL, NULL, NULL);  \n \
    3.插入数据 \n \
    NSString *insertSQL = @\"INSERT INTO Users (Name, Age) VALUES ('Alice', 25)\"; \n \
    int res = sqlite3_exec(self.database, [insertSQL UTF8String], NULL, NULL, NULL); \n \
    4.删除数据 \n \
    NSString *deleteSQL = @\"DELETE FROM Users WHERE Name = 'Alice' AND Age = 25\"; \n \
    int res = sqlite3_exec(self.database, [deleteSQL UTF8String], NULL, NULL, NULL); \n \
    5.查询数据 \n \
        NSString *selectSQL = @\"SELECT * FROM Users WHERE Name = 'Alice' AND Age = 25\"; \n \
        sqlite3_stmt *statement;\n \
        if (sqlite3_prepare_v2(self.database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {\n \
            // 遍历查询结果\n \
            while (sqlite3_step(statement) == SQLITE_ROW) {\n \
                // 获取结果字段值\n \
                NSString *name = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];\n \
                int age = sqlite3_column_int(statement, 1);\n \
                    \n \
                // 处理结果\n \
                completion([NSString stringWithFormat:@\"Name: %@, Age: %d\", name, age]);\n \
            }\n \
    \n \
            // 释放资源\n \
            sqlite3_finalize(statement);\n \
        } else {\n \
            completion([NSString stringWithFormat:@\"Failed to prepare statement: %s\",\n \ sqlite3_errmsg(self.database)]);\n \
        }\n \
    ";
    [vc setUseStepTipBtns:@[@"创建/连接数据库", @"创建表", @"插入数据", @"删除数据", @"查询数据"]];
}

- (void)buttonClickedWithTitle:(NSString *)title {
    if ([title isEqualToString:@"创建/连接数据库"]) {
        [self createOrConnectDataBase:^(BOOL isSuccess) {
            [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"创建数据库成功": @"创建数据库失败"]];
        }];
    } else if([title isEqualToString:@"创建表"]) {
        [self createTable:^(BOOL isSuccess) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"创建数据表成功": @"创建数据表失败"]];
        }];
    } else if([title isEqualToString:@"插入数据"]) {
        [self insertData:^(BOOL isSuccess) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"插入数据成功": @"插入数据失败"]];
        }];
    } else if([title isEqualToString:@"删除数据"]) {
        [self deleteData:^(BOOL isSuccess) {
           [ToastUtil showToastCenter:[NSString stringWithFormat:@"%@", isSuccess ? @"删除数据成功": @"删除数据失败"]];
        }];
    } else if([title isEqualToString:@"查询数据"]) {
        [self queryData:^(NSString *content) {
           [ToastUtil showToastCenter:content];
        }];
    }
}

- (void)createOrConnectDataBase:(void(^)(BOOL isSuccess))completion {
    sqlite3 *database;
    //数据库文件路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"test.sqlite"];
    int res = sqlite3_open([dbPath UTF8String], &database);
    _database = database;
    if (completion) {
        completion(res == SQLITE_OK);
    }
}

- (void)disconnectDataBase {
    sqlite3_close(self.database);
}

- (void)createTable:(void(^)(BOOL isSuccess))completion {
    [self createOrConnectDataBase:nil];
    
    // 创建表
    NSString *createTableSQL = @"CREATE TABLE IF NOT EXISTS Users (ID INTEGER PRIMARY KEY, Name TEXT, Age INTEGER)";
    int res = sqlite3_exec(self.database, [createTableSQL UTF8String], NULL, NULL, NULL);
 
    if (completion) {
        completion(res == SQLITE_OK);
    }
    [self disconnectDataBase];
}

- (void)insertData:(void(^)(BOOL isSuccess))completion {
    [self createOrConnectDataBase: nil];
    
    NSString *insertSQL = @"INSERT INTO Users (Name, Age) VALUES ('Alice', 25)";
    int res = sqlite3_exec(self.database, [insertSQL UTF8String], NULL, NULL, NULL);
    // 关闭数据库连接
    sqlite3_close(self.database);
    completion(res == SQLITE_OK);
    
    [self disconnectDataBase];
}

- (void)deleteData:(void(^)(BOOL isSuccess))completion {
    [self createOrConnectDataBase: nil];
    
    NSString *deleteSQL = @"DELETE FROM Users WHERE Name = 'Alice' AND Age = 25";
    int res = sqlite3_exec(self.database, [deleteSQL UTF8String], NULL, NULL, NULL);
    // 关闭数据库连接
    sqlite3_close(self.database);
    completion(res == SQLITE_OK);
    
    [self disconnectDataBase];
}

- (void)queryData:(void(^)(NSString *content))completion {
    [self createOrConnectDataBase:nil];
    
    NSString *selectSQL = @"SELECT * FROM Users WHERE Name = 'Alice' AND Age = 25";
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(self.database, [selectSQL UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        // 遍历查询结果
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // 获取结果字段值
            NSString *name = [[NSString alloc] initWithUTF8String:(const char *)sqlite3_column_text(statement, 0)];
            int age = sqlite3_column_int(statement, 1);
            
            // 处理结果
            completion([NSString stringWithFormat:@"Name: %@, Age: %d", name, age]);
        }
        
        // 释放资源
        sqlite3_finalize(statement);
    } else {
        completion([NSString stringWithFormat:@"Failed to prepare statement: %s", sqlite3_errmsg(self.database)]);
    }
    
    [self disconnectDataBase];
}

@end
