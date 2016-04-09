"use strict";

import {Component} from "angular2/core";
import {ROUTER_DIRECTIVES, Router, RouterLink} from "angular2/router";

@Component({
    selector: "page-home",
    templateUrl: "pages/home/home.template.html",
    directives: [ROUTER_DIRECTIVES, RouterLink]
})
export class Home {
    title:string;
    constructor() {
        this.title = 'Hello World';
    }
}
