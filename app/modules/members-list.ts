"use strict";

import {Component, Input} from "angular2/core";

@Component({
	selector: "members-list",
	templateUrl: "app/modules/member-list.template.html"
})
export class MembersList {
	@Input() members_left:Array<string>;
	constructor() {
		console.log('Members list is loaded.');
	}
}
