# Customer Mobile App APIs Documentation

## Base URL
```
/api/v1
```

## Authentication
Most APIs require authentication token in the header:
```
Authorization: Bearer {token}
```

---

## 1. Authentication APIs

### 1.1 Login
- **Endpoint:** `POST /api/v1/auth/login`
- **Description:** User login with email/phone and password
- **Auth Required:** No
- **Request Body:**
  ```json
  {
    "email": "user@example.com",
    "password": "password123"
  }
  ```

### 1.2 Login via Username
- **Endpoint:** `POST /api/v1/auth/loginViaUsername`
- **Description:** Login using username
- **Auth Required:** No

### 1.3 Phone Login OTP Verification
- **Endpoint:** `POST /api/v1/auth/verify/phoneLoginOtp`
- **Description:** Verify OTP for phone login
- **Auth Required:** No

### 1.4 Register
- **Endpoint:** `POST /api/v1/auth/register`
- **Description:** New user registration
- **Auth Required:** No

### 1.5 Charity Register
- **Endpoint:** `POST /api/v1/auth/charity-register`
- **Description:** Charity organization registration
- **Auth Required:** No

### 1.6 Forgot Password
- **Endpoint:** `POST /api/v1/auth/forgotPassword`
- **Description:** Request password reset
- **Auth Required:** No

### 1.7 Reset Password
- **Endpoint:** `POST /api/v1/auth/resetPassword`
- **Description:** Reset password with token
- **Auth Required:** No

### 1.8 Logout
- **Endpoint:** `GET /api/v1/auth/logout`
- **Description:** User logout
- **Auth Required:** Yes

### 1.9 Send Token
- **Endpoint:** `POST /api/v1/auth/sendToken`
- **Description:** Send verification token
- **Auth Required:** Yes

### 1.10 Verify Account
- **Endpoint:** `POST /api/v1/auth/verifyAccount`
- **Description:** Verify account with token
- **Auth Required:** Yes

### 1.11 Social Login
- **Endpoint:** `POST /api/v1/social/login/{driver}`
- **Description:** Login via social media (Google, Facebook, etc.)
- **Auth Required:** No
- **Parameters:** `{driver}` - social provider name

### 1.12 Social Info
- **Endpoint:** `POST /api/v1/social/info`
- **Description:** Get social login keys
- **Auth Required:** No

---

## 2. Profile APIs

### 2.1 Get Profile
- **Endpoint:** `GET /api/v1/profile`
- **Description:** Get user profile details
- **Auth Required:** Yes

### 2.2 Get Profile (Alternative)
- **Endpoint:** `GET /api/v1/getProfile`
- **Description:** Alternative endpoint for profile
- **Auth Required:** Yes

### 2.3 Update Profile
- **Endpoint:** `POST /api/v1/update/profile`
- **Description:** Update user profile information
- **Auth Required:** Yes

### 2.4 Update Profile Image
- **Endpoint:** `POST /api/v1/update/image`
- **Description:** Update profile picture
- **Auth Required:** Yes
- **Request:** Multipart form data with image file

### 2.5 Get Account
- **Endpoint:** `GET /api/v1/account`
- **Description:** Get account information
- **Auth Required:** Yes

### 2.6 Change Password
- **Endpoint:** `POST /api/v1/changePassword`
- **Description:** Change user password
- **Auth Required:** Yes

### 2.7 Get User Address
- **Endpoint:** `POST /api/v1/user/getAddress`
- **Description:** Get user addresses
- **Auth Required:** Yes

### 2.8 Get User Cards
- **Endpoint:** `GET /api/v1/user/get-user-cards`
- **Description:** Get saved payment cards
- **Auth Required:** Yes

### 2.9 Set Default Card
- **Endpoint:** `GET /api/v1/user/setDefaultCard`
- **Description:** Set default payment card
- **Auth Required:** Yes

### 2.10 Delete Card
- **Endpoint:** `GET /api/v1/user/deleteCard`
- **Description:** Delete saved payment card
- **Auth Required:** Yes

---

## 3. Address Management APIs

### 3.1 Get Address List
- **Endpoint:** `GET /api/v1/addressBook/{id?}`
- **Description:** Get all saved addresses
- **Auth Required:** Yes
- **Parameters:** Optional address ID

### 3.2 Save Address
- **Endpoint:** `POST /api/v1/user/address/{id?}`
- **Description:** Save or update address
- **Auth Required:** Yes
- **Parameters:** Optional address ID for update

### 3.3 Delete Address
- **Endpoint:** `GET /api/v1/delete/address/{id}`
- **Description:** Delete saved address
- **Auth Required:** Yes

### 3.4 Set Primary Address
- **Endpoint:** `GET /api/v1/primary/address/{id}`
- **Description:** Set address as primary
- **Auth Required:** Yes

### 3.5 Static Dropoff Locations
- **Endpoint:** `GET /api/v1/static-dropoff-locations`
- **Description:** Get static dropoff locations
- **Auth Required:** No

### 3.6 Get Dropoff Location
- **Endpoint:** `POST /api/v1/dropoff-location`
- **Description:** Get dropoff location details
- **Auth Required:** Yes

---

## 4. Home & Category APIs

### 4.1 Homepage
- **Endpoint:** `POST /api/v1/homepage`
- **Description:** Get homepage data (banners, categories, products)
- **Auth Required:** No

### 4.2 Header Content
- **Endpoint:** `POST /api/v1/header`
- **Description:** Get header navigation content
- **Auth Required:** No

### 4.3 Get Category Data
- **Endpoint:** `GET /api/v1/category/{id?}`
- **Description:** Get category details and products
- **Auth Required:** No
- **Parameters:** Optional category ID

### 4.4 Category Filters
- **Endpoint:** `POST /api/v1/category/filters/{id?}`
- **Description:** Get category filter options
- **Auth Required:** No

### 4.5 Get Subcategory Vendor
- **Endpoint:** `POST /api/v1/get/subcategory/vendor`
- **Description:** Get vendors by subcategory
- **Auth Required:** No

### 4.6 Category KYC Document
- **Endpoint:** `POST /api/v1/category_kyc_document`
- **Description:** Get KYC documents for category
- **Auth Required:** No

### 4.7 Submit Category KYC
- **Endpoint:** `POST /api/v1/submit_category_kyc`
- **Description:** Submit category KYC documents
- **Auth Required:** No

---

## 5. Product APIs

### 5.1 Get Products
- **Endpoint:** `POST /api/v1/get-products`
- **Description:** Get product list with filters
- **Auth Required:** No

### 5.2 Get Product by ID
- **Endpoint:** `GET /api/v1/product/{id}`
- **Description:** Get single product details
- **Auth Required:** No

