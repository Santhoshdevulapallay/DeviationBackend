function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["super-user-supuser-routing-module"], {
  /***/
  "./src/app/super-user/supuser-routing.module.ts":
  /*!******************************************************!*\
    !*** ./src/app/super-user/supuser-routing.module.ts ***!
    \******************************************************/

  /*! exports provided: SuperUserRouting */

  /***/
  function srcAppSuperUserSupuserRoutingModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "SuperUserRouting", function () {
      return SuperUserRouting;
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


    var _all_users_all_users_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! ./all-users/all-users.component */
    "./src/app/super-user/all-users/all-users.component.ts");
    /* harmony import */


    var _super_user_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./super-user.component */
    "./src/app/super-user/super-user.component.ts");
    /* harmony import */


    var _edit_contact_pending_contact_pending_contact_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ../edit-contact/pending-contact/pending-contact.component */
    "./src/app/edit-contact/pending-contact/pending-contact.component.ts");
    /* harmony import */


    var _edit_bankdetails_pending_bank_pending_bank_component__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(
    /*! ../edit-bankdetails/pending-bank/pending-bank.component */
    "./src/app/edit-bankdetails/pending-bank/pending-bank.component.ts");
    /* harmony import */


    var _auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(
    /*! ../auth/auth.guard */
    "./src/app/auth/auth.guard.ts");

    var routes = [{
      path: 'all-users',
      component: _all_users_all_users_component__WEBPACK_IMPORTED_MODULE_2__["AllUsersComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'all-applications',
      component: _super_user_component__WEBPACK_IMPORTED_MODULE_3__["SuperUserComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'pending-contactslist',
      component: _edit_contact_pending_contact_pending_contact_component__WEBPACK_IMPORTED_MODULE_4__["PendingContactComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }, {
      path: 'pending-banklist',
      component: _edit_bankdetails_pending_bank_pending_bank_component__WEBPACK_IMPORTED_MODULE_5__["PendingBankComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_6__["AuthGuard"]]
    }];

    var SuperUserRouting = function SuperUserRouting() {
      _classCallCheck(this, SuperUserRouting);
    };

    SuperUserRouting.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({
      type: SuperUserRouting
    });
    SuperUserRouting.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({
      factory: function SuperUserRouting_Factory(t) {
        return new (t || SuperUserRouting)();
      },
      imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)], _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
    });

    (function () {
      (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](SuperUserRouting, {
        imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]],
        exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
      });
    })();
    /*@__PURE__*/


    (function () {
      _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](SuperUserRouting, [{
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
//# sourceMappingURL=super-user-supuser-routing-module-es5.js.map