//
//  KSAdInteractionType.h
//  Pods
//
//  Created by Dylan Sun on 2021/6/15.
//

typedef NS_ENUM(NSInteger, KSAdInteractionType) {
    KSAdInteractionType_Unknown,        //unknown type
    KSAdInteractionType_App,            //open downlaod page in app
    KSAdInteractionType_Web,            //open webpage in app
    KSAdInteractionType_DeepLink,       //open deeplink
    KSAdInteractionType_AppStore,       //open appstore
};

typedef NS_ENUM(NSInteger, KSAdMaterialType) {
    KSAdMaterialTypeUnkown      =       0,      // unknown
    KSAdMaterialTypeVideo       =       1,      // video
    KSAdMaterialTypeSingle      =       2,      // single image
    KSAdMaterialTypeAtlas       =       5,      // multiple image
};