### 5.3 Product by Variant
- **Endpoint:** `POST /api/v1/productByVariant/{id}`
- **Description:** Get product variant details
- **Auth Required:** No

### 5.4 Check Product Availability
- **Endpoint:** `POST /api/v1/checkProductAvailibility`
- **Description:** Check if product is available
- **Auth Required:** No

### 5.5 Get Product Delivery Slots
- **Endpoint:** `POST /api/v1/getShippingProductDeliverySlots`
- **Description:** Get delivery slots for shipping products
- **Auth Required:** No

### 5.6 Get Product Delivery Slots Interval
- **Endpoint:** `POST /api/v1/getProductDeliverySlotsInterval`
- **Description:** Get delivery time intervals
- **Auth Required:** No

### 5.7 Get All Product Tags
- **Endpoint:** `GET /api/v1/getAllProductTags`
- **Description:** Get all available product tags
- **Auth Required:** No

### 5.8 Product FAQ
- **Endpoint:** `GET /api/v1/products_faq/{id}`
- **Description:** Get product FAQs
- **Auth Required:** No

### 5.9 Product Search
- **Endpoint:** `POST /api/v1/product/search`
- **Description:** Search products
- **Auth Required:** No

### 5.10 Check Product Availability (Yacht)
- **Endpoint:** `POST /api/v1/check-product-availability/{id}`
- **Description:** Check yacht product availability
- **Auth Required:** No

### 5.11 Product Inquiry
- **Endpoint:** `POST /api/v1/product/inquiry`
- **Description:** Submit product inquiry
- **Auth Required:** No

### 5.12 Store Product Inquiry
- **Endpoint:** `POST /api/v1/inquiry-mode/store`
- **Description:** Store product inquiry in inquiry mode
- **Auth Required:** No

---

## 6. Vendor APIs

### 6.1 Get All Vendors
- **Endpoint:** `GET /api/v1/vendor/all`
- **Description:** Get list of all vendors
- **Auth Required:** No

### 6.2 Get Vendor by ID
- **Endpoint:** `GET /api/v1/vendor/{id?}`
- **Description:** Get vendor details and products
- **Auth Required:** No

### 6.3 Vendor Optimize
- **Endpoint:** `GET /api/v1/vendor-optimize/{id?}`
- **Description:** Get optimized vendor data
- **Auth Required:** No

### 6.4 Vendor Optimize Filters
- **Endpoint:** `GET /api/v1/vendor-optimize-filters/{id?}`
- **Description:** Get vendor filter options (optimized)
- **Auth Required:** No

### 6.5 Vendor Filters
- **Endpoint:** `POST /api/v1/vendor/filters/{id?}`
- **Description:** Get vendor filter options
- **Auth Required:** No

### 6.6 Vendor Category List
- **Endpoint:** `POST /api/v1/vendor/category/list`
- **Description:** Get vendor categories
- **Auth Required:** No

### 6.7 Vendor Products Filter
- **Endpoint:** `POST /api/v1/vendor/vendorProductsFilter`
- **Description:** Filter vendor products
- **Auth Required:** No

### 6.8 Vendor Products Filter Optimize
- **Endpoint:** `POST /api/v1/vendor/vendorProductsFilterOptimize`
- **Description:** Optimized vendor products filter
- **Auth Required:** No

### 6.9 Vendor Category Products
- **Endpoint:** `GET /api/v1/vendor/{slug1}/{slug2}`
- **Description:** Get products by vendor and category
- **Auth Required:** No

### 6.10 Vendor Register
- **Endpoint:** `POST /api/v1/vendor/register`
- **Description:** Register as vendor
- **Auth Required:** No

### 6.11 Get Vendor Profile
- **Endpoint:** `POST /api/v1/get-vendor-profile`
- **Description:** Get vendor profile details
- **Auth Required:** Yes

### 6.12 Update Vendor Profile
- **Endpoint:** `POST /api/v1/update-vendor-profile`
- **Description:** Update vendor profile
- **Auth Required:** Yes

### 6.13 Get Vendor Transactions
- **Endpoint:** `POST /api/v1/get-vendor-transactions`
- **Description:** Get vendor transaction history
- **Auth Required:** Yes

---

## 7. Cart APIs

### 7.1 Add to Cart
- **Endpoint:** `POST /api/v1/cart/add`
- **Description:** Add product to cart
- **Auth Required:** No

### 7.2 Get Cart List
- **Endpoint:** `GET /api/v1/cart/list`
- **Description:** Get cart items
- **Auth Required:** No

### 7.3 Update Cart Quantity
- **Endpoint:** `POST /api/v1/cart/updateQuantity`
- **Description:** Update product quantity in cart
- **Auth Required:** Yes

### 7.4 Remove Cart Item
- **Endpoint:** `POST /api/v1/cart/remove`
- **Description:** Remove item from cart
- **Auth Required:** Yes

### 7.5 Empty Cart
- **Endpoint:** `GET /api/v1/cart/empty`
- **Description:** Clear all cart items
- **Auth Required:** Yes

### 7.6 Get Cart Total Items
- **Endpoint:** `GET /api/v1/cart/totalItems`
- **Description:** Get total items count in cart
- **Auth Required:** Yes

### 7.7 Cart Attachment
- **Endpoint:** `POST /api/v1/cart/attachment`
- **Description:** Add attachment to cart
- **Auth Required:** No

### 7.8 Add Booking Option to Cart
- **Endpoint:** `POST /api/v1/cart/add-booking-option`
- **Description:** Add booking option to cart item
- **Auth Required:** No

### 7.9 Upload Prescriptions
- **Endpoint:** `POST /api/v1/upload/prescriptions`
- **Description:** Upload prescription files
- **Auth Required:** No

### 7.10 Delete Prescriptions
- **Endpoint:** `POST /api/v1/delete/prescriptions`
- **Description:** Delete prescription files
- **Auth Required:** No

### 7.11 Check Schedule Slots
- **Endpoint:** `POST /api/v1/vendor/slots`
- **Description:** Check available schedule slots
- **Auth Required:** No

### 7.12 Check Dropoff Slots
- **Endpoint:** `GET /api/v1/vendor/dropoffslots`
- **Description:** Get dropoff time slots
- **Auth Required:** No

### 7.13 Update Product Schedule
- **Endpoint:** `POST /api/v1/cart/product-schedule/update`
- **Description:** Update product schedule in cart
- **Auth Required:** Yes

### 7.14 Update Cart Product FAQ
- **Endpoint:** `POST /api/v1/cart/productfaq/update`
- **Description:** Update product FAQ in cart
- **Auth Required:** Yes

### 7.15 Update Cart Wallet Amount
- **Endpoint:** `POST /api/v1/cart/updateCartWalletAmount`
- **Description:** Update wallet amount in cart
- **Auth Required:** No

### 7.16 Get Last Added Product Variant
- **Endpoint:** `POST /api/v1/cart/product/lastAdded`
- **Description:** Get last added product variant
- **Auth Required:** No

### 7.17 Get Product Variant with Different Addons
- **Endpoint:** `POST /api/v1/cart/product/variant/different-addons`
- **Description:** Get variant with different addon options
- **Auth Required:** No

### 7.18 Upload Cart File
- **Endpoint:** `POST /api/v1/upload-cart-file`
- **Description:** Upload file to cart
- **Auth Required:** No

### 7.19 Remove Cart File
- **Endpoint:** `GET /api/v1/remove-cart-file`
- **Description:** Remove file from cart
- **Auth Required:** No

### 7.20 Update Cart Checked Status
- **Endpoint:** `POST /api/v1/cart/updateCartCheckedStatus`
- **Description:** Update checked status of cart items
- **Auth Required:** Yes

### 7.21 Add Vendor Table to Cart
- **Endpoint:** `POST /api/v1/add/vendorTable/cart`
- **Description:** Add vendor table to cart
- **Auth Required:** Yes

### 7.22 Update Cart Schedule
- **Endpoint:** `POST /api/v1/cart/schedule/update`
- **Description:** Update cart schedule
- **Auth Required:** Yes

### 7.23 Repeat Order
- **Endpoint:** `POST /api/v1/repeatOrder`
- **Description:** Repeat previous order
- **Auth Required:** Yes

### 7.24 Check Slot Orders
- **Endpoint:** `POST /api/v1/cart/checkSlotOrders`
- **Description:** Check orders for time slots
- **Auth Required:** Yes

### 7.25 Check Isolate Single Vendor
- **Endpoint:** `POST /api/v1/checkIsolateSingleVendor`
- **Description:** Check if cart has single vendor
- **Auth Required:** No

### 7.26 Get Rental Protection
- **Endpoint:** `POST /api/v1/rental-protection`
- **Description:** Get rental protection details
- **Auth Required:** No

---

## 8. Order APIs

### 8.1 Place Order
- **Endpoint:** `POST /api/v1/place/order`
- **Description:** Place new order
- **Auth Required:** Yes

### 8.2 Get Orders List
- **Endpoint:** `GET /api/v1/orders`
- **Description:** Get user orders list
- **Auth Required:** Yes

### 8.3 Get All Orders (Lender/Borrower)
- **Endpoint:** `GET /api/v1/orders-all`
- **Description:** Get all orders including lender/borrower
- **Auth Required:** Yes

### 8.4 Get Upcoming/Ongoing Orders
- **Endpoint:** `GET /api/v1/orders_upcoming_ongoing`
- **Description:** Get upcoming and ongoing orders
- **Auth Required:** Yes

### 8.5 Get Rejected Orders
- **Endpoint:** `GET /api/v1/RejectedOrderProduct`
- **Description:** Get rejected order products
- **Auth Required:** Yes

### 8.6 Order Detail
- **Endpoint:** `POST /api/v1/order-detail`
- **Description:** Get order details
- **Auth Required:** Yes

### 8.7 Order Detail P2P
- **Endpoint:** `POST /api/v1/order-detail_p2p`
- **Description:** Get P2P order details
- **Auth Required:** Yes

### 8.8 Order Update
- **Endpoint:** `POST /api/v1/order-update`
- **Description:** Update order status
- **Auth Required:** Yes

### 8.9 Order Tracking
- **Endpoint:** `POST /api/v1/order-tracking`
- **Description:** Track order status
- **Auth Required:** No

### 8.10 Order Details for Notification
- **Endpoint:** `GET /api/v1/order/orderDetails_for_notification/{order_id}`
- **Description:** Get order details for notification
- **Auth Required:** Yes

### 8.11 Edit Order by User
- **Endpoint:** `POST /api/v1/user/editorder`
- **Description:** Edit order by user
- **Auth Required:** Yes

### 8.12 Discard Edit Order
- **Endpoint:** `POST /api/v1/user/discardeditorder`
- **Description:** Discard order edit
- **Auth Required:** Yes

### 8.13 Order Vendor Status Update
- **Endpoint:** `POST /api/v1/user/orderVenderStatusUpdate`
- **Description:** Update vendor status for order
- **Auth Required:** Yes

### 8.14 Send Vendor Reached Location
- **Endpoint:** `POST /api/v1/order/vendorReached`
- **Description:** Notify vendor reached location
- **Auth Required:** Yes

### 8.15 Tip After Order
- **Endpoint:** `POST /api/v1/orders/tip-after-order`
- **Description:** Add tip after order completion
- **Auth Required:** Yes

### 8.16 Charity Listing
- **Endpoint:** `GET /api/v1/charity-listing`
- **Description:** Get charity orders listing
- **Auth Required:** Yes

### 8.17 Get Edited Orders
- **Endpoint:** `GET /api/v1/get/edited-orders`
- **Description:** Get list of edited orders
- **Auth Required:** No

### 8.18 Submit Edited Order
- **Endpoint:** `POST /api/v1/edit-order/approve/reject`
- **Description:** Approve or reject edited order
- **Auth Required:** Yes

---

## 9. Payment APIs

### 9.1 Get Payment Options
- **Endpoint:** `GET /api/v1/payment/options/{page}`
- **Description:** Get available payment options
- **Auth Required:** Yes
- **Parameters:** `{page}` - page identifier

### 9.2 Process Payment
- **Endpoint:** `POST /api/v1/payment/{gateway}`
- **Description:** Process payment with gateway
- **Auth Required:** Yes
- **Parameters:** `{gateway}` - payment gateway name

### 9.3 Place Order Payment
- **Endpoint:** `POST /api/v1/payment/place/order`
- **Description:** Place order with payment
- **Auth Required:** Yes

### 9.4 Create Payment Intent
- **Endpoint:** `POST /api/v1/create-payment-intent`
- **Description:** Create payment intent
- **Auth Required:** Yes

### 9.5 Confirm Payment Intent
- **Endpoint:** `POST /api/v1/confirm-payment-intent`
- **Description:** Confirm payment intent
- **Auth Required:** Yes

### 9.6 SDK Complete Payment
- **Endpoint:** `POST /api/v1/payment/sdk_complete/{gateway?}`
- **Description:** Complete payment via SDK
- **Auth Required:** Yes

### 9.7 SDK Failed Payment
- **Endpoint:** `POST /api/v1/payment/sdk_failed/{gateway?}`
- **Description:** Handle failed SDK payment
- **Auth Required:** Yes

