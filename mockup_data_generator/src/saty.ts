// @ts-nocheck
import mocker, { Generator } from "mocker-data-generator";
import {saveAsCSV, saveAsJSON} from "./helpers/saveFile"

/*
* toTest: faker.locale = "pl"
* One field to finish

* Using eval to bypass ts errors
* Remember to use proper quotation marks because it won't work
*/

/*  Problems
# From docs #
funcion: No params are passed, only context (this), in this you have {db, object, faker, chance}, and you can use faker or chance functions, object (the specified model), db (actual data generated)

Still does not work with typescript or I can't make it to do so.
Throws errors as {db, object, faker, chance} does not exist on object
#


Does not work with instance of a class - Throws JSON parse error
I guess it's because string values in class instance are wrapped in ' quotes.
*/


const satyGenerator = {
  wiek: {
    chance: 'integer({"min": 18, "max": 90})',
  },
  naukaLata: {
    function: function() : any{
            const isInSchoolAge = this.object.wiek <= 26 ? true : false;
            const SCHOOL_STARTING_AGE = 7;

            return (isInSchoolAge ? (this.object.wiek - SCHOOL_STARTING_AGE) : this.chance.integer({"min": 11, "max": 19})) 
        },
  },
  edukacja: {
    function: function(){
            let result : Array<string>;

            switch(true){
                case this.naukaLata < 15:
                    result = ["Szkola srednia", "Szkola zawodowa", "Policealna"]
                    break;
                default:
                    result = ["Licencjat", "Magiterium"];
            }
            return result[this.chance.integer({"min": 0, "max": (result.length - 1)})]
        },
  },
  plec: {
    values: ["Mezczyzna", "Kobieta"],
  },
  wiaraZyciePo: {
    values: ["Tak", "Nie"],
  },
  szczescie: {
    values: ["Dosc szczesliwy", "Nieszczesliwy", "Bardzo szczesliwy"],
  },
  jakieZycie: {
    values: ["Ekscytujace", "Rutynowe", "<NA>", "Nudne"],
  },
  fortunaAndPraca: {
    values: ["Tak", "Nie"],
  },
  gazetyCzesto: {
    values: ["Codziennie", "<NA>", "Mniej niz raz w tygodniu", "Raz w tygodniu", "Kilka razy w tygodniu", "Nigdy"],
  },
  ogladaTVGodz: {
    chance: 'integer({"min": 0, "max": 25})',
  },
  korzystaWWW: {
    values: ["Tak", "Nie"],
  },
  zodiak: {
    values: ["Waga", "Skorpion", "Ryby", "Byk", "Panna", "Lew", "Koziorozec", "Strzelec", "Wodnik", "Bliznieta", "Baran", "Rak", "<NA>"],
  },
  dochod: {
    values: ["not", "yet", "done"], //To complete
  },
  ileGodzPracuje: {
    chance: 'integer({"min": 0, "max": 14})',
  },
};

type saty = {
  wiek: number;
  naukaLata: number;
  edukacja: edukacja;
  plec: plec;
  wiaraZyciePo: takNie;
  szczescie: szczescie;
  jakieZycie: jakieZycie;
  fortunaAndPraca: takNie;
  gazetyCzesto: gazetyCzesto;
  ogladaTVGodz: number; // 0 - 25
  korzystaWWW: takNie;
  zodiak: zodiak;
  dochod: string;
  ileGodzPracuj: number; // 0 - 14
};

enum edukacja {
  "Szkola srednia",
  "Licencjat",
  "Magiterium",
  "Szkola zawodowa",
  "Policealna",
}
enum plec {
  "Mezczyzna",
  "Kobieta",
}
enum szczescie {
  "Dosc szczesliwy",
  "Nieszczesliwy",
  "Bardzo szczesliwy",
}
enum jakieZycie {
  "Ekscytujace",
  "Rutynowe",
  "<NA>",
  "Nudne",
}
enum gazetyCzesto {
  "Codziennie",
  "<NA>",
  "Mniej niz raz w tygodniu",
  "Raz w tygodniu",
  "Kilka razy w tygodniu",
  "Nigdy",
}
enum zodiak {
  "Waga",
  "Skorpion",
  "Ryby",
  "Byk",
  "Panna",
  "Lew",
  "Koziorozec",
  "Strzelec",
  "Wodnik",
  "Bliznieta",
  "Baran",
  "Rak",
  "<NA>",
}
enum takNie {
  "Tak",
  "Nie",
}

mocker()
  .schema("saty", satyGenerator, 5)
  .build()
  .then(
    (data : {saty: Array<saty>}) => {
            //console.log(typeof(data))
           // console.log(data)
            saveAsCSV(data)
            console.log("Done.");
    },
    (err) => console.log(err)
  );

