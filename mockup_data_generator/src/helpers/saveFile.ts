import fs from "fs";

export const saveAsJSON = function (data: any, path: string = __filename) {
  fs.writeFile(path + ".JSON", JSON.stringify(data), {}, (err) => {
    err ? console.error(err) : console.log("Data saved successfully");
  });
};

export const saveAsCSV = function (data: object, path: string = __dirname + "/result.csv") {
    const readyData : Array<any>= Object.keys(data)[0]
    console.log(data)
  try {
    //
  } catch {
    throw new Error("Something went wrong during data writing.");
  }
};
