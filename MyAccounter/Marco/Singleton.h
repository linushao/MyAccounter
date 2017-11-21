// .h
#define singleton_interface(class) + (instancetype)shared##class;

// .m
#define singleton_implementation(class) \
static class *_instance; \
\
static dispatch_once_t onceToken; \
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
    dispatch_once(&onceToken, ^{ \
        _instance = [super allocWithZone:zone]; \
    }); \
\
    return _instance; \
} \
\
+ (instancetype)shared##class \
{ \
    if (_instance == nil) { \
        _instance = [[class alloc] init]; \
    } \
\
    return _instance; \
}


/**
 方法二:
 1. 必须把static dispatch_once_t onceToken; 这个拿到函数体外,成为全局的.
 2.
 +(void)attempDealloc{
 onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
 [_instance release];
 _instance = nil;
 }
 
 作者：laughingkid
 链接：http://www.jianshu.com/p/08b134c481a9
 來源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