### 9.8 Razorpay Complete Purchase
- **Endpoint:** `POST /api/v1/payment/razorpay/pay/{amount}/{order}`
- **Description:** Complete Razorpay payment
- **Auth Required:** Yes

### 9.9 Paytab Complete Payment
- **Endpoint:** `POST /api/v1/payment/complete/paytab`
- **Description:** Complete Paytab payment
- **Auth Required:** Yes

### 9.10 Paytab Failed Payment
- **Endpoint:** `POST /api/v1/payment/failed/paytab`
- **Description:** Handle Paytab failed payment
- **Auth Required:** Yes

### 9.11 Azul Payment
- **Endpoint:** `POST /api/v1/payment/azulpay`
- **Description:** Process Azul payment
- **Auth Required:** Yes

### 9.12 Paystack Cancel Purchase
- **Endpoint:** `POST /api/v1/paystack/cancelPurchase`
- **Description:** Cancel Paystack purchase
- **Auth Required:** Yes

### 9.13 Payment Intent (Stripe)
- **Endpoint:** `POST /api/v1/payment-intent`
- **Description:** Create Stripe payment intent
- **Auth Required:** Yes

### 9.14 Save Card (Stripe)
- **Endpoint:** `POST /api/v1/save-card`
- **Description:** Save card for Stripe
- **Auth Required:** Yes

---

## 10. Wallet APIs

### 10.1 Get My Wallet
- **Endpoint:** `GET /api/v1/myWallet`
- **Description:** Get wallet details
- **Auth Required:** Yes

### 10.2 Credit Wallet
- **Endpoint:** `POST /api/v1/myWallet/credit`
- **Description:** Add money to wallet
- **Auth Required:** Yes

### 10.3 Wallet Transfer User Verify
- **Endpoint:** `POST /api/v1/wallet/transfer/user/verify`
- **Description:** Verify user for wallet transfer
- **Auth Required:** Yes

### 10.4 Wallet Transfer Confirm
- **Endpoint:** `POST /api/v1/wallet/transfer/confirm`
- **Description:** Confirm wallet transfer
- **Auth Required:** Yes

---

## 11. Promo Code & Coupon APIs

### 11.1 Get Promo Code List
- **Endpoint:** `POST /api/v1/promo-code/list`
- **Description:** Get available promo codes
- **Auth Required:** Yes

### 11.2 Verify Promo Code
- **Endpoint:** `POST /api/v1/promo-code/verify`
- **Description:** Verify promo code
- **Auth Required:** Yes

### 11.3 Remove Promo Code
- **Endpoint:** `POST /api/v1/promo-code/remove`
- **Description:** Remove applied promo code
- **Auth Required:** Yes

### 11.4 Validate Promo Code
- **Endpoint:** `POST /api/v1/promo-code/validate_promo_code`
- **Description:** Validate promo code
- **Auth Required:** Yes

### 11.5 Vendor Promo Code List
- **Endpoint:** `POST /api/v1/promo-code/vendor_promo_code`
- **Description:** Get vendor promo codes
- **Auth Required:** Yes

### 11.6 Promo Code Open List
- **Endpoint:** `POST /api/v1/promo-code-open/list`
- **Description:** Get open promo codes (no auth)
- **Auth Required:** No

### 11.7 Get Coupons
- **Endpoint:** `GET /api/v1/coupons/{id?}`
- **Description:** Get available coupons
- **Auth Required:** Yes
- **Parameters:** Optional coupon ID

---

## 12. Wishlist APIs

### 12.1 Get Wishlists
- **Endpoint:** `GET /api/v1/wishlists`
- **Description:** Get user wishlist
- **Auth Required:** Yes

### 12.2 Update Wishlist
- **Endpoint:** `GET /api/v1/wishlist/update/{pid?}`
- **Description:** Add/remove product from wishlist
- **Auth Required:** Yes
- **Parameters:** Product ID

### 12.3 Add Vendor Wishlist
- **Endpoint:** `POST /api/v1/addvendorwishlist`
- **Description:** Add vendor to wishlist
- **Auth Required:** Yes

### 12.4 Remove Vendor Wishlist
- **Endpoint:** `POST /api/v1/removevendorwishlist`
- **Description:** Remove vendor from wishlist
- **Auth Required:** Yes

### 12.5 View Vendor Wishlist
- **Endpoint:** `POST /api/v1/viewvendorwishlist`
- **Description:** View vendor wishlist
- **Auth Required:** Yes

### 12.6 Update Wishlist Vendor
- **Endpoint:** `POST /api/v1/update-wishlist-vendor`
- **Description:** Update vendor in wishlist
- **Auth Required:** Yes

### 12.7 Get Wishlist Vendors
- **Endpoint:** `GET /api/v1/wishlist-vendors`
- **Description:** Get wishlisted vendors
- **Auth Required:** Yes

---

## 13. Rating & Review APIs

### 13.1 Update Product Rating
- **Endpoint:** `POST /api/v1/rating/update-product-rating`
- **Description:** Rate a product
- **Auth Required:** Yes

### 13.2 Get Product Rating
- **Endpoint:** `GET /api/v1/rating/get-product-rating`
- **Description:** Get product ratings
- **Auth Required:** Yes

### 13.3 Update Driver Rating
- **Endpoint:** `POST /api/v1/rating/update-driver-rating`
- **Description:** Rate a driver
- **Auth Required:** Yes

### 13.4 Get Driver Rating
- **Endpoint:** `GET /api/v1/rating/get-driver-rating`
- **Description:** Get driver ratings
- **Auth Required:** Yes

### 13.5 Get Multi Driver Rating
- **Endpoint:** `POST /api/v1/rating/get-multi-driver-rating`
- **Description:** Get multiple driver ratings
- **Auth Required:** Yes

### 13.6 Upload File
- **Endpoint:** `POST /api/v1/upload-file`
- **Description:** Upload file for rating/review
- **Auth Required:** Yes

---

## 14. Return & Replace Order APIs

### 14.1 Get Return Order Data
- **Endpoint:** `GET /api/v1/return-order/get-order-data-in-model`
- **Description:** Get order data for return
- **Auth Required:** Yes

### 14.2 Get Return Products
- **Endpoint:** `GET /api/v1/return-order/get-return-products`
- **Description:** Get products eligible for return
- **Auth Required:** Yes

### 14.3 Update Product Return
- **Endpoint:** `POST /api/v1/return-order/update-product-return`
- **Description:** Submit product return request
- **Auth Required:** Yes

### 14.4 Vendor Order for Cancel
- **Endpoint:** `POST /api/v1/return-order/vendor-order-for-cancel`
- **Description:** Request vendor order cancellation
- **Auth Required:** Yes

### 14.5 Get Replace Order Data
- **Endpoint:** `GET /api/v1/replace-order/get-replace-order-data-in-model`
- **Description:** Get order data for replacement
- **Auth Required:** Yes

### 14.6 Get Replace Products
- **Endpoint:** `GET /api/v1/replace-order/get-replace-products`
- **Description:** Get products eligible for replacement
- **Auth Required:** Yes

### 14.7 Update Product Replace
- **Endpoint:** `POST /api/v1/replace-order/update-product-replace`
- **Description:** Submit product replacement request
- **Auth Required:** Yes

---

## 15. Cancel Order APIs

### 15.1 Get Cancel Order Reason
- **Endpoint:** `GET /api/v1/cancel-order/get-cancel-order-reason`
- **Description:** Get cancellation reasons
- **Auth Required:** Yes

---

## 16. Pickup & Delivery APIs

### 16.1 Get List of Vehicles (Old)
- **Endpoint:** `POST /api/v1/pickup-delivery/get-list-of-vehicles-old/{id}`
- **Description:** Get vehicles list (old version)
- **Auth Required:** Yes

### 16.2 Get List of Vehicles
- **Endpoint:** `POST /api/v1/pickup-delivery/get-list-of-vehicles/{vid}/{cid?}`
- **Description:** Get vehicles by vendor and category
- **Auth Required:** Yes

### 16.3 Product Detail
- **Endpoint:** `POST /api/v1/pickup-delivery/product-detail`
- **Description:** Get pickup/delivery product details
- **Auth Required:** Yes

### 16.4 Create Order
- **Endpoint:** `POST /api/v1/pickup-delivery/create-order`
- **Description:** Create pickup/delivery order
- **Auth Required:** Yes

### 16.5 Create Order Notifications
- **Endpoint:** `POST /api/v1/pickup-delivery/create-order-notifications`
- **Description:** Create order notifications
- **Auth Required:** Yes

### 16.6 Get Promo Code List
- **Endpoint:** `POST /api/v1/pickup-delivery/promo-code/list`
- **Description:** Get promo codes for pickup/delivery
- **Auth Required:** Yes

### 16.7 Verify Promo Code
- **Endpoint:** `POST /api/v1/pickup-delivery/promo-code/verify`
- **Description:** Verify promo code
- **Auth Required:** Yes

### 16.8 Remove Promo Code
- **Endpoint:** `POST /api/v1/pickup-delivery/promo-code/remove`
- **Description:** Remove promo code
- **Auth Required:** Yes

### 16.9 Order Tracking Details
- **Endpoint:** `POST /api/v1/pickup-delivery/order-tracking-details`
- **Description:** Get order tracking details
- **Auth Required:** Yes

### 16.10 Get All Riders
- **Endpoint:** `POST /api/v1/pickup-delivery/add-rider`
- **Description:** Get available riders
- **Auth Required:** Yes

### 16.11 Edit Order
- **Endpoint:** `POST /api/v1/pickup-delivery/edit-order`
- **Description:** Edit pickup/delivery order
- **Auth Required:** Yes

### 16.12 Create Bid Ride Request
- **Endpoint:** `POST /api/v1/create/user/bid_ride_request`
- **Description:** Create bid ride request
- **Auth Required:** Yes

### 16.13 Get Order Ride Bid Details
- **Endpoint:** `POST /api/v1/order-ride-bid-details`
- **Description:** Get bids for order ride
- **Auth Required:** Yes

### 16.14 Accept Ride Bid Request
- **Endpoint:** `POST /api/v1/accept-ride-bid-request`
- **Description:** Accept ride bid
- **Auth Required:** Yes

### 16.15 Decline Ride Bid
- **Endpoint:** `POST /api/v1/decline-ride-bid`
- **Description:** Decline ride bid
- **Auth Required:** Yes

### 16.16 Get Agents
- **Endpoint:** `POST /api/v1/get/agents`
- **Description:** Get available agents
- **Auth Required:** Yes

### 16.17 Upload Image Pickup
- **Endpoint:** `POST /api/v1/upload-image-pickup`
- **Description:** Upload image during pickup
- **Auth Required:** No

---

## 17. Subscription APIs

### 17.1 Get User Subscription Plans
- **Endpoint:** `GET /api/v1/user/subscription/plans`
- **Description:** Get available subscription plans for users
- **Auth Required:** Yes

### 17.2 Select Subscription Plan
- **Endpoint:** `GET /api/v1/user/subscription/selectPlan/{slug}`
- **Description:** Select subscription plan
- **Auth Required:** Yes

### 17.3 Purchase Subscription Plan
- **Endpoint:** `POST /api/v1/user/subscription/purchase/{slug}`
- **Description:** Purchase subscription plan
- **Auth Required:** Yes

### 17.4 Cancel Subscription Plan
- **Endpoint:** `POST /api/v1/user/subscription/cancel/{slug}`
- **Description:** Cancel subscription plan
- **Auth Required:** Yes

### 17.5 Check Active Subscription Plan
- **Endpoint:** `GET /api/v1/user/subscription/checkActivePlan/{slug}`
- **Description:** Check if subscription plan is active
- **Auth Required:** Yes

---

## 18. Gift Card APIs

### 18.1 Get Gift Card List
- **Endpoint:** `GET /api/v1/giftCard/list`
- **Description:** Get available gift cards
- **Auth Required:** Yes

### 18.2 Apply Gift Card
- **Endpoint:** `POST /api/v1/giftCard/apply`
- **Description:** Apply gift card code
- **Auth Required:** Yes

### 18.3 Remove Gift Card
- **Endpoint:** `POST /api/v1/giftCard/remove`
- **Description:** Remove applied gift card
- **Auth Required:** Yes

---

## 19. Chat APIs

### 19.1 Get All Chats
- **Endpoint:** `GET /api/v1/chat/all/{room_id?}`
- **Description:** Get all chat messages
- **Auth Required:** Yes
- **Parameters:** Optional room ID

### 19.2 Get User Chat
- **Endpoint:** `GET /api/v1/chat/user/{room_id?}`
- **Description:** Get user chat messages
- **Auth Required:** Yes

### 19.3 Start Chat
- **Endpoint:** `POST /api/v1/chat/startChat`
- **Description:** Start new chat
- **Auth Required:** Yes

### 19.4 Get Vendor Chat
- **Endpoint:** `GET /api/v1/chat/vendor/{room_id?}`
- **Description:** Get vendor chat messages
- **Auth Required:** Yes

### 19.5 Join Chat Room
- **Endpoint:** `POST /api/v1/chat/joinChatRoom`
- **Description:** Join chat room
- **Auth Required:** Yes

