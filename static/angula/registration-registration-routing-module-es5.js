function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["registration-registration-routing-module"], {
  /***/
  "./src/app/registration/registration-routing.module.ts":
  /*!*************************************************************!*\
    !*** ./src/app/registration/registration-routing.module.ts ***!
    \*************************************************************/

  /*! exports provided: RegistrationRouting */

  /***/
  function srcAppRegistrationRegistrationRoutingModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "RegistrationRouting", function () {
      return RegistrationRouting;
    });
    /* harmony import */


    var _angular_core__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(
    /*! @angular/core */
    "./node_modules/@angular/core/__ivy_ngcc__/fesm2015/core.js");
    /* harmony import */


    var _angular_router__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(
    /*! @angular/router */
    "./node_modules/@angular/router/__ivy_ngcc__/fesm2015/router.js");
    /* harmony import */


    var _registration_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! ./registration.component */
    "./src/app/registration/registration.component.ts");
    /* harmony import */


    var _form_submitted_form_submitted_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ../form-submitted/form-submitted.component */
    "./src/app/form-submitted/form-submitted.component.ts");
    /* harmony import */


    var _edit_bankdetails_edit_bankdetails_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ../edit-bankdetails/edit-bankdetails.component */
    "./src/app/edit-bankdetails/edit-bankdetails.component.ts");
    /* harmony import */


    var _edit_contact_edit_contact_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(
    /*! ../edit-contact/edit-contact.component */
    "./src/app/edit-contact/edit-contact.component.ts");
    /* harmony import */


    var _auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(
    /*! ../auth/auth.guard */
    "./src/app/auth/auth.guard.ts");

    var routes = [{
      path: '',
      component: _registration_component__WEBPACK_IMPORTED_MODULE_2__["RegistrationComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'submitted',
      component: _form_submitted_form_submitted_component__WEBPACK_IMPORTED_MODULE_3__["FormSubmittedComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'edit-contact-details',
      component: _edit_contact_edit_contact_component__WEBPACK_IMPORTED_MODULE_5__["EditContactComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'edit-bank-details',
      component: _edit_bankdetails_edit_bankdetails_component__WEBPACK_IMPORTED_MODULE_4__["EditBankdetailsComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }];

    var RegistrationRouting = function RegistrationRouting() {
      _classCallCheck(this, RegistrationRouting);
    };

    RegistrationRouting.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({
      type: RegistrationRouting
    });
    RegistrationRouting.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({
      factory: function RegistrationRouting_Factory(t) {
        return new (t || RegistrationRouting)();
      },
      imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)], _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
    });

    (function () {
      (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](RegistrationRouting, {
        imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]],
        exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
      });
    })();
    /*@__PURE__*/


    (function () {
      _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](RegistrationRouting, [{
        type: _angular_core__WEBPACK_IMPORTED_MODULE_0__["NgModule"],
        args: [{
          imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)],
          exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
        }]
      }], null, null);
    })();
    /***/

  }
}]);
//# sourceMappingURL=registration-registration-routing-module-es5.js.map