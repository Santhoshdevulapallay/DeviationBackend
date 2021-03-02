(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["header-header-routing-module"],{

/***/ "./src/app/header/header-routing.module.ts":
/*!*************************************************!*\
  !*** ./src/app/header/header-routing.module.ts ***!
  \*************************************************/
/*! exports provided: HeaderRouting */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "HeaderRouting", function() { return HeaderRouting; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _header_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./header.component */ "./src/app/header/header.component.ts");
/* harmony import */ var _auth_auth_guard__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ../auth/auth.guard */ "./src/app/auth/auth.guard.ts");
/* harmony import */ var _home_notification_home_notification_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./home-notification/home-notification.component */ "./src/app/header/home-notification/home-notification.component.ts");







const routes = [
    { path: '', component: _header_component__WEBPACK_IMPORTED_MODULE_2__["HeaderComponent"], canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_3__["AuthGuard"]], children: [
            {
                path: 'notification', component: _home_notification_home_notification_component__WEBPACK_IMPORTED_MODULE_4__["HomeNotificationComponent"], canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_3__["AuthGuard"]]
            }
        ] },
];
class HeaderRouting {
}
HeaderRouting.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: HeaderRouting });
HeaderRouting.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function HeaderRouting_Factory(t) { return new (t || HeaderRouting)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
        _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](HeaderRouting, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]], exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](HeaderRouting, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
                exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
            }]
    }], null, null); })();


/***/ })

}]);
//# sourceMappingURL=header-header-routing-module-es2015.js.map