### 19.6 Send Message
- **Endpoint:** `POST /api/v1/chat/sendMessage`
- **Description:** Send chat message
- **Auth Required:** Yes

### 19.7 Fetch Order Detail
- **Endpoint:** `POST /api/v1/chat/fetchOrderDetail`
- **Description:** Fetch order details in chat
- **Auth Required:** Yes

### 19.8 User Vendor Chat Room
- **Endpoint:** `POST /api/v1/chat/userVendorChatRoom`
- **Description:** Get user-vendor chat room
- **Auth Required:** Yes

### 19.9 Vendor User Chat Room
- **Endpoint:** `POST /api/v1/chat/vendorUserChatRoom`
- **Description:** Get vendor-user chat room
- **Auth Required:** Yes

### 19.10 User Agent Chat Room
- **Endpoint:** `POST /api/v1/chat/userAgentChatRoom`
- **Description:** Get user-agent chat room
- **Auth Required:** Yes

### 19.11 Send Notification to User
- **Endpoint:** `POST /api/v1/chat/sendNotificationToUser`
- **Description:** Send notification to user
- **Auth Required:** Yes

### 19.12 S3 Sign
- **Endpoint:** `GET /api/v1/chat/s3-sign`
- **Description:** Get S3 signed URL for file upload
- **Auth Required:** Yes

---

## 20. Notification APIs

### 20.1 Get Notification List
- **Endpoint:** `GET /api/v1/notification-list`
- **Description:** Get user notifications
- **Auth Required:** Yes

### 20.2 Delete Notification
- **Endpoint:** `POST /api/v1/delete-notification`
- **Description:** Delete notification
- **Auth Required:** Yes

---

## 21. Card Management APIs

### 21.1 Add Card
- **Endpoint:** `POST /api/v1/add-card`
- **Description:** Add payment card
- **Auth Required:** Yes

### 21.2 Get Card Details
- **Endpoint:** `GET /api/v1/get-card-details`
- **Description:** Get saved card details
- **Auth Required:** Yes

### 21.3 Delete Card
- **Endpoint:** `POST /api/v1/delete-card`
- **Description:** Delete saved card
- **Auth Required:** Yes

---

## 22. Bidding APIs

### 22.1 Upload Bid Prescriptions
- **Endpoint:** `POST /api/v1/upload/bid/prescriptions`
- **Description:** Upload prescriptions for bidding
- **Auth Required:** Yes

### 22.2 Get Vendor Bid Prescriptions
- **Endpoint:** `GET /api/v1/get/vendor/bid/prescriptions/{vid?}`
- **Description:** Get vendor bid prescriptions
- **Auth Required:** Yes

### 22.3 Get User Bid Prescriptions
- **Endpoint:** `GET /api/v1/get/user/bid/prescriptions`
- **Description:** Get user bid prescriptions
- **Auth Required:** Yes

### 22.4 Delete Bid Prescriptions
- **Endpoint:** `POST /api/v1/delete/bid/prescriptions`
- **Description:** Delete bid prescriptions
- **Auth Required:** Yes

### 22.5 Search Vendor Product
- **Endpoint:** `GET /api/v1/get/vendor/product/search/{vid}/{key}`
- **Description:** Search vendor products for bidding
- **Auth Required:** Yes

### 22.6 Get User Bid Listing
- **Endpoint:** `GET /api/v1/get/user/bid/listing/{bid_id}`
- **Description:** Get user bid listing
- **Auth Required:** Yes

### 22.7 Add Bid Product to Cart
- **Endpoint:** `POST /api/v1/bid/add_bid_product_to_cart`
- **Description:** Add bid product to cart
- **Auth Required:** Yes

### 22.8 Reject Bid
- **Endpoint:** `POST /api/v1/bid/reject`
- **Description:** Reject bid
- **Auth Required:** Yes

### 22.9 Accept Bid
- **Endpoint:** `POST /api/v1/bid/accept`
- **Description:** Accept bid
- **Auth Required:** Yes

### 22.10 Place Bid
- **Endpoint:** `POST /api/v1/bid/placeBid`
- **Description:** Place new bid
- **Auth Required:** Yes

---

## 23. Influencer APIs

### 23.1 Get Refer Earn
- **Endpoint:** `GET /api/v1/influencer/refer-earn`
- **Description:** Get refer and earn details
- **Auth Required:** Yes

### 23.2 Get Influencer Form
- **Endpoint:** `GET /api/v1/influencer/get-influencer-form/{id}`
- **Description:** Get influencer form
- **Auth Required:** Yes

### 23.3 Save Influencer Form
- **Endpoint:** `POST /api/v1/influencer/save-influencer-form`
- **Description:** Save influencer form
- **Auth Required:** Yes

---

## 24. Loyalty APIs

### 24.1 Get Loyalty Info
- **Endpoint:** `GET /api/v1/user/loyalty/info`
- **Description:** Get user loyalty information
- **Auth Required:** Yes

---

## 25. Allergic Items APIs

### 25.1 Get Allergic Items
- **Endpoint:** `GET /api/v1/allergic-items`
- **Description:** Get list of allergic items
- **Auth Required:** No

### 25.2 Get User Allergic Items
- **Endpoint:** `GET /api/v1/user/allergic-items`
- **Description:** Get user's allergic items
- **Auth Required:** Yes

### 25.3 Add/Update Allergic Items
- **Endpoint:** `POST /api/v1/user/add-allergic-items`
- **Description:** Add or update allergic items
- **Auth Required:** Yes

### 25.4 Remove Allergic Items
- **Endpoint:** `POST /api/v1/user/remove-allergic-items/{id}`
- **Description:** Remove allergic item
- **Auth Required:** Yes

---

## 26. User Measurement APIs

### 26.1 Store Measurement
- **Endpoint:** `POST /api/v1/user/measurement`
- **Description:** Store user measurements
- **Auth Required:** Yes

### 26.2 Get User Measurement
- **Endpoint:** `GET /api/v1/my/measurement`
- **Description:** Get user measurements
- **Auth Required:** Yes

---

## 27. Search APIs

### 27.1 Global Search
- **Endpoint:** `POST /api/v1/search/{type}/{id?}`
- **Description:** Global search functionality
- **Auth Required:** No
- **Parameters:** 
  - `{type}` - search type
  - `{id?}` - optional ID

---

## 28. Brand APIs

### 28.1 Get Products by Brand
- **Endpoint:** `GET /api/v1/brand/{id?}`
- **Description:** Get products by brand
- **Auth Required:** No

### 28.2 Brand Filters
- **Endpoint:** `POST /api/v1/brand/filters/{id?}`
- **Description:** Get brand filter options
- **Auth Required:** No

---

## 29. Celebrity APIs

### 29.1 Get Celebrity List
- **Endpoint:** `GET /api/v1/celebrity/{all?}`
- **Description:** Get celebrity list
- **Auth Required:** No

### 29.2 Get Celebrity Products
- **Endpoint:** `GET /api/v1/celebrityProducts/{id?}`
- **Description:** Get products by celebrity
- **Auth Required:** No

### 29.3 Celebrity Filters
- **Endpoint:** `POST /api/v1/celebrity/filters/{id?}`
- **Description:** Get celebrity filter options
- **Auth Required:** No

---

## 30. CMS APIs

### 30.1 Get CMS Page List
- **Endpoint:** `GET /api/v1/cms/page/list`
- **Description:** Get list of CMS pages
- **Auth Required:** No

### 30.2 Get CMS Page Detail
- **Endpoint:** `POST /api/v1/cms/page/detail`
- **Description:** Get CMS page details
- **Auth Required:** No

---

## 31. Contact & Support APIs

### 31.1 Contact Us
- **Endpoint:** `POST /api/v1/contact-us`
- **Description:** Submit contact form
- **Auth Required:** No

### 31.2 Send Referral Code
- **Endpoint:** `POST /api/v1/send/referralcode`
- **Description:** Send referral code
- **Auth Required:** Yes

---

## 32. Store Management APIs (Vendor)

### 32.1 Get My Store Details
- **Endpoint:** `GET /api/v1/mystore`
- **Description:** Get vendor store details
- **Auth Required:** Yes

### 32.2 Get My Pending Orders
- **Endpoint:** `GET /api/v1/my_pending_orders`
- **Description:** Get pending orders for store
- **Auth Required:** Yes

### 32.3 Get My Store Product List
- **Endpoint:** `GET /api/v1/mystore/product/list`
- **Description:** Get store products
- **Auth Required:** Yes

### 32.4 Get My Store Vendors
- **Endpoint:** `GET /api/v1/mystore/vendors`
- **Description:** Get store vendors
- **Auth Required:** Yes

### 32.5 Get My Store Vendor Dashboard
- **Endpoint:** `GET /api/v1/mystore/vendor/dashboard/{id}`
- **Description:** Get vendor dashboard
- **Auth Required:** Yes

### 32.6 Get My Store Vendor Orders
- **Endpoint:** `GET /api/v1/mystore/vendor/orders/{id}`
- **Description:** Get vendor orders
- **Auth Required:** Yes

### 32.7 Get My Store Vendor Bag Orders
- **Endpoint:** `GET /api/v1/mystore/vendor/bagOrders/{qrcode?}`
- **Description:** Get bag orders by QR code
- **Auth Required:** Yes

### 32.8 Clear Bag Orders
- **Endpoint:** `GET /api/v1/mystore/vendor/clearBagOrders/{qrcode?}/{order_number?}`
- **Description:** Clear bag orders
- **Auth Required:** Yes

### 32.9 Reschedule Order
- **Endpoint:** `POST /api/v1/mystore/vendor/rescheduleOrder`
- **Description:** Reschedule order
- **Auth Required:** Yes

### 32.10 Vendor Category
- **Endpoint:** `POST /api/v1/mystore/vendor/category`
- **Description:** Get/update vendor category
- **Auth Required:** Yes

### 32.11 Add Product
- **Endpoint:** `POST /api/v1/mystore/product/add`
- **Description:** Add product to store
- **Auth Required:** Yes

### 32.12 Product Detail
- **Endpoint:** `POST /api/v1/mystore/product/detail`
- **Description:** Get product details
- **Auth Required:** Yes

### 32.13 Create Variant Rows
- **Endpoint:** `POST /api/v1/mystore/product/createvariant`
- **Description:** Create product variants
- **Auth Required:** Yes

### 32.14 Update Product
- **Endpoint:** `POST /api/v1/mystore/product/update`
- **Description:** Update product
- **Auth Required:** Yes

### 32.15 Delete Product
- **Endpoint:** `POST /api/v1/mystore/product/delete`
- **Description:** Delete product
- **Auth Required:** Yes

### 32.16 Delete Product Variant
- **Endpoint:** `POST /api/v1/mystore/product/deletevariant`
- **Description:** Delete product variant
- **Auth Required:** Yes

### 32.17 Add Product Image
- **Endpoint:** `POST /api/v1/mystore/product/addProductImage`
- **Description:** Add product image
- **Auth Required:** Yes

### 32.18 Get Product Images
- **Endpoint:** `POST /api/v1/mystore/product/getProductImages`
- **Description:** Get product images
- **Auth Required:** Yes

### 32.19 Delete Product Image
- **Endpoint:** `POST /api/v1/mystore/product/deleteimage`
- **Description:** Delete product image
- **Auth Required:** Yes

### 32.20 Update Product Status
- **Endpoint:** `POST /api/v1/mystore/product/status-update`
- **Description:** Update product status
- **Auth Required:** Yes

### 32.21 Get Vendor Product List
- **Endpoint:** `POST /api/v1/mystore/vendor/product/list`
- **Description:** Get vendor products
- **Auth Required:** Yes

### 32.22 Get Vendor Product Category List
- **Endpoint:** `GET /api/v1/mystore/vendor/product-category/list/{id}`
- **Description:** Get vendor product categories
- **Auth Required:** Yes

### 32.23 Get Vendor Products with Category List
- **Endpoint:** `GET /api/v1/mystore/vendor/products-with-category/list/{id}`
- **Description:** Get products with categories
- **Auth Required:** Yes

### 32.24 Get Product List Manual Order
- **Endpoint:** `GET /api/v1/mystore/vendors/get-product-list-manual`
- **Description:** Get product list for manual order
- **Auth Required:** Yes

### 32.25 Store Manual Order
- **Endpoint:** `POST /api/v1/mystore/vendor/store-manual-order`
- **Description:** Store manual order
- **Auth Required:** Yes

### 32.26 Add Product Attribute
- **Endpoint:** `POST /api/v1/mystore/product/addProductAttribute`
- **Description:** Add product attribute
- **Auth Required:** Yes

### 32.27 Get Product Attribute
- **Endpoint:** `GET /api/v1/mystore/product/getProductAttribute`
- **Description:** Get product attributes
- **Auth Required:** Yes

### 32.28 Get Available List of Attribute
- **Endpoint:** `GET /api/v1/mystore/product/availableListOfAttribute`
- **Description:** Get available attributes
- **Auth Required:** Yes

### 32.29 Add Product with Attribute
- **Endpoint:** `POST /api/v1/mystore/product/addProductWithAttribute`
- **Description:** Add product with attributes
- **Auth Required:** Yes

### 32.30 Delete Product with Attributes
- **Endpoint:** `POST /api/v1/mystore/product/deleteProductWithAttributes`
- **Description:** Delete product with attributes
- **Auth Required:** Yes

### 32.31 Update Order Status
- **Endpoint:** `POST /api/v1/update/order/status`
- **Description:** Update order status
- **Auth Required:** Yes

### 32.32 Get Store Revenue
- **Endpoint:** `POST /api/v1/store/revenue`
- **Description:** Get store revenue details
- **Auth Required:** Yes

### 32.33 Get Dashboard Details
- **Endpoint:** `POST /api/v1/vendor-dasboard-data`
- **Description:** Get vendor dashboard data
- **Auth Required:** Yes

### 32.34 Save Vendor Bank Details
- **Endpoint:** `POST /api/v1/user/saveVenderBankDetails`
- **Description:** Save vendor bank details
- **Auth Required:** Yes

---

## 33. Estimation APIs

### 33.1 Get Product Estimation with Addons
- **Endpoint:** `GET /api/v1/estimation/get-product-estimation-with-addons`
- **Description:** Get product estimation with addons
- **Auth Required:** No

### 33.2 Add Estimated Products in Cart
- **Endpoint:** `POST /api/v1/estimation/add-estimated-products-in-cart`
- **Description:** Add estimated products to cart
- **Auth Required:** No

### 33.3 Remove Products from Estimated Cart
- **Endpoint:** `POST /api/v1/estimation/remove-products-from-estimated-cart`
- **Description:** Remove products from estimated cart
- **Auth Required:** No

### 33.4 Remove Addons from Estimated Cart
- **Endpoint:** `POST /api/v1/estimation/remove-addons-from-estimated-cart`
- **Description:** Remove addons from estimated cart
- **Auth Required:** No

### 33.5 Get Estimation
- **Endpoint:** `POST /api/v1/estimation/get-estimation`
- **Description:** Get estimation details
- **Auth Required:** No

### 33.6 Assign Order QR Code
- **Endpoint:** `POST /api/v1/estimation/assign-order-qrcode`
- **Description:** Assign QR code to order
- **Auth Required:** No

### 33.7 Transfer Estimated Cart to Real Cart
- **Endpoint:** `POST /api/v1/estimation/transfer-estimated-cart-products-to-real-cart`
- **Description:** Transfer estimated cart to real cart
- **Auth Required:** No

---

## 34. MTN Mobile Money APIs

### 34.1 Create Token
- **Endpoint:** `POST /api/v1/mtn/create-token`
- **Description:** Create MTN Mobile Money token
- **Auth Required:** Yes

### 34.2 Get Response
- **Endpoint:** `GET /api/v1/mtn/response/{id?}`
- **Description:** Get MTN payment response
- **Auth Required:** Yes

---

## 35. Other APIs

### 35.1 Get Country List
- **Endpoint:** `GET /api/v1/auth/country-list`
- **Description:** Get list of countries
- **Auth Required:** No

### 35.2 Get News Letter
- **Endpoint:** `GET /api/v1/newsLetter`
- **Description:** Get newsletter subscription
- **Auth Required:** Yes

### 35.3 Get Hourly Base Price
- **Endpoint:** `GET /api/v1/get-hourly-base-price`
- **Description:** Get hourly base price
- **Auth Required:** Yes

### 35.4 Get Blockchain Address
- **Endpoint:** `POST /api/v1/get-blockchain-address`
- **Description:** Get blockchain address
- **Auth Required:** Yes

### 35.5 Get Free Lincer from Dispatcher
- **Endpoint:** `POST /api/v1/get_product_price_from_dispatcher`
- **Description:** Get product price from dispatcher
- **Auth Required:** No

### 35.6 Get Panel Detail
- **Endpoint:** `POST /api/v1/get-order-panel-detail`
- **Description:** Get order panel details
- **Auth Required:** Yes

### 35.7 Send Admin Notification
- **Endpoint:** `POST /api/v1/sendAdminNotification`
- **Description:** Send notification to admin
- **Auth Required:** Yes

### 35.8 Get User Registration Document
- **Endpoint:** `GET /api/v1/user/registration/document`
- **Description:** Get user registration documents
- **Auth Required:** No

### 35.9 STK Push Request
- **Endpoint:** `POST /api/v1/mfc/stk/push`
- **Description:** M-Pesa STK push request
- **Auth Required:** No

### 35.10 Get Slots from Dispatcher
- **Endpoint:** `POST /api/v1/getslotsFormDispatcher`
- **Description:** Get slots from dispatcher
- **Auth Required:** No

### 35.11 Get Dispatcher General Slot
- **Endpoint:** `GET /api/v1/getDispatcherGerenalSlot`
- **Description:** Get general slot from dispatcher
- **Auth Required:** No

### 35.12 Home Restaurants
- **Endpoint:** `GET /api/v1/home-restaurents`
- **Description:** Get home restaurants
- **Auth Required:** No

### 35.13 Category Restaurants
- **Endpoint:** `GET /api/v1/category-restaurents/{category_id}`
- **Description:** Get restaurants by category
- **Auth Required:** No

### 35.14 Passbase Store
- **Endpoint:** `POST /api/v1/passbase/store`
- **Description:** Store Passbase auth key
- **Auth Required:** No

### 35.15 Order After Payment
- **Endpoint:** `POST /api/v1/order/after/payment`
- **Description:** Handle order after payment
- **Auth Required:** No

### 35.16 Track Event
- **Endpoint:** `POST /api/v1/track-event`
- **Description:** Track user events
- **Auth Required:** Yes

### 35.17 Send Test Mail
- **Endpoint:** `POST /api/v1/sendTestMail`
- **Description:** Send test email
- **Auth Required:** No

### 35.18 Create Contact (Hubspot)
- **Endpoint:** `POST /api/v1/create-contact`
- **Description:** Create Hubspot contact
- **Auth Required:** Yes

### 35.19 Get Revenue Details
- **Endpoint:** `GET /api/v1/revenue-details`
- **Description:** Get revenue details
- **Auth Required:** Yes

---

## Notes

1. **Base URL:** All APIs are prefixed with `/api/v1`
2. **Authentication:** Most APIs require Bearer token in Authorization header
3. **Content-Type:** Use `application/json` for JSON requests, `multipart/form-data` for file uploads
4. **Response Format:** All APIs return JSON responses
5. **Error Handling:** Check response status codes and error messages in response body

---

## Version
**Version:** 1.0  
**Last Updated:** 2024  
**Maintained By:** Development Team

