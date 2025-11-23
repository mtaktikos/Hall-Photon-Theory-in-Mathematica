#!/usr/bin/env wolframscript
(* WolframScript to convert the Mathematica notebook to PDF *)

(* Get the directory of this script *)
scriptDir = DirectoryName[$InputFileName];

(* Define file paths *)
notebookPath = FileNameJoin[{scriptDir, "HallPhotonTheoryInMathematica.nb"}];
pdfPath = FileNameJoin[{scriptDir, "HallPhotonTheoryInMathematica.pdf"}];

(* Print status *)
Print["Converting Mathematica notebook to PDF..."];
Print["Input: ", notebookPath];
Print["Output: ", pdfPath];

(* Check if notebook exists *)
If[!FileExistsQ[notebookPath],
  Print["ERROR: Notebook file not found: ", notebookPath];
  Exit[1];
];

(* Open the notebook *)
nb = NotebookOpen[notebookPath];

(* Export to PDF *)
Print["Exporting to PDF..."];
Export[pdfPath, nb, "PDF"];

(* Close the notebook *)
NotebookClose[nb];

Print["Done! PDF saved to: ", pdfPath];

(* Verify the output *)
If[FileExistsQ[pdfPath],
  info = FileInformation[pdfPath];
  Print["PDF file size: ", info["FileSize"], " bytes"];
  Print["PDF created: ", info["CreationDate"]];
  Exit[0];
,
  Print["ERROR: PDF export failed"];
  Exit[1];
];
