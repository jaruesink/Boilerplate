"use strict";

// import Angular 2
import {Injectable} from "angular2/core";

@Injectable()
export class Members {
    members:Array<string>;
    constructor() {
        console.log('Members service is loaded.');
        this.members = [
            'Kurt King',
            'Kristin Mendoza',
            'Dalton Sumrall',
            'Bryan Deloeste',
            'Ricardo Castillo',
            'Christopher Doege',
            'Victor Le',
            'Jaren Thomas',
            'Danny Tsang',
            'Andrew Bennett',
            'Thomas Kercheville',
            'Jaynan San Jose',
            'Jarred Deeley',
            'Mark Garcia',
            'Mayra Lozano',
            'Trase Westbrook',
            'Nishant Grover',
            'Diego romero',
            'Andrew Hutton',
            'Shane Becker',
            'Alex Betancourt',
            'Steven Cenci',
            'Jonathan Villanueva',
            'Paul Szyller',
            'Triston Scallan',
            'Kyle Astl',
            'Miguel Cardenas',
            'Sohaib Qazi',
            'Ryan Zarmbinski',
            'Patrick Stockton',
            'Jeffrey Gutierrez',
            'Kyle Bolt',
            'Alifya Musa',
            'Amy Wong',
            'Bridget Rios',
            'Ruben Asebedo',
            'Taylor Gates',
            'Gustavo Chavez',
            'Comfort Olorunlero',
            'Connor Romeros',
            'Jiwan Ninglekhu',
            'Andrew Sanetra',
            'Michael Geyer',
            'Christopher Murray',
            'Nelson Torres',
            'David Patrick',
            'Mayur Bagul',
            'Richard Tran',
            'Joshua Weigand',
            'Javier Faustino',
            'Travis Lovaas',
            'Felix Benavides',
            'Steven Cenci',
            'Austin Mitchem',
            'Joy Rahman',
            'Mostafa Dabas',
            'Daniel Taylor',
            'Hector Zarate',
            'Narender Soorineeda',
            'Soe Than',
            'Felipe Garcia',
            'Julian Salas'
        ];
    }
}
