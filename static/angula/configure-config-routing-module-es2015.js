(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["configure-config-routing-module"],{

/***/ "./src/app/configure/config-routing.module.ts":
/*!****************************************************!*\
  !*** ./src/app/configure/config-routing.module.ts ***!
  \****************************************************/
/*! exports provided: ConfigRouting */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "ConfigRouting", function() { return ConfigRouting; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _configure_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./configure.component */ "./src/app/configure/configure.component.ts");
/* harmony import */ var _view_bills_view_bills_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./view-bills/view-bills.component */ "./src/app/configure/view-bills/view-bills.component.ts");
/* harmony import */ var _modify_bills_modify_bills_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./modify-bills/modify-bills.component */ "./src/app/configure/modify-bills/modify-bills.component.ts");







const routes = [
    { path: '', component: _configure_component__WEBPACK_IMPORTED_MODULE_2__["ConfigureComponent"] },
    { path: 'view-bills', component: _view_bills_view_bills_component__WEBPACK_IMPORTED_MODULE_3__["ViewBillsComponent"] },
    { path: 'modify-bills', component: _modify_bills_modify_bills_component__WEBPACK_IMPORTED_MODULE_4__["ModifyBillsComponent"] },
];
class ConfigRouting {
}
ConfigRouting.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: ConfigRouting });
ConfigRouting.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function ConfigRouting_Factory(t) { return new (t || ConfigRouting)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
        _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](ConfigRouting, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]], exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](ConfigRouting, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
                exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
            }]
    }], null, null); })();


/***/ })

}]);
//# sourceMappingURL=configure-config-routing-module-es2015.js.map