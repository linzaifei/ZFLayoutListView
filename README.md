# ZFLayoutListView

### 最近项目中遇到很多需要输入的ListView 30-40 界面需要两三天完成 所以想到使用plist存储数据 用来快速布局 （各种显示listView 和个人中心等）

##### 你想要什么cell 必须需要添加type  默认可以输入
```
typedef NS_ENUM(NSInteger,ZFShowType){
    ZFShowTypeInput = 0,//可以输入一行
    ZFShowTypeSwitch,//按钮
    ZFShowTypeInputMore,//输入多行
};
```

##### 1.如果需要自定义可以继承于 ZFBaseTableView 即可

###### 1.1 普通界面布局
 
 ```
 plist 文件 配置只需要添加 title 和 text 属性就行
 /** 标题 */
@property(copy,nonatomic)NSString *title;
/** textfield 内容 */
@property(copy,nonatomic)NSString *text;

 ```
 ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.08.png)
 
 ###### 1.1 title标题代图片的 或是 需要添加标记的
 
 ```
 plist 文件 配置只需要添加 title 和 text  titleImg属性就行
 /** 图片+标题 */
@property(copy,nonatomic)NSString *titleImg;
 /** 标题 */
@property(copy,nonatomic)NSString *title;
/** textfield 内容 */
@property(copy,nonatomic)NSString *text;

 ```

下面是左边有图片 有标记的
 ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.23.png)
 ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.34.png)
 
 当plist文件中不配置text属性 分组 有尾试图 等 
 其中尾试图可以自己根据继承于ZFBaseTableView 修改成自己想要的样式等
 
 ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.37.png)
  ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.40.png)
   ![image](https://github.com/linzaifei/ZFLayoutListView/blob/master/layoutImages/Simulator%20Screen%20Shot%20-%20iPhone%20X%20-%202017-12-22%20at%2013.54.43.png)


 ###### 1.2 如果需要可以输单行输入需要修改canEdit 这个属性变成YES
 


 
 
 
 





```
/** 判断cell 后面显示内容 输入框 按钮 等*/
@property(assign,nonatomic)ZFShowType type;

/**------- 下面是属性是对于标题的 ------------ */
/** 图片+标题 */
@property(copy,nonatomic)NSString *titleImg;
/** 标题 */
@property(copy,nonatomic)NSString *title;
/** 是否需要标记 * 默认NO */
@property(assign,nonatomic)BOOL canTag;

/**------- 下面是属性是对于单输入框的 ------------ */
/** textfield placeholder */
@property(copy,nonatomic)NSString *placeholder;
/** textfield 限制输入多少字数 默认不限制输入*/
@property(assign,nonatomic)NSInteger limitLength;
/** textfield 内容 */
@property(copy,nonatomic)NSString *text;
/** 可不可以编辑 默认 NO  */
@property(assign,nonatomic)BOOL canEdit;
/** 是否隐藏箭头 默认 NO*/
@property(assign,nonatomic)BOOL canHiddenBack;
/** 键盘类型 1 数字键盘 2 身份证 3 */
@property(strong,nonatomic)NSNumber *isBord;
/** 键盘类型 */
@property(nonatomic) UIKeyboardType keyboardType;
/** 判断输入的提交时候可不可以为空 */
@property(assign,nonatomic)BOOL canEmpty;
/**------- 下面是属性是对于开关的 ------------ */
/** 进入默认开启还是关闭 */
@property(assign,nonatomic)BOOL on;

/**------- 用于多层次列表数据传输 ------------ */

/** dataArr 用来存储model 数据类型 */
@property(strong,nonatomic)NSArray *dataArr;
/** parmas 用来存储对应数据的键值对 */
@property(strong,nonatomic)NSDictionary *parmas;

```
