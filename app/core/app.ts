///<reference path="../../node_modules/angular2/typings/browser.d.ts"/>
"use strict";

// import Angular 2
import {Component} from "angular2/core";

// import Angular 2 Component Router
// reference: http://blog.thoughtram.io/angular/2015/06/16/routing-in-angular-2.html
import {RouteConfig, Route, RouterOutlet, RouterLink, Router, Location} from "angular2/router";

// app pages
import {Home} from "../pages/home/home";

// app modules

// app services

@Component({
    selector: "app",
    templateUrl: "core/app.template.html", //template: "<router-outlet></router-outlet>",
    directives: [RouterOutlet, RouterLink]
})
@RouteConfig([
    { path: "/", component: Home, as: "Home", data: undefined, useAsDefault: true}
])
export class App {
    constructor(public router:Router, private location:Location) {
        console.log("Application bootstrapped!");
    }
}
