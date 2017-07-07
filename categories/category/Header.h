//
//  Header.h
//  categories
//
//  Created by 贺心元 on 2017/7/4.
//  Copyright © 2017年 贺心元. All rights reserved.
//

#ifndef Header_h
#define Header_h

#define SCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define UIColorRGB(R,G,B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]


#define CategoryPath   [NSString stringWithFormat:@"Documents/Category.plist"]

#define ISHIDDEN_PATH [NSHomeDirectory() stringByAppendingPathComponent:CategoryPath]


#endif /* Header_h */
