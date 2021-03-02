(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["payment-details-payment-routing-module"],{

/***/ "./src/app/payment-details/payment-routing.module.ts":
/*!***********************************************************!*\
  !*** ./src/app/payment-details/payment-routing.module.ts ***!
  \***********************************************************/
/*! exports provided: PaymentRouting */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, "PaymentRouting", function() { return PaymentRouting; });
/* harmony import */ var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! @angular/core */ "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
/* harmony import */ var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! @angular/router */ "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
/* harmony import */ var _payment_details_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./payment-details.component */ "./src/app/payment-details/payment-details.component.ts");
/* harmony import */ var _pending_payments_pending_payments_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./pending-payments/pending-payments.component */ "./src/app/payment-details/pending-payments/pending-payments.component.ts");
/* harmony import */ var _auth_auth_guard__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ../auth/auth.guard */ "./src/app/auth/auth.guard.ts");
/* harmony import */ var _weekly_disbursements_weekly_disbursements_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(/*! ./weekly-disbursements/weekly-disbursements.component */ "./src/app/payment-details/weekly-disbursements/weekly-disbursements.component.ts");








const routes = [
    { path: '', component: _payment_details_component__WEBPACK_IMPORTED_MODULE_2__["PaymentDetailsComponent"], canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_4__["AuthGuard"]] },
    { path: 'viewpayments', component: _pending_payments_pending_payments_component__WEBPACK_IMPORTED_MODULE_3__["PendingPaymentsComponent"], canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_4__["AuthGuard"]] },
    { path: 'weeklyDisbursements', component: _weekly_disbursements_weekly_disbursements_component__WEBPACK_IMPORTED_MODULE_5__["WeeklyDisbursementsComponent"], canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_4__["AuthGuard"]] },
];
class PaymentRouting {
}
PaymentRouting.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({ type: PaymentRouting });
PaymentRouting.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({ factory: function PaymentRouting_Factory(t) { return new (t || PaymentRouting)(); }, imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
        _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](PaymentRouting, { imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]], exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]] }); })();
/*@__PURE__*/ (function () { _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](PaymentRouting, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
                imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
                exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
            }]
    }], null, null); })();


/***/ })

}]);
//# sourceMappingURL=payment-details-payment-routing-module-es2015.js.map