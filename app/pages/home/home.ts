"use strict";

import {Component} from "angular2/core";
import {ROUTER_DIRECTIVES, Router, RouterLink} from "angular2/router";
import {Members} from '../../core/services/members.service';
import {MembersList} from "../../modules/members-list";

@Component({
    selector: "page-home",
    templateUrl: "pages/home/home.template.html",
    directives: [ROUTER_DIRECTIVES, RouterLink, MembersList]
})
export class Home {
    title:string;
    members:Array<string>;
	eliminated:string;
	winner:string;
	interval:number = 1000;
	progress:number = 0;
    constructor(private _members:Members) {
        this.title = 'The Final Countdown';
        this.members = this._members.members;
		this.removeRandom(this.members);
    }
    removeRandom(members:Array<string>) {
        var list_length = members.length - 1;
		var random = this.getRandom(0, list_length);
		if(list_length < 20 && list_length > 10) {
			this.interval = 2000;
		}
		if(list_length < 10) {
			this.interval = 5000;
		}
		if (list_length < 2 && list_length > 0) {
			this.eliminated = '';
			this.winner = members[random];
			this.members = [];
		} else if (list_length > 0) {
			this.eliminated = members[random];
			this.members.splice(random, 1);
			var timer_interval = this.interval/10;
			console.log('timer_interval', timer_interval);
			this.progress = 0;
			// setInterval( () => {
			// 	if (this.progress < 101) {
			// 		this.progress++;
			// 	}
			// }, timer_interval);
			setTimeout(() => {
				this.removeRandom(this.members);
			}, this.interval);
		}
    }
    getRandom(min:number, max:number) {
         return Math.floor(Math.random() * (max - min + 1)) + min;
    }
}
