# Another copy of Nike iOS app

## Used approach

### Framework

Apple recommends to use SwiftUI. But it also claims that UIKit is fine. 
As it says that SwiftUI is usually better - use this framework.

### Views pattern

There are many recommendations (like [this](https://developer.apple.com/forums/thread/699003) to use MV (Model-View) template, so the following structure is used.
To call API, use appropriate object for this. (mb these classes will be merged later and these classes will be converted to protocols, but not now =))


## Directory structure

- `Views` directory: all views (it's possible to add subdirs there)
- `Models` directory: all models (it's possible to add subdirs too)
- `API` directory: used to store interface for data reception and its implementations (pre-filled stubs).  
  It's better to add some constant into implementation to sleep in the separate thread.
- `nike_cpAPP`: just main

## API

### Login API
Note that before login images are stored in the phome memory
- login(email: String, passwd: String): api/login/login
  Lets assume that there is user in db.
  User won't use this app without login
  Ret codes:
  - 200
    JSON:
    - Logged_in: bool - required
      user_name: String - optional, if `logged_in == true`
      user_id: uint64 - optional, if `logged_in == true`
- exit(): api/login/exit
  Ret codes:
  - 200 - OK


### Shop API
- getAllCategoriesByUserID(user_id: uint64): api/shop/get_all_categories
  Returns dict with genders, and category images for them
  Category should be stored on back-end
  Ret codes:
  - 200
    JSON:
    - "(String): [Category]
        Category entity: 
        - Id: uint64
        - Name: Str
        - Image: Base64?
  - 400 - bad user_id
    Empty.
- getCommonCategoriesByGender(gender: string): api/shop/get_common_categories
  Returns dict with genders and images for them
  Ret codes are the same as for `getAllCategoriesByUserID`, but invalid gender triggers error code.
- getProductViewListByCategoryId(user_id: uint64, catergory_id: uint64): api/shop/get_preview_list
  Returns list of product previews.
  Ret codes:
  - 200
    JSON:
    [ProductPreview]
    ProductPreview: 
    - id: uint64
    - name: String
    - photos: [Image] (only one image)
    - price: float
    - liked: bool
    - short_description: String
    - size: String
  - 400 - Bad category_id
  - 401 - Bad user_id
- getFullProductInfo(user_id: uint64, product_id: uint64): api/shop/get_full_product_info
  Returns exactly one Product object
  Ret codes:
  - 200
    JSON:
    Product:
    - id: uint64
    - name: String
    - photos: Image (many images)
    - price: float
    - liked: bool
    - short_description: String
    - full_description: String
    - size_list: [String]
- searchProducts(user_id: uint64, search_pattern: String, category_id: uint64 - optional): api/shop/find_products
  Retruns list of ProdcutPreviews
  Ret codes:
  - 200:
    JSON:
    [ProductPreview]
    ProductPreview: 
    - id: uint64
    - name: String
    - photos: [Image] (only one image)
    - price: float
    - liked: bool
    - short_description: String
    - size: String
  - 400: bad category_id
  - 401: bad user_id

### Cart API
- addToCart(user_id: uint64, product_id: uint64, amount: uint64 - optional): api/cart/add_to_cart
  Adds to cart (1 by default).
  Ret codes:
  - 200 - OK
  - 400: bad product_id
  - 401: bad user_id
- removeFromCart(user_id: uint64, product_id: uint64, amount: uint64 - optional): api/cart/remove_from_cart
  Adds to cart (1 by default).
  Ret codes:
  - 200 - OK
  - 400: bad product_id
  - 401: bad user_id  
- getProductsInCart(user_id: uint64): api/cart/get_products_in_cart
  Gets ploduct list in cart
  Ret codes:
  - 200 - OK
    JSON:
    [ProductPreviewWithSize, number: uint64]
  - 401 - bad user_id

### Common API
- likeProduct(user_id: uint64, like: bool): api/cart/like_product
  Ret codes:
  - 200 - OK
  - 401 - bad user_id

### Favorites API
- getFavoritesList(user_id: uint64): api/favorites/get_product_list
  Ret codes:
  - 200 - OK
    JSON:
    [ProductPreview]
  - 401 - bad user_id
    
### Home API
- get_recomended_products(user_id: uint64): api/home/recomended_products
  Ret codes:
  - 200
    JSON:
    [ProductPreview] (without_size)
  - 401 - bad user_id
- get_promotions(user_id: uint64): api/home/get_promotions
  Ret codes:
  - 200
    JSON:
    [Promotion]
    Promotion:
    - id: uint64
    - Image: Base64
    - Link: url
  - 401: bad user_id
  

## Additional notes

- it's better to create screens according to apple guidelines.
- it's better to not mix UIKit ans SwiftUI (despite this possibility)
- Try to call API from separate thread.

## Known differences between this app and the Nike app

- Tabbar icons are filled because Apple recommends (and forces developers) to use filled version for tabbar. (See [this manual](https://developer.apple.com/design/human-interface-guidelines/tab-bars))
