function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["usercreation-usercreation-routing-module"], {
  /***/
  "./src/app/usercreation/usercreation-routing.module.ts":
  /*!*************************************************************!*\
    !*** ./src/app/usercreation/usercreation-routing.module.ts ***!
    \*************************************************************/

  /*! exports provided: UserCreation */

  /***/
  function srcAppUsercreationUsercreationRoutingModuleTs(module, __webpack_exports__, __webpack_require__) {
    "use strict";

    __webpack_require__.r(__webpack_exports__);
    /* harmony export (binding) */


    __webpack_require__.d(__webpack_exports__, "UserCreation", function () {
      return UserCreation;
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


    var _usercreation_component__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(
    /*! ./usercreation.component */
    "./src/app/usercreation/usercreation.component.ts");
    /* harmony import */


    var _mo_bankdetails_mo_bankdetails_component__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(
    /*! ./mo-bankdetails/mo-bankdetails.component */
    "./src/app/usercreation/mo-bankdetails/mo-bankdetails.component.ts");
    /* harmony import */


    var _userdetails_userdetails_component__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(
    /*! ./userdetails/userdetails.component */
    "./src/app/usercreation/userdetails/userdetails.component.ts");
    /* harmony import */


    var _auth_auth_guard__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(
    /*! ../auth/auth.guard */
    "./src/app/auth/auth.guard.ts");

    var routes = [{
      path: 'user-creation',
      component: _usercreation_component__WEBPACK_IMPORTED_MODULE_2__["UsercreationComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_5__["AuthGuard"]]
    }, {
      path: 'change-password',
      component: _userdetails_userdetails_component__WEBPACK_IMPORTED_MODULE_4__["UserdetailsComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_5__["AuthGuard"]]
    }, {
      path: 'add-account',
      component: _mo_bankdetails_mo_bankdetails_component__WEBPACK_IMPORTED_MODULE_3__["MoBankdetailsComponent"],
      canActivate: [_auth_auth_guard__WEBPACK_IMPORTED_MODULE_5__["AuthGuard"]]
    }];

    var UserCreation = function UserCreation() {
      _classCallCheck(this, UserCreation);
    };

    UserCreation.ɵmod = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineNgModule"]({
      type: UserCreation
    });
    UserCreation.ɵinj = _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵdefineInjector"]({
      factory: function UserCreation_Factory(t) {
        return new (t || UserCreation)();
      },
      imports: [[_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"].forChild(routes)], _angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
    });

    (function () {
      (typeof ngJitMode === "undefined" || ngJitMode) && _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵɵsetNgModuleScope"](UserCreation, {
        imports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]],
        exports: [_angular_router__WEBPACK_IMPORTED_MODULE_1__["RouterModule"]]
      });
    })();
    /*@__PURE__*/


    (function () {
      _angular_core__WEBPACK_IMPORTED_MODULE_0__["ɵsetClassMetadata"](UserCreation, [{
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
//# sourceMappingURL=usercreation-usercreation-routing-module-es5.js.map