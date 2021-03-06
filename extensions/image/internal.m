#import <Appkit/NSImage.h>
#import <LuaSkin/LuaSkin.h>
#import <ASCIImage/PARImage+ASCIIInput.h>
#import "../hammerspoon.h"

#define USERDATA_TAG        IMAGE_USERDATA_TAG

/// hs.image.systemImageNames[]
/// Constant
/// Array containing the names of internal system images for use with hs.drawing.image
///
/// Notes:
///  * Image names pulled from NSImage.h
///  * This table has a __tostring() metamethod which allows listing it's contents in the Hammerspoon console by typing `hs.image.systemImageNames`.
static int pushNSImageNameTable(lua_State *L) {
    lua_newtable(L) ;
        lua_pushstring(L, [NSImageNameQuickLookTemplate UTF8String]) ;                lua_setfield(L, -2, "QuickLookTemplate") ;
        lua_pushstring(L, [NSImageNameBluetoothTemplate UTF8String]) ;                lua_setfield(L, -2, "BluetoothTemplate") ;
        lua_pushstring(L, [NSImageNameIChatTheaterTemplate UTF8String]) ;             lua_setfield(L, -2, "IChatTheaterTemplate") ;
        lua_pushstring(L, [NSImageNameSlideshowTemplate UTF8String]) ;                lua_setfield(L, -2, "SlideshowTemplate") ;
        lua_pushstring(L, [NSImageNameActionTemplate UTF8String]) ;                   lua_setfield(L, -2, "ActionTemplate") ;
        lua_pushstring(L, [NSImageNameSmartBadgeTemplate UTF8String]) ;               lua_setfield(L, -2, "SmartBadgeTemplate") ;
        lua_pushstring(L, [NSImageNameIconViewTemplate UTF8String]) ;                 lua_setfield(L, -2, "IconViewTemplate") ;
        lua_pushstring(L, [NSImageNameListViewTemplate UTF8String]) ;                 lua_setfield(L, -2, "ListViewTemplate") ;
        lua_pushstring(L, [NSImageNameColumnViewTemplate UTF8String]) ;               lua_setfield(L, -2, "ColumnViewTemplate") ;
        lua_pushstring(L, [NSImageNameFlowViewTemplate UTF8String]) ;                 lua_setfield(L, -2, "FlowViewTemplate") ;
        lua_pushstring(L, [NSImageNamePathTemplate UTF8String]) ;                     lua_setfield(L, -2, "PathTemplate") ;
        lua_pushstring(L, [NSImageNameInvalidDataFreestandingTemplate UTF8String]) ;  lua_setfield(L, -2, "InvalidDataFreestandingTemplate") ;
        lua_pushstring(L, [NSImageNameLockLockedTemplate UTF8String]) ;               lua_setfield(L, -2, "LockLockedTemplate") ;
        lua_pushstring(L, [NSImageNameLockUnlockedTemplate UTF8String]) ;             lua_setfield(L, -2, "LockUnlockedTemplate") ;
        lua_pushstring(L, [NSImageNameGoRightTemplate UTF8String]) ;                  lua_setfield(L, -2, "GoRightTemplate") ;
        lua_pushstring(L, [NSImageNameGoLeftTemplate UTF8String]) ;                   lua_setfield(L, -2, "GoLeftTemplate") ;
        lua_pushstring(L, [NSImageNameRightFacingTriangleTemplate UTF8String]) ;      lua_setfield(L, -2, "RightFacingTriangleTemplate") ;
        lua_pushstring(L, [NSImageNameLeftFacingTriangleTemplate UTF8String]) ;       lua_setfield(L, -2, "LeftFacingTriangleTemplate") ;
        lua_pushstring(L, [NSImageNameAddTemplate UTF8String]) ;                      lua_setfield(L, -2, "AddTemplate") ;
        lua_pushstring(L, [NSImageNameRemoveTemplate UTF8String]) ;                   lua_setfield(L, -2, "RemoveTemplate") ;
        lua_pushstring(L, [NSImageNameRevealFreestandingTemplate UTF8String]) ;       lua_setfield(L, -2, "RevealFreestandingTemplate") ;
        lua_pushstring(L, [NSImageNameFollowLinkFreestandingTemplate UTF8String]) ;   lua_setfield(L, -2, "FollowLinkFreestandingTemplate") ;
        lua_pushstring(L, [NSImageNameEnterFullScreenTemplate UTF8String]) ;          lua_setfield(L, -2, "EnterFullScreenTemplate") ;
        lua_pushstring(L, [NSImageNameExitFullScreenTemplate UTF8String]) ;           lua_setfield(L, -2, "ExitFullScreenTemplate") ;
        lua_pushstring(L, [NSImageNameStopProgressTemplate UTF8String]) ;             lua_setfield(L, -2, "StopProgressTemplate") ;
        lua_pushstring(L, [NSImageNameStopProgressFreestandingTemplate UTF8String]) ; lua_setfield(L, -2, "StopProgressFreestandingTemplate") ;
        lua_pushstring(L, [NSImageNameRefreshTemplate UTF8String]) ;                  lua_setfield(L, -2, "RefreshTemplate") ;
        lua_pushstring(L, [NSImageNameRefreshFreestandingTemplate UTF8String]) ;      lua_setfield(L, -2, "RefreshFreestandingTemplate") ;
        lua_pushstring(L, [NSImageNameBonjour UTF8String]) ;                          lua_setfield(L, -2, "Bonjour") ;
        lua_pushstring(L, [NSImageNameComputer UTF8String]) ;                         lua_setfield(L, -2, "Computer") ;
        lua_pushstring(L, [NSImageNameFolderBurnable UTF8String]) ;                   lua_setfield(L, -2, "FolderBurnable") ;
        lua_pushstring(L, [NSImageNameFolderSmart UTF8String]) ;                      lua_setfield(L, -2, "FolderSmart") ;
        lua_pushstring(L, [NSImageNameFolder UTF8String]) ;                           lua_setfield(L, -2, "Folder") ;
        lua_pushstring(L, [NSImageNameNetwork UTF8String]) ;                          lua_setfield(L, -2, "Network") ;
        lua_pushstring(L, [NSImageNameMobileMe UTF8String]) ;                         lua_setfield(L, -2, "MobileMe") ;
        lua_pushstring(L, [NSImageNameMultipleDocuments UTF8String]) ;                lua_setfield(L, -2, "MultipleDocuments") ;
        lua_pushstring(L, [NSImageNameUserAccounts UTF8String]) ;                     lua_setfield(L, -2, "UserAccounts") ;
        lua_pushstring(L, [NSImageNamePreferencesGeneral UTF8String]) ;               lua_setfield(L, -2, "PreferencesGeneral") ;
        lua_pushstring(L, [NSImageNameAdvanced UTF8String]) ;                         lua_setfield(L, -2, "Advanced") ;
        lua_pushstring(L, [NSImageNameInfo UTF8String]) ;                             lua_setfield(L, -2, "Info") ;
        lua_pushstring(L, [NSImageNameFontPanel UTF8String]) ;                        lua_setfield(L, -2, "FontPanel") ;
        lua_pushstring(L, [NSImageNameColorPanel UTF8String]) ;                       lua_setfield(L, -2, "ColorPanel") ;
        lua_pushstring(L, [NSImageNameUser UTF8String]) ;                             lua_setfield(L, -2, "User") ;
        lua_pushstring(L, [NSImageNameUserGroup UTF8String]) ;                        lua_setfield(L, -2, "UserGroup") ;
        lua_pushstring(L, [NSImageNameEveryone UTF8String]) ;                         lua_setfield(L, -2, "Everyone") ;
        lua_pushstring(L, [NSImageNameUserGuest UTF8String]) ;                        lua_setfield(L, -2, "UserGuest") ;
        lua_pushstring(L, [NSImageNameMenuOnStateTemplate UTF8String]) ;              lua_setfield(L, -2, "MenuOnStateTemplate") ;
        lua_pushstring(L, [NSImageNameMenuMixedStateTemplate UTF8String]) ;           lua_setfield(L, -2, "MenuMixedStateTemplate") ;
        lua_pushstring(L, [NSImageNameApplicationIcon UTF8String]) ;                  lua_setfield(L, -2, "ApplicationIcon") ;
        lua_pushstring(L, [NSImageNameTrashEmpty UTF8String]) ;                       lua_setfield(L, -2, "TrashEmpty") ;
        lua_pushstring(L, [NSImageNameTrashFull UTF8String]) ;                        lua_setfield(L, -2, "TrashFull") ;
        lua_pushstring(L, [NSImageNameHomeTemplate UTF8String]) ;                     lua_setfield(L, -2, "HomeTemplate") ;
        lua_pushstring(L, [NSImageNameBookmarksTemplate UTF8String]) ;                lua_setfield(L, -2, "BookmarksTemplate") ;
        lua_pushstring(L, [NSImageNameCaution UTF8String]) ;                          lua_setfield(L, -2, "Caution") ;
        lua_pushstring(L, [NSImageNameStatusAvailable UTF8String]) ;                  lua_setfield(L, -2, "StatusAvailable") ;
        lua_pushstring(L, [NSImageNameStatusPartiallyAvailable UTF8String]) ;         lua_setfield(L, -2, "StatusPartiallyAvailable") ;
        lua_pushstring(L, [NSImageNameStatusUnavailable UTF8String]) ;                lua_setfield(L, -2, "StatusUnavailable") ;
        lua_pushstring(L, [NSImageNameStatusNone UTF8String]) ;                       lua_setfield(L, -2, "StatusNone") ;
        lua_pushstring(L, [NSImageNameShareTemplate UTF8String]) ;                    lua_setfield(L, -2, "ShareTemplate") ;
    return 1;
}

/// hs.image.imageFromPath(path) -> object
/// Constructor
/// Loads an image file
///
/// Parameters:
///  * path - A string containing the path to an image file on disk
///
/// Returns:
///  * An `hs.image` object, or nil if an error occured
static int imageFromPath(lua_State *L) {
    NSString* imagePath = lua_to_nsstring(L, 1);
    NSImage *newImage = [[NSImage alloc] initByReferencingFile:[imagePath stringByExpandingTildeInPath]];

    if (newImage && newImage.valid) {
        store_image_as_hsimage(L, newImage);
    } else {
        showError(L, "Unable to load image:");
        showError(L, (char *)[imagePath UTF8String]);
        lua_pushnil(L);
    }

    return 1;
}

/// hs.image.imageFromASCII(ascii) -> object
/// Constructor
/// Creates an image from an ASCII representation
///
/// Parameters:
///  * ascii - A string containing a representation of an image
///
/// Returns:
///  * An `hs.imaage` object, or nil if an error occured
///
/// Notes:
///  * To use the ASCII diagram image support, see http://cocoamine.net/blog/2015/03/20/replacing-photoshop-with-nsstring/
static int imageFromASCII(lua_State *L) {
    NSString *imageASCII = lua_to_nsstring(L, 1);

    if ([imageASCII hasPrefix:@"ASCII:"]) {
        imageASCII = [imageASCII substringFromIndex: 6];
    }

    NSColor *color = [NSColor blackColor];
    imageASCII = [imageASCII stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSArray *rep = [imageASCII componentsSeparatedByString:@"\n"];
    NSImage *newImage = [NSImage imageWithASCIIRepresentation:rep color:color shouldAntialias:YES];

    if (newImage) {
        store_image_as_hsimage(L, newImage);
    } else {
        lua_pushnil(L);
    }

    return 1;
}

/// hs.image.imageFromName(string) -> object
/// Constructor
/// Returns the hs.image object for the specified name, if it exists.
///
/// Parameters:
///  * Name - the name of the image to return.
///
/// Returns:
///  * An hs.image object or nil, if no image was found with the specified name.
///
/// Notes:
///  * Some predefined labels corresponding to OS X System default images can be found in `hs.image.systemImageNames`.
///  * Names are not required to be unique: The search order is as follows, and the first match found is returned:
///     * an image whose name was explicitly set with the `setName` method since the last full restart of Hammerspoon
///     * Hammerspoon's main application bundle
///     * the Application Kit framework (this is where most of the images listed in `hs.image.systemImageNames` are located)
///  * Image names can be assigned by the image creator or by calling the `hs.image:setName` method on an hs.image object.
static int imageFromName(lua_State *L) {
    const char* imageName = luaL_checkstring(L, 1) ;

    NSImage *newImage = [NSImage imageNamed:[NSString stringWithUTF8String:imageName]] ;
    if (newImage) {
        store_image_as_hsimage(L, newImage) ;
    } else {
        lua_pushnil(L) ;
    }
    return 1 ;
}

/// hs.image.imageFromAppBundle(bundleID) -> object
/// Constructor
/// Creates an `hs.image` object using the icon from an App
///
/// Parameters:
///  * bundleID - A string containing the bundle identifier of an application
///
/// Returns:
///  * An `hs.image` object or nil, if no app icon was found
static int imageFromApp(lua_State *L) {
    NSString *imagePath = [[NSWorkspace sharedWorkspace] absolutePathForAppBundleWithIdentifier:lua_to_nsstring(L, 1)];
    NSImage *iconImage = [[NSWorkspace sharedWorkspace] iconForFile:imagePath];

    if (iconImage) {
        store_image_as_hsimage(L, iconImage);
    } else {
        lua_pushnil(L);
    }
    return 1;
}

/// hs.image:getImageName() -> string
/// Method
/// Returns the name assigned to the hs.image object.
///
/// Parameters:
///  * None
///
/// Returns:
///  * Name - the name assigned to the hs.image object.
static int getImageName(lua_State* L) {
    NSImage *testImage = get_image_from_hsimage(L, 1) ;
    lua_pushstring(L, [[testImage name] UTF8String]) ;
    return 1 ;
}

/// hs.image:setImageName(Name) -> boolean
/// Method
/// Assigns the name assigned to the hs.image object.
///
/// Parameters:
///  * Name - the name to assign to the hs.image object.
///
/// Returns:
///  * Status - a boolean value indicating success (true) or failure (false) when assigning the specified name.
static int setImageName(lua_State* L) {
    NSImage *testImage = get_image_from_hsimage(L, 1) ;
    if (lua_isnil(L,2))
        lua_pushboolean(L, [testImage setName:nil]) ;
    else
        lua_pushboolean(L, [testImage setName:[NSString stringWithUTF8String:luaL_checkstring(L, 2)]]) ;
    return 1 ;
}

static int tostringForNSImage(lua_State* L) {
    NSImage *testImage = get_image_from_hsimage(L, 1) ;
    NSString* theName = [testImage name] ;

    if (!theName) theName = @"--unnamed--" ;

    lua_pushstring(L, [[NSString stringWithFormat:@"%s: %@ (%p)", USERDATA_TAG, theName, lua_topointer(L, 1)] UTF8String]) ;
    return 1 ;
}

/// hs.image:saveToFile(filename[, filetype]) -> boolean
/// Method
/// Save the hs.image object as an image of type `filetype` to the specified filename.
///
/// Parameters:
///  * filename - the path and name of the file to save.
///  * filetype - optional case-insensitive string paramater specifying the file type to save (default PNG)
///    * PNG  - save in Portable Network Graphics (PNG) format
///    * TIFF - save in Tagged Image File Format (TIFF) format
///    * BMP  - save in Windows bitmap image (BMP) format
///    * GIF  - save in Graphics Image Format (GIF) format
///    * JPEG - save in Joint Photographic Experts Group (JPEG) format
///
/// Returns:
///  * Status - a boolean value indicating success (true) or failure (false)
///
/// Notes:
///  * Saves image at its original size.
static int saveToFile(lua_State* L) {
    NSImage*  theImage = get_image_from_hsimage(L, 1) ;
    NSString* filePath = lua_to_nsstring(L, 2) ;
    NSBitmapImageFileType fileType = NSPNGFileType ;

    if (lua_isstring(L, 3)) {
        NSString* typeLabel = lua_to_nsstring(L, 3) ;
        if      ([typeLabel compare:@"PNG"  options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSPNGFileType  ; }
        else if ([typeLabel compare:@"TIFF" options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSTIFFFileType ; }
        else if ([typeLabel compare:@"BMP"  options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSBMPFileType  ; }
        else if ([typeLabel compare:@"GIF"  options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSGIFFileType  ; }
        else if ([typeLabel compare:@"JPEG" options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSJPEGFileType ; }
        else if ([typeLabel compare:@"JPG"  options:NSCaseInsensitiveSearch] == NSOrderedSame) { fileType = NSJPEGFileType ; }
        else {
            showError(L, "hs.image:saveToFile:: invalid file type specified") ;
            lua_pushboolean(L, NO) ;
            return 1 ;
        }
    }

    BOOL result = false;

    NSData *tiffRep = [theImage TIFFRepresentation];
    if (!tiffRep) {
        showError(L, "Unable to write image file: Can't create internal representation");
        lua_pushboolean(L, false);
        return 1;
    }
    NSBitmapImageRep *rep = [NSBitmapImageRep imageRepWithData:tiffRep];
    if (!tiffRep) {
        showError(L, "Unable to write image file: Can't wrap internal representation");
        lua_pushboolean(L, false);
        return 1;
    }
    NSData* fileData = [rep representationUsingType:fileType properties:@{}];
    if (!fileData) {
        showError(L, "Unable to write image file: Can't convert internal representation");
        lua_pushboolean(L, false);
        return 1;
    }
    NSError *error;
    if ([fileData writeToFile:[filePath stringByExpandingTildeInPath] options:NSDataWritingAtomic error:&error]) {
        result = YES ;
    } else {
        showError(L, "Unable to write image file:");
        showError(L, (char *)[[error localizedDescription] UTF8String]);
    }

    lua_pushboolean(L, result) ;
    return 1 ;
}

static int hsimage_gc(lua_State* L) {
// Get the NSImage so ARC can release it...
    void **thingy = luaL_checkudata(L, 1, USERDATA_TAG) ;
    NSImage* image = (__bridge_transfer NSImage *) *thingy ;
    [image setName:nil] ; // remove from image cache
    [image recache] ;     // invalidate image rep caches
    luaL_unref(L, LUA_REGISTRYINDEX, 1);
    return 0 ;
}

// static int meta_gc(lua_State* __unused L) {
//     [hsimageReferences removeAllIndexes];
//     hsimageReferences = nil;
//     return 0 ;
// }

// Metatable for userdata objects
static const luaL_Reg userdata_metaLib[] = {
    {"name",                getImageName},
    {"setName",             setImageName},
    {"saveToFile",          saveToFile},
    {"__tostring",          tostringForNSImage},
    {"__gc",                hsimage_gc},
    {NULL,                  NULL}
};

// Functions for returned object when module loads
static luaL_Reg moduleLib[] = {
    {"imageFromPath",      imageFromPath},
    {"imageFromASCII",     imageFromASCII},
    {"imageFromName",      imageFromName},
    {"imageFromAppBundle", imageFromApp},
    {NULL,                  NULL}
};

// // Metatable for module, if needed
// static const luaL_Reg module_metaLib[] = {
//     {"__gc",                meta_gc},
//     {NULL,                  NULL}
// };

int luaopen_hs_image_internal(lua_State* L) {
// Metatable for userdata objects
    luaL_newlib(L, userdata_metaLib);
        lua_pushvalue(L, -1);
        lua_setfield(L, -2, "__index");
        lua_setfield(L, LUA_REGISTRYINDEX, USERDATA_TAG);

// Create table for luaopen
    luaL_newlib(L, moduleLib);
        pushNSImageNameTable(L) ; lua_setfield(L, -2, "systemImageNames") ;

// // Module metatable, if needed
//         luaL_newlib(L, module_metaLib);
//         lua_setmetatable(L, -2);
    return 1;
}
