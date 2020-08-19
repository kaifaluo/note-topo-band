(* ::Package:: *)

(* Quantum`Notation` 
     
	Copyright 2007-2012
   Jose Luis Gomez-Munoz
   ITESM-CEM, 
   Departamento de Ciencias B\[AAcute]sicas (Matem\[AAcute]ticas)
   Carretera Lago de Guadalupe Km. 3.5, 
   Atizap\[AAcute]n de Zaragoza, Estado de M\[EAcute]xico, 
   C.P. 52926
   Mexico
   jose.luis.gomez@itesm.mx
   http://homepage.cem.itesm.mx/lgomez/
   
   A package for Dirac Notation in Mathematica.
   This package may be freely redistributed under the condition that the   
   copyright notices (including this entire header) are not removed
   and no compensation is received.  Private, research, and institutional     
   use is free.  You may distribute modified versions of this code UNDER  
   THE CONDITION THAT THIS CODE AND ANY MODIFICATIONS MADE TO IT IN THE   
   SAME FILE REMAIN UNDER COPYRIGHT OF THE ORIGINAL AUTHOR, SOURCE
   CODE IS MADE FREELY AVAILABLE WITHOUT CHARGE, AND CLEAR    
   NOTICE IS GIVEN OF THE MODIFICATIONS.  Distribution of this code as
   part of a commercial system is permissible ONLY BY DIRECT ARRANGEMENT
   WITH THE AUTHOR.  (If you are not directly supplying this code to a
   customer, and you are instead telling them how they can obtain it for
   free, then you are not required to make any arrangement with me.)

*)

(*Author: Jose Luis Gomez-Munoz*)

BeginPackage[ "Quantum`Notation`"] 

Unprotect[
(* Quantum Computing and Occupation objects that must be declared here *)
	QuantumEvaluate, \[ScriptCapitalB], \[Dagger],
(****************)
	\[ScriptK]\[ScriptE]\[ScriptT],\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR],FactorKet,FactorKetList,CollectKet,
	$QuantumMaxCachedDefinitions,
	ClearAliases,zz080BraKet,zz050Subscript,
	QuantumTr,QuantumPartialTranspose,QuantumPartialTrace,
	MatrixToDirac,TensorToDirac,DiracToTensor,DiracToMatrix,
	VectorToDirac,DiracToVector,
	DiracEigensystem,DiracEigenvalues,DiracEigenvectors,
	QuantumNorm,QuantumNormalize,SetQuantumAliases,
	SetNotationAliases,
	SetQuantumObject,SetQuantumFunction,
	zz080Bra,zz080BraArgs,zz080Eigenstate,
	zz080HermitianConjugate,zz080Ket,zz080KetArgs,
	zz050Commutator,zz050AntiCommutator,
	zz075NonCommutativeTimes,zz080Operator,QuantumScalarQ,
	KetQ,
	CommutatorExpand,EvaluateCommutators,EvaluateAllCommutators,
	CollectFromLeft,CollectFromRight,
	QuantumToGraphics,DefineOperatorOnKets,QuantumReplace,
	QuantumDensityOperator,
	QuantumMeasurement,QuantumMeasurementResults,
	QuantumProduct,
	QuantumSum,VerifyOrderedCommutators,
	Anticommutators,NestedCommutators,ReverseOrdering,
	CenterDot,CircleTimes,SuperStar,SuperDagger,OverHat,DoubleBracketingBar,
	RowBox,Conjugate,
	Subscript
];

ClearAll[
(* Quantum Computing and Occupation objects that must be declared here *)
	QuantumEvaluate, \[ScriptCapitalB], \[Dagger],
(****************)
	\[ScriptK]\[ScriptE]\[ScriptT],\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR],FactorKet,FactorKetList,CollectKet,
	$QuantumMaxCachedDefinitions,
	ClearAliases, zz080BraKet, zz050Subscript,
	QuantumTr, QuantumPartialTranspose,QuantumPartialTrace,
	MatrixToDirac,TensorToDirac,DiracToTensor,DiracToMatrix,
	VectorToDirac,DiracToVector,
	DiracEigensystem,DiracEigenvalues,DiracEigenvectors,
	QuantumNorm,QuantumNormalize,SetQuantumAliases,
	SetNotationAliases,
	SetQuantumObject,SetQuantumFunction,SetQuantumScalar,
	zz080Bra,zz080BraArgs,zz080Eigenstate,
	zz080HermitianConjugate,zz080Ket,zz080KetArgs,
	zz050Commutator,zz050AntiCommutator,
	zz075NonCommutativeTimes,zz080Operator,QuantumScalarQ,
	KetQ,
	CommutatorExpand,EvaluateCommutators,EvaluateAllCommutators,
	CollectFromLeft,CollectFromRight,
	QuantumToGraphics,DefineOperatorOnKets,QuantumReplace,
	QuantumDensityOperator,
	QuantumMeasurement,QuantumMeasurementResults,
	QuantumProduct,
	QuantumSum,VerifyOrderedCommutators,
	Anticommutators,NestedCommutators,ReverseOrdering,
	CenterDot,CircleTimes,SuperStar,SuperDagger,OverHat,DoubleBracketingBar
];

SetQuantumAliases::aliases=
					"ALIASES:\n"<>
					"[ESC]ket[ESC]        ket template\n"<>
					"[ESC]bra[ESC]        bra template\n"<>
					"[ESC]braket[ESC]     braket template\n"<>
					"[ESC]op[ESC]         operator template\n"<>
					"[ESC].[ESC]          quantum concatenation infix symbol\n"<>
					"[ESC]on[ESC]         quantum concatenation infix symbol\n"<>
					"[ESC]tp[ESC]         tensor product infix symbol\n"<>
					"[ESC]qp[ESC]         quantum product template\n"<>					
					"[ESC]qs[ESC]         sigma notation for sums template\n"<>					
					"[ESC]si[ESC]         sigma notation for sums template\n"<>					
					"[ESC]ev[ESC]         eigenvalue-label template\n"<>
					"[ESC]eket[ESC]       eigenstate template\n"<>
					"[ESC]eeket[ESC]      two-operators-eigenstate template\n"<>
					"[ESC]eeeket[ESC]     three-operators-eigentstate template\n"<>
					"[ESC]ebra[ESC]       bra of eigenstate template\n"<>
					"[ESC]eebra[ESC]      bra of two-operators-eigenstate template\n"<>
					"[ESC]eeebra[ESC]     bra of three-operators-eigentstate"<>
					" template\n"<>
					"[ESC]ebraket[ESC]    braket of eigenstates template\n"<>
					"[ESC]eebraket[ESC]   braket of two-operators-eigenstates"<>
					" template\n"<>
					"[ESC]eeebraket[ESC]  braket of three-operators-eigentstate"<>
					" template\n"<>
					"[ESC]ketbra[ESC]     operator (matrix) element template\n"<>
					"[ESC]eketbra[ESC]    operator (matrix) element template\n"<>
					"[ESC]eeketbra[ESC]   operator (matrix) element template\n"<>
					"[ESC]eeeketbra[ESC]  operator (matrix) element template\n"<>
					"[ESC]her[ESC]        hermitian conjugate template\n"<>
					"[ESC]con[ESC]        complex conjugate template\n"<>
					"[ESC]norm[ESC]       quantum norm template\n"<>
					"[ESC]trace[ESC]      partial trace template\n"<>
					"[ESC]comm[ESC]       commutator template\n"<>
					"[ESC]anti[ESC]       anticommutator template\n"<>
					"[ESC]su[ESC]         subscript template\n"<>
					"[ESC]po[ESC]         power template\n"<>
    				"\nThe quantum concatenation infix symbol [ESC]on[ESC] is"<>
    				" used for operator application, inner product and outer product.\n"<>
					"\nSetQuantumAliases[] must be executed again in"<>
					" each new notebook that is created,"<>
					" only one time per notebook.";
SetQuantumAliases::usage=
					"SetQuantumAliases[] sets keyboard aliases in the"<>
					" selected notebook. SetQuantumAliases[notebook]"<>
					" sets keyboard aliases in the specified notebook."<>
					" The quantum aliases are keyboard key-combinations"<>
					" for the input of quantum objects in Dirac Notation.";
SetNotationAliases::usage=SetQuantumAliases::usage;
$QuantumMaxCachedDefinitions::usage="$QuantumMaxCachedDefinitions is an integer"<>
					" that defines the maximum amount of QuantumScalarQ definitions"<>
					" to be cached.";
SetQuantumObject::usage=
					"Execute SetQuantumObject[obj] so that obj is Not"<>
					" considered as a complex scalar by quantum functions";
SetQuantumScalar::usage=
					"Execute SetQuantumScalar[obj] so that obj is"<>
					" considered as a complex scalar by quantum functions";
SetQuantumFunction::usage=
					"Excecute SetQuantumFunction[fun] so thta fun[args]"<>
					" is Not considered as a complex scalar by quantum functions";
zz050Subscript::usage=
					"zz050Subscript is used for internall representation of"<>
					" subscripted kets and bras"
zz080Eigenstate::uket=	
					"zz080Ket[zz080Eigenstate[zz080Operator[H],v]] "<>
					"represents an eigenstate"<>
					" of operator H with eigenvalue v."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" eigenkets can be entered by pressing the"<>
					" keyboard keys [ESC]eket[ESC] or [ESC]eeket[ESC]";
zz080Eigenstate::ubra=	
					"zz080Bra[zz080Eigenstate[zz080Operator[H],v]]"<>
					" represents the dual"<>
					" of an eigenstate"<>
					" of operator H with eigenvalue v."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" eigenbras can be entered by pressing the"<>
					" keyboard keys [ESC]ebra[ESC] or [ESC]eebra[ESC]";
zz080Eigenstate::usage=	
					(zz080Eigenstate::uket)<>"\n"<>(zz080Eigenstate::ubra);
zz080Ket::usage=	"zz080Ket[a] is the internal representation"<>
					" of quantum state a."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" zz080Ket[] can be entered in standard form by pressing the"<>
					" keyboard keys [ESC]ket[ESC]\n"<>(zz080Eigenstate::uket);
zz080Bra::usage=	"zz080Bra[a] is the internal representation of the dual of"<>
					" quantum state a."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" zz080Bra[] can be entered in standard form by pressing the"<>
					" keyboard keys [ESC]bra[ESC]\n"<>(zz080Eigenstate::ubra);
zz080BraKet::usage=	"zz080BraKet internal quantum label"				
zz080Operator::usage=	
					"zz080Operator[H] is the internal representation"<>
					" of (base) operator H."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" zz080Operator[] can be entered in standard form"<>
					" by pressing the"<>
					" keyboard keys [ESC]op[ESC]";
OverHat::usage=		"OverHat is used for formating of zz080Operator[]\n"<>
					(zz080Operator::usage);
zz080KetArgs::usage= 	"zz080KetArgs is used for formating of Quantum objects";
zz080BraArgs::usage= 	"zz080BraArgs is used for formating of Quantum objects";
zz080TrArgs::usage= 	"zz080TrArgs is used for formating of Quantum objects";
zz075NonCommutativeTimes::usage=
					"zz075NonCommutativeTimes is the internal representation"<>
					" of products of quantum objects."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook, then"<>
					" zz075NonCommutativeTimes can be entered in standard form"<>
					" by pressing the"<>
					" keyboard keys [ESC]on[ESC]";
zz080HermitianConjugate::usage=
					"zz080HermitianConjugate[qobj] gives"<>
					" the Hermitian conjugate"<>
					" of qobj, which must be a linear combination of bras,"<>
					" kets, operands and"<>
					" complex numbers."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" zz080HermitianConjugate[] can be entered pressing"<>
					" [ESC]her[ESC]"; 
SuperDagger::usage=	"SuperDagger is used for formating"<>
					" of zz080HermitianConjugate\n"<>
					(zz080HermitianConjugate::usage);				
SuperStar::usage=	"SuperStar is used for formating of Conjugate\n"<>
					(Conjugate::usage);						
CenterDot::usage=	"CenterDot is used for formating"<>
					" of zz075NonCommutativeTimes\n"<>
					(zz075NonCommutativeTimes::usage);
CircleTimes::usage=	"CircleTimes is used for formating"<>
					" of zz075NonCommutativeTimes\n"<>
					(zz075NonCommutativeTimes::usage);
QuantumScalarQ::usage=	"QuantumScalarQ[z] will return True if z will be"<>
					" considered as a complex scalar in Quantum products";
KetQ::usage=	"KetQ[z] will return True if z is"<>
					" a ket or a linear combination of kets";
Times::ketket = 	"ERROR: The commutative multiplication"<>
					" (asterisk * or [SPACE]) between"<>
					" quantum objects `1` `2` is undefined."<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook, then"<>
					" the inner product, the tensor product and the application"<>
					" of an operator to a quantum object"<>
					" can be entered"<>
					" by pressing the keys [ESC]on[ESC] (it will be shown as"<>
					" the infix operator CenterDot \[CenterDot])";
zz080Eigenstate::ketrepop =
					"ERROR: Each operator must appear only one"<>
					" time in ket or bra";
QuantumNormalize::usage =
					"QuantumNormalize[qexpr] calculates the normalized\n"<>
					" version of qexpr";
QuantumNorm::usage =
					"QuantumNorm[qexpr] calculates the norm of qexpr\n"<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" QuantumNorm[] can be entered in"<>
					" standard form by pressing the"<>
					" keyboard keys [ESC]norm[ESC]";
QuantumTr::usage =	"QuantumTr[qexpr,zz080Operator[op]]"<>
					" calculates the partial trace"<>
					" of qexpr by collapse of op"<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" QuantumTr[] can be entered in"<>
					" standard form by pressing the"<>
					" keyboard keys [ESC]trace[ESC]";
QuantumPartialTrace::usage =	
					"QuantumPartialTrace[qexpr,zz080Operator[op]]"<>
					" calculates the partial trace"<>
					" of qexpr by collapse of op"<>
					"\nIf SetQuantumAliases[] has been executed"<>
					" in the notebook then"<>
					" QuantumTr[] can be entered in"<>
					" standard form by pressing the"<>
					" keyboard keys [ESC]tr[ESC]";
QuantumPartialTranspose::usage =	
					"QuantumPartialTranspose[qexpr,zz080Operator[op]]"<>
					" calculates the partial transpose"<>
					" of qexpr with respect to op";
DoubleBracketingBar::usage =
					"DoubleBracketingBar is used in the"<>
					" formating of QuantumNorm\n"<>
					(QuantumNorm::usage);
QuantumToGraphics::usage=
					"QuantumToGraphics[expr] generates a figure"<>
					" suitable for Copy-Paste to a word processor."<>
					" QuantumToGraphics[expr,ItemSize->size] specifies"<>
					" the size in m's of the image, but after generated,"<>
					" the image can be interactively resized without loosing"<>
					" resolution";
QuantumMeasurement::usage=
					"QuantumMeasurement[ket,{o1,o2,o3...}] measures\n"<>
					" operators o1,o2,... in ket and returns the result in the"<>
					" format QuantumMeasurementResults[{{prob1,measurement1,ket1},"<>
					" {prob2,measurement2,ket2},...}]";
QuantumMeasurement::nonket=
					"The first argument `1` is not a linear combination of kets.";
QuantumMeasurementResults::usage=
					"QuantumMeasurement[ket,{o1,o2,o3...}] measures\n"<>
					" operators o1,o2,... in ket and returns the result in the"<>
					" format QuantumMeasurementResults[{{prob1,measurement1,ket1},"<>
					" {prob2,measurement2,ket2},...}]";
QuantumMeasurementResults::assum=
					"Conflicting assumptions. This error might be produced by an"<>
					" attempt to use the measurement results"<>
					" for the wrong values of the parameters or variables";
QuantumReplace::usage=
					"QuantumReplace[exp,{rules}]"<>
					" makes replacement in kets, tensor product of kets"<>
					" bras and tensor product of bras"<>
					" Rules must have the same sintax"<>
					" as the rules used in the Mathematica "<>
					" command ReplaceAll[expr,{rules}]"<>
					" and in the Mathematica sintax expr/.{rules}";
QuantumDensityOperator::usage=
					"QuantumDensityOperator[QuantumMeasurement[ket,{o1,o2,o3...}]]"<>
					" transforms to the results of a measurement into a"<>
					" density operator";
DefineOperatorOnKets::usage=
					"DefineOperatorOnKets[op,{rules}]"<>
					" defines a new quantum operator."<>
					" Rules must have the same sintax"<>
					" as the rules used in the Mathematica "<>
					" command ReplaceAll[expr,{rules}]"<>
					" and in the Mathematica sintax expr/.{rules}";
TensorToDirac::usage=
					"TensorToDirac[tensor]"<>
					" transforms tensor (list of lists) into the correrponding"<>
					" Dirac notation, asuming operators with labels 1,2,3...";
MatrixToDirac::vect="Please use VectorToDirac for one-dimentional matrices (vectors)";
TensorToDirac::vect="Please use VectorToDirac for one-dimentional tensors (vectors)";
VectorToDirac::usage="VectorToDirac[vector,{dim1,dim2,...}]"<>
					" transforms vector into the correrponding"<>
					" Dirac notation, asuming operators with labels 1,2,3...,"<>
					" operator 1 with eigenvalues 0,1,2...dim1-1,"<>
					" operator 2 with eigenvalues 0,1,2...dim2-1, etc.";
DiracToVector::usage="DiracToVector[ket,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" transforms ket into the corresponding"<>
					" vector. The eigenvalues for each operator, ev11, ev12,... "<>
					" must be entered using the  operator template [ESC]ev[ESC]";
MatrixToDirac::usage=
					"MatrixToDirac[matrix,{dim1,dim2,...}]"<>
					" transforms matrix into the correrponding"<>
					" Dirac notation, asuming operators with labels 1,2,3...,"<>
					" operator 1 with eigenvalues 0,1,2...dim1-1,"<>
					" operator 2 with eigenvalues 0,1,2...dim2-1, etc.";
DiracToTensor::usage=
					"DiracToTensor[diracexpression,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" transforms diracexpression into the corresponding"<>
					" tensor. The eigenvalues for each operator, ev11, ev12,... "<>
					" must be entered using the  operator template [ESC]ev[ESC]";
DiracToTensor::wrongformat=
					"Each sublist in the second argument of DiracToTensor must"<>
					" have elements corresponding to the same operator";
DiracToTensor::obsolete=
					"The syntax for DiracToTensor or DiracToMatrix"<>
					" that you are using is OBSOLETE and "<>
					"it uses old programs that have some bugs. Please use the new "<>
					"syntax of DiracToTensor";
DiracEigensystem::usage=
					"DiracEigensystem[diracexpression,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" finds eigenvalues and eigenvectors for diracexpression."<>
					"  The eigenvalues for basis operators, ev11, ev12,... "<>
					" must be entered using the basis operator template [ESC]ev[ESC]";
DiracEigenvalues::usage=
					"DiracEigenvalues[diracexpression,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" finds eigenvalues for diracexpression."<>
					"  The eigenvalues for basis operators, ev11, ev12,... "<>
					" must be entered using the basis operator template [ESC]ev[ESC]";
DiracEigenvectors::usage=
					"DiracEigenvectors[diracexpression,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" finds eigenvectors for diracexpression."<>
					"  The eigenvalues for basis operators, ev11, ev12,... "<>
					" must be entered using the basis operator template [ESC]ev[ESC]";
DiracToMatrix::usage=
					"DiracToMatrix[diracexpression,{{ev11,ev12,...},{ev21,ev22,...},...}]"<>
					" transforms diracexpression into the corresponding"<>
					" matrix. The eigenvalues for each operator, ev11, ev12,... "<>
					" must be entered using the  operator template [ESC]ev[ESC]";
ClearAliases::usage="ClearAliases[] Erases all the keyboard aliases of the"<>
					" InputNotebook";
CollectFromLeft::usage="CollectFromLeft collects terms to the left of"<>
					" linear combinations of noncommutative products (concatenations)";
CollectFromRight::usage="CollectFromRight collects terms to the right of"<>
					" linear combinations of noncommutative products (concatenations)";
CommutatorExpand::usage="CommutatorExpand expands an expresion using commutators";
Anticommutators::usage="Anticommutators is an option for CommutatorExpand"<>
					" that specifies whether anticommutators should be generated"<>
					" instead of commutators";
NestedCommutators::usage="NestedCommutators is an option for CommutatorExpand"<>
					" that specifies whether nested commutators "<>
					" should be generated";
ReverseOrdering::usage="ReverseOrdering is an option for CommutatorExpand"<>
					" that specifies wheter reverse order or canonical order"<>
					" should be obtained in the terms resulting from the expansion";
EvaluateCommutators::usage="EvaluateCommutators[expr] evaluates commutators"<>
					" and anticommutators in the algebraic expression expr";
EvaluateAllCommutators::usage="EvaluateAllCommutators[expr] evaluates all commutators"<>
					" and anticommutators in the algebraic expression expr";
zz050Commutator::usage="zz050Commutator is used to represent the commutator";
zz050AntiCommutator::usage=
					"zz050AntiCommutator is used to represent the anti-commutator";
zz050Commutator::twoargs="The commutator `1` does not have two arguments";
zz050AntiCommutator::twoargs=
					"The anticommutator `1` does not have two arguments";
QuantumProduct::usage=
					"[ESC]qp[ESC]      Tensor-product template";
QuantumSum::usage=
					"QuantumSum is internally used for sums of quantum objects";
FactorKet::usage=
					"FactorKet[expr] factors tensor products of kets in expr."<>
					" Its output is returned inside a Hold command";
CollectKet::usage=
					"CollectKet[expr] rewrites expr as a linear"<>
					" combination of kets";
FactorKetList::usage=
					"FactorKetList[ket]"<>
					" returns the list of factors of kets in ket."<>
					" Its output is returned inside a Hold command";
zz020TPNotation::usage=
					"Internal Quantum object";
zz020TPNotationini::usage=
					"Internal Quantum object";
zz020TPNotationend::usage=
					"Internal Quantum object";
zz020TPNotationdat::usage=
					"Internal Quantum object";
QuantumEvaluate::usage=
					"Internal object";
zz080mod::usage=    "Internal object";					
zz080freeze::usage=	"Internal object";					

daggerFreeQ::usage= "Internal object";

removeDagger::usage= "Internal object";

zz090FlatSum::usage= "Internal object";

zz090NestedSum::usage= "Internal object";

VerifyOrderedCommutators::usage= "Internal object";

QuantumScalarQ::error= "Quantum Internal Error";

Options[DiracEigensystem] = Options[Eigensystem];

Options[QuantumToGraphics] = {ItemSize -> 28};

Options[CommutatorExpand] = 
	{Anticommutators->Automatic,
	Method->Automatic,
	NestedCommutators->False,
	ReverseOrdering->False};

Options[zz050Commutator] = 
	{ReverseOrdering->False};

Options[zz050AntiCommutator] = 
	{ReverseOrdering->False};

Options[QuantumMeasurement] =
	{Assumptions:>$Assumptions,FactorKet->True};	

Options[QuantumMeasurementResults] =
	{Assumptions:>$Assumptions,FactorKet->True};	

Begin["`Private`"]

SetAttributes[KetQ,Listable];
KetQ[HoldPattern[arg:Plus[_.*zz080Ket[__]..]]]:=True;
KetQ[HoldPattern[arg:Times[__,Plus[_.*zz080Ket[__]..]]]]:=True;
KetQ[HoldPattern[arg:(_.*zz080Ket[__])]]:=True;
KetQ[HoldPattern[zz080Ket[__]]]:=True;
KetQ[num_?NumberQ+rest_]:=
	If[Abs[num]<(100 * $MachineEpsilon),KetQ[rest],False,False];
KetQ[other_]:=False;

(* Defining scalars versus quantum objects *)

SetAttributes[QuantumScalarQ,Listable];

SetAttributes[InternalScalarQ,Listable];

QuantumScalarQ[args__]:=InternalScalarQ[args];

$QuantumMaxCachedDefinitions=1000;
storedDef=0;
autoresetScalarQ[]:=
Module[{},
	If[storedDef>$QuantumMaxCachedDefinitions,
		(* Print["DEBUG: reached $QuantumMaxCachedDefinitions"]; *)
		resetScalarQ[] ];
	storedDef++
];

(* Dynamic programming of QuantumScalarQ/InternalScalarQ *)
resetScalarQ[]:=
Module[{},
	Clear[InternalScalarQ];
	storedDef=0;

	(* A Graphics is NEVER considered as a scalar
		this property is used in Quantum`Computing`
		to allow the use of quantum circuits (diagrams)
		inside Dirac expressions
	*)
	InternalScalarQ[Graphics[args__]] := False;
	InternalScalarQ[Graphics3D[args__]] := False;

	InternalScalarQ[HoldPattern[Function[args__]]] := False;
	
	(* A multiplication is scalar only if every factor is a scalar.
	Only need to define it for two factors, because the
	attribute Flat (associative) of Times will take care
	of three factors, etc.*)
	InternalScalarQ[a_ * b_] := 
		If[TrueQ[And[Or[Head[a]=!=Symbol,Context[a]==="Global`"],
					Or[Head[b]=!=Symbol,Context[b]==="Global`"],
					FreeQ[{a,b},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[a * b] = And[InternalScalarQ[a], InternalScalarQ[b]],
			And[InternalScalarQ[a], InternalScalarQ[b]]
		];
	
	(* An addition is scalar only if every summand is a scalar.
	Only need to define it for two summands, because the
	attribute Flat (associative) of Plus will take care
	of three summands, etc.*)
	InternalScalarQ[a_ + b_] := 
		If[TrueQ[And[Or[Head[a]=!=Symbol,Context[a]==="Global`"],
					Or[Head[b]=!=Symbol,Context[b]==="Global`"],
					FreeQ[{a,b},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[a + b] = And[InternalScalarQ[a], InternalScalarQ[b]],
			And[InternalScalarQ[a], InternalScalarQ[b]]
		];

	(* A Power is scalar only if the base and the exponent are scalars *)
	InternalScalarQ[a_ ^ b_] := 
		If[TrueQ[And[Or[Head[a]=!=Symbol,Context[a]==="Global`"],
					Or[Head[b]=!=Symbol,Context[b]==="Global`"],
					FreeQ[{a,b},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[a ^ b] = And[InternalScalarQ[a], InternalScalarQ[b]],
			And[InternalScalarQ[a], InternalScalarQ[b]]
		];
		
	(* implementation of a second suggestion by Jean-Daniel: *)
	InternalScalarQ[HoldPattern[Sum[arg1_, args___]]] := 
		If[TrueQ[And[Or[Head[arg1]=!=Symbol,Context[arg1]==="Global`"],
					FreeQ[{arg1,args},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[Sum[arg1, args]] = InternalScalarQ[arg1],
			InternalScalarQ[arg1]
		];

	InternalScalarQ[HoldPattern[zz090FlatSum[arg1_, args___]]] := 
		If[TrueQ[And[Or[Head[arg1]=!=Symbol,Context[arg1]==="Global`"],
					FreeQ[{arg1,args},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[zz090FlatSum[arg1, args]] = InternalScalarQ[arg1],
			InternalScalarQ[arg1]
		];

	InternalScalarQ[HoldPattern[zz090NestedSum[arg1_, args___]]] := 
		If[TrueQ[And[Or[Head[arg1]=!=Symbol,Context[arg1]==="Global`"],
					FreeQ[{arg1,args},Pattern]]],
			autoresetScalarQ[];
			InternalScalarQ[zz090NestedSum[arg1, args]] = InternalScalarQ[arg1],
			InternalScalarQ[arg1]
		];
	
	(* QuantumSum is a quantum object always, see below aprox line 650 *)
	
	InternalScalarQ[HoldPattern[Defer[arg_]]]:=False;

	InternalScalarQ[HoldPattern[Hold[args__]]]:=False;
	
	InternalScalarQ[(Exp|Sin|Cos|Tan|Csc|Sec|Cot|Sinh|Cosh|Tanh|Csch|Sech|Coth)[arg_]]:=
		InternalScalarQ[arg];

	InternalScalarQ[Derivative[n___][fun_][vars___]]:=
		And[InternalScalarQ[fun],Apply[And,Map[InternalScalarQ,{vars}]]];

	InternalScalarQ[Derivative[n___][fun_]]:=InternalScalarQ[fun];

	InternalScalarQ[HoldPattern[ Dt[fun_] ]]:=InternalScalarQ[fun];

	InternalScalarQ[HoldPattern[ (D|Dt)[fun_,vn:({_,_}..),
									opts:OptionsPattern[]] ]]:=
		And[InternalScalarQ[fun],
			Apply[And,Map[InternalScalarQ[#[[1]]]&,{vn}]]];

	InternalScalarQ[HoldPattern[ (D|Dt)[fun_,vars__,
									opts:OptionsPattern[]] ]]:=
		And[InternalScalarQ[fun],
			Apply[And,Map[InternalScalarQ,{vars}]]];

	(* Next property is important for quantum computing gates that
	depend on parameters *)
	InternalScalarQ[h_[arg___]]:=InternalScalarQ[h];

	(* By default any other symbol or expression is asumed to represent a scalar *)
	InternalScalarQ[anyother_]:=True;
];

resetScalarQ[]; (* first time *)

(*SetQuantumFunction is obsolete, it is here only
for compatibility with older versions*)
SetQuantumFunction[x___]:=SetQuantumObject[x];

SetAttributes[SetQuantumObject,{Listable}];

SetQuantumObject[args__] := Map[SetQuantumObject,{args}] /; Length[{args}]>1;

SetQuantumObject[op_]:=
Module[{werep,wp2,objeto},

  resetScalarQ[]; (*erase (reset) dynamic programming*)
  
  objeto=Which[
  	Head[op] === Symbol,op,
  	Head[Head[op]]===Symbol,Head[op],
  	True,Print["ERROR: Could Not make Quantum Object "];
  	Message[QuantumScalarQ::error];QuantumDebug["debug467"];Abort[]
  ];
  
  werep = Unprotect[Evaluate[objeto]];
  With[{obj=objeto}, 
  	obj /: InternalScalarQ[op]:=False;
  	obj /: InternalScalarQ[op[arg___]]:=False(*;

  	obj /: Times[op,x_]:= 
		Module[{}, 
			Message[Times::ketket,op,x];
			Message[QuantumScalarQ::error];QuantumDebug["debug477"];Abort[];
    		"Error1"] /; 
   		And[	
   				op=!=x,
   				(x=!=0 && x=!=0.0 && op=!=Quiet[1/x]), 
   				Not[MatchQ[x,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Not[MatchQ[op,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Head[x]=!=Times,
   				Head[x]=!=Power,
   				Not[QuantumScalarQ[x]]];
  	obj /: Times[op[arg___],x_]:= 
		Module[{}, 
			Message[Times::ketket,op[arg],x];
			Message[QuantumScalarQ::error];QuantumDebug["debug492"];Abort[];
    		"Error1[]"] /; 
   		And[	
   				op[arg]=!=x,
   				(x=!=0 && x=!=0.0 && op[arg]=!=Quiet[1/x]), 
   				Not[MatchQ[x,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Not[MatchQ[op[arg],zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Head[x]=!=Times,
   				Head[x]=!=Power,
   				Not[QuantumScalarQ[x]]];
   	obj /: Times[op,x_^n_]:= 
		Module[{}, 
			Message[Times::ketket,op,x^n];
			Message[QuantumScalarQ::error];QuantumDebug["debug507"];Abort[];
    		"Error2"] /; 
   		And[	
   				op=!=x,
   				(x=!=0 && x=!=0.0 && op=!=Quiet[1/x]), 
   				Not[MatchQ[x,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Not[MatchQ[op,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Head[x]=!=Times,
   				Head[x]=!=Power,
   				Not[QuantumScalarQ[x]]];
   	obj /: Times[op[arg___],x_^n_]:= 
		Module[{}, 
			Message[Times::ketket,op[arg],x^n];
			Message[QuantumScalarQ::error];
			QuantumDebug[{"debug522",HoldForm[op[arg]],HoldForm[x^n]}];Abort[];
    		"Error2[]"] /; 
   		And[	
   				op[arg]=!=x,
   				(x=!=0 && x=!=0.0 && op[arg]=!=Quiet[1/x]),
   				Not[MatchQ[x,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   				Not[MatchQ[op[arg],zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],   				 
   				Head[x]=!=Times,
   				Head[x]=!=Power,
   				Not[QuantumScalarQ[x]]];
   	wp2 = Unprotect[Power,Times];

    	Power /: Times[base_^op,x_^n_]:= 
			Module[{}, 
				Message[Times::ketket,base^op,x^n];
				Message[QuantumScalarQ::error];QuantumDebug["debug538exp"];Abort[];
   		 		"Error3exponente"] /; 
   			And[	(x=!=0 && x=!=0.0 && base=!=Quiet[1/x]),
	   				Not[MatchQ[x,zz075NonCommutativeTimes[
	   							zz080Ket[b__], zz080Bra[a__]]]],
   					Not[MatchQ[base,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   					Head[x]=!=Times,
   					Head[x]=!=Power,
   					Or[Not[QuantumScalarQ[x]],Not[QuantumScalarQ[n]]]];

    	Power /: Times[base_^op[arg___],x_^n_]:= 
			Module[{}, 
				Message[Times::ketket,base^op[arg],x^n];
				Message[QuantumScalarQ::error];QuantumDebug["debug538exparg"];Abort[];
   		 		"Error3exponente"] /; 
   			And[	(x=!=0 && x=!=0.0 && base=!=Quiet[1/x]),
	   				Not[MatchQ[x,zz075NonCommutativeTimes[
	   							zz080Ket[b__], zz080Bra[a__]]]],
   					Not[MatchQ[base,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   					Head[x]=!=Times,
   					Head[x]=!=Power,
   					Or[Not[QuantumScalarQ[x]],Not[QuantumScalarQ[n]]]];

    	Power /: Times[op^m_,x_^n_]:= 
			Module[{}, 
				Message[Times::ketket,op^m,x^n];
				Message[QuantumScalarQ::error];QuantumDebug["debug538"];Abort[];
   		 		"Error3"] /; 
   			And[	
   					op=!=x, 
   					(x=!=0 && x=!=0.0 && op=!=Quiet[1/x]),
	   				Not[MatchQ[x,zz075NonCommutativeTimes[
	   							zz080Ket[b__], zz080Bra[a__]]]],
   					Not[MatchQ[op,zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],
   					Head[x]=!=Times,
   					Head[x]=!=Power,
   					Or[Not[QuantumScalarQ[x]],Not[QuantumScalarQ[n]]]];
    	Power /: Times[op[arg___]^m_,x_^n_]:= 
			Module[{}, 
				Message[Times::ketket,op[arg]^m,x^n];
				Message[QuantumScalarQ::error];QuantumDebug["debug553"];Abort[];
   		 		"Error3[]"] /; 
   			And[	
   					op[arg]=!=x,
   					(x=!=0 && x=!=0.0 && op[arg]=!=Quiet[1/x]), 
	   				Not[MatchQ[x,zz075NonCommutativeTimes[
	   							zz080Ket[b__], zz080Bra[a__]]]],
   					Not[MatchQ[op[arg],zz075NonCommutativeTimes[
   								zz080Ket[b__], zz080Bra[a__]]]],   				 
   					Head[x]=!=Times,
   					Head[x]=!=Power,
   					Or[Not[QuantumScalarQ[x]],Not[QuantumScalarQ[n]]]];
   	Protect@@wp2
	*)
   ]; 

  Protect@@werep;

	"The object "<>ToString[InputForm[op]]<>" will Not be considered as a complex scalar\n"<>
	"The object "<>ToString[InputForm[op]]<>"[args] will Not be considered as a complex scalar\n"<>
	If[objeto=!=Subscript,
		SetQuantumObject[Subscript[op,__]]<>SetQuantumObject[Subscript[op[___],__]],
		" "
	]
];


SetAttributes[SetQuantumScalar,{Listable}];

SetQuantumScalar[op_]:=
Module[{werep,wp2,objeto},

  resetScalarQ[]; (*erase (reset) dynamic programming*)

  objeto=Which[
  	Head[op] === Symbol,op,
  	Head[Head[op]]===Symbol,Head[op],
  	(*warning: if QuantumScalarQ is used as objeto, 
  	the corresponding definition will be erased by the next SetQuantumScalar or
  	SetQuantumObject, because of the resetScalarQ*)
  	True,Print["Could not create scalar Object"];QuantumDebug["debug618"];Abort[] 
  ];
  
  werep = Unprotect[Evaluate[objeto]];
  With[{obj=objeto}, 
  	obj /: InternalScalarQ[op]:=True;
  	obj /: InternalScalarQ[op[arg___]]:=True;
  	obj /: Times[op,x_]=. ;
  	obj /: Times[op[arg___],x_]=. ;
   	obj /: Times[op,x_^n_]=. ;  	
   	obj /: Times[op[arg___],x_^n_]=. ;
   	wp2 = Unprotect[Power, Times];
    	Power /: Times[op^m_,x_^n_]=. ;
    	Power /: Times[op[arg___]^m_,x_^n_]=. ;
   	Protect@@wp2
  	]; 
  Protect@@werep;

	"The object "<>ToString[InputForm[op]]<>" will be considered as a complex scalar\n"<>
	"The object "<>ToString[InputForm[op]]<>"[args] will be considered as a complex scalar\n"<>
	If[objeto=!=Subscript,
		SetQuantumScalar[Subscript[op,__]]<>SetQuantumScalar[Subscript[op[___],__]],
		" "
	]
];

(* following objects are Quantum objects (Nonscalars) *)
Map[SetQuantumObject,
	{	CenterDot, CircleTimes, \[ScriptK]\[ScriptE]\[ScriptT],FactorKet,
		zz080Ket,zz080Bra,zz080Eigenstate,
		zz080Operator,zz080KetArgs,zz080BraArgs,
		zz075NonCommutativeTimes,zz080HermitianConjugate,
		QuantumTr,QuantumPartialTranspose,QuantumPartialTrace,
		MatrixToDirac,TensorToDirac,
		VectorToDirac,
		zz080mod, (* zz080mod must be a quantum object*)
		zz080freeze, (* zz080freeze must be a quantum object*)
		zz050Commutator,zz050AntiCommutator,
		QuantumMeasurementResults,QuantumMeasurement,
		QuantumDensityOperator,
		QuantumProduct,QuantumSum,
		QuantumEvaluate
	}];
(* A braket is considered a complex number (scalar) *)
zz075NonCommutativeTimes /:
		InternalScalarQ[zz075NonCommutativeTimes[zz080Ket[x___], zz080Bra[y___]]] := True;

(* keyboard aliases [ESC]alias[ESC]*)

ClearAliases[]:=
Module[{nb},
	nb:=InputNotebook[];
	ClearAliases[nb]
];

ClearAliases[doc_NotebookObject]:=
	SetOptions[doc,InputAliases->{}];

SetNotationAliases[args___]:=SetQuantumAliases[args];

SetQuantumAliases[]:=
Module[{nb},
	nb:=InputNotebook[];
	SetQuantumAliases[nb]
];

SetQuantumAliases[doc_NotebookObject]:=
Module[{new},
    ClearAliases[];
    new={
		"on"  -> 	"\[CenterDot]",
		"tp"  -> 	"\[CircleTimes]",
		"op"  -> 	OverscriptBox["\[Placeholder]", "^"],
		"her"  -> 	SuperscriptBox[
						RowBox[{
							"(","\[Placeholder]",")"}], "\[Dagger]" ],		
		"con"  -> 	SuperscriptBox[
						RowBox[{
							"(","\[Placeholder]",")"}], "*" ],
		"comm" ->   TagBox[
						SubscriptBox[
							RowBox[{
							"\[LeftDoubleBracket]",
							TagBox[
								RowBox[{"\[Placeholder]",",","\[Placeholder]"}],
							zz080KetArgs,Editable->True,Selectable->True],
							"\[RightDoubleBracket]" }],
						"-"],
						zz050Commutator,Editable->False,Selectable->False],
		"anti" ->   TagBox[
						SubscriptBox[
							RowBox[{
							"\[LeftDoubleBracket]",
							TagBox[
								RowBox[{"\[Placeholder]",",","\[Placeholder]"}],
							zz080KetArgs,Editable->True,Selectable->True],
							"\[RightDoubleBracket]" }],
						"+"],
						zz050AntiCommutator,Editable->False,Selectable->False],
		"ket" -> 	TagBox[RowBox[{
							"\[VerticalSeparator]",
							TagBox["\[Placeholder]",
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]" }],
						zz080Ket,Editable->False,Selectable->False,
								BaseStyle->{ShowSyntaxStyles->False}],
		"ev" ->     SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
		"eval" ->   SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
		"eket" -> 	TagBox[RowBox[{
							"\[VerticalSeparator]",
							TagBox[RowBox[{		
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]" }],
						zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"eeket" -> 	TagBox[RowBox[{
							"\[VerticalSeparator]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]" }],
						zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"eeeket" -> TagBox[RowBox[{
							"\[VerticalSeparator]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]" }],
						zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"braket" ->	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox["\[Placeholder]",zz080BraArgs,
							Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]", 
							TagBox["\[Placeholder]",zz080KetArgs,
							Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]"
							}],
						zz080BraKet,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"ebraket" ->	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{		
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]", 
							TagBox[RowBox[{		
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]"
							}],
						zz080BraKet,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],						
		"eebraket" ->	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]", 
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]"
							}],
						zz080BraKet,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],						
		"eeebraket" ->	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]", 
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[RightAngleBracket]"
							}],
						zz080BraKet,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],												
		"bra" -> 	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox["\[Placeholder]",zz080BraArgs,
							Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]" }],
						zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"ebra" -> 	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{		
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]" }],
						zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"eebra" -> 	TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]" }],
						zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"eeebra" -> TagBox[RowBox[{
							"\[LeftAngleBracket]",
							TagBox[RowBox[{
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]],
								",",							
								SubscriptBox["\[Placeholder]",
									OverscriptBox["\[Placeholder]", "^"]]}],
							zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
							"\[VerticalSeparator]" }],
						zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
		"norm" -> RowBox[{"\[LeftDoubleBracketingBar]", "\[Placeholder]",
							"\[RightDoubleBracketingBar]"}],
		"trace" -> RowBox[{
					SubscriptBox[	"Tr", 
      								OverscriptBox["\[Placeholder]", "^"]], 
      				"[", "\[Placeholder]", "]"}],
		"ketbra" -> RowBox[{
					TagBox[RowBox[{"\[VerticalSeparator]",
          					TagBox["\[Placeholder]",zz080KetArgs,Editable->True,
            				Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],"\[RightAngleBracket]"}],
            			zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
            		"\[CenterDot]",
    				TagBox[RowBox[{"\[LeftAngleBracket]",
          					TagBox["\[Placeholder]",zz080BraArgs,Editable->True,
            				Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],"\[VerticalSeparator]"}],
            				zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}]}],
		"eketbra" -> RowBox[{
					TagBox[RowBox[{"\[VerticalSeparator]",
          					TagBox[SubscriptBox["\[Placeholder]",
              					OverscriptBox["\[Placeholder]","^"]],zz080KetArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[RightAngleBracket]"}],
          				zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
          			"\[CenterDot]",
    				TagBox[RowBox[{"\[LeftAngleBracket]",
          					TagBox[SubscriptBox["\[Placeholder]",
              					OverscriptBox["\[Placeholder]","^"]],zz080BraArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[VerticalSeparator]"}],
          				zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}]}],
         "eeketbra" -> RowBox[{
         			TagBox[RowBox[{"\[VerticalSeparator]",
          					TagBox[RowBox[{SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]]}],zz080KetArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[RightAngleBracket]"}],
          			zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
          			"\[CenterDot]",
					TagBox[RowBox[{"\[LeftAngleBracket]",
          					TagBox[RowBox[{SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]]}],zz080BraArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[VerticalSeparator]"}],
          				zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}]}],
          "eeeketbra" -> RowBox[{
          			TagBox[RowBox[{"\[VerticalSeparator]",
          					TagBox[RowBox[{SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]]}],zz080KetArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[RightAngleBracket]"}],
          				zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}],
          			"\[CenterDot]",
    				TagBox[RowBox[{"\[LeftAngleBracket]",
          					TagBox[RowBox[{SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]],",",
                				SubscriptBox["\[Placeholder]",
                  				OverscriptBox["\[Placeholder]","^"]]}],zz080BraArgs,
            					Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
          					"\[VerticalSeparator]"}],
          				zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}]}],
     	"su" ->		SubscriptBox["\[Placeholder]","\[Placeholder]"],
     	"po" ->		SuperscriptBox[RowBox[{"(","\[Placeholder]",")"}],"\[Placeholder]"],
     	"pow" ->	   SuperscriptBox[RowBox[{"(","\[Placeholder]",")"}],"\[Placeholder]"],
     	"si" ->		RowBox[{UnderoverscriptBox["\[Sum]",
     							"\[Placeholder]","\[Placeholder]"],"\[Placeholder]" }],
     	"qs" ->		RowBox[{UnderoverscriptBox["\[Sum]",
     							"\[Placeholder]","\[Placeholder]"],"\[Placeholder]" }],
		"qp" ->	
				TagBox[
					RowBox[{
						UnderoverscriptBox[
								"\[CircleTimes]", 
								TagBox[
									"\[Placeholder]",
									zz020TPNotationini,Editable->True,Selectable->True], 
								TagBox[
									"\[Placeholder]",
									zz020TPNotationend,Editable->True,Selectable->True]],
						TagBox["\[Placeholder]",
									zz020TPNotationdat,Editable->True,Selectable->True]}],
					zz020TPNotation,Editable->False,Selectable->False]
	};

	SetOptions[doc,InputAliases->new];
	SetQuantumAliases::aliases];

(*******************************************************************)
(****************** TRADITIONAL FORM *******************************)
(*******************************************************************)

gwasp=Unprotect[Graphics,Graphics3D];
Graphics /: TraditionalForm[Graphics[garg__],args___]:=
With[{qinfo=Cases[Graphics[garg], Tooltip[g_List, e_] :> e, Infinity]}, 
	TraditionalForm[Part[qinfo,1],args]/;
	Length[qinfo]===1
];
Graphics3D /: TraditionalForm[Graphics3D[garg__],args___]:=
With[{qinfo=Cases[Graphics3D[garg], Tooltip[g_List, e_] :> e, Infinity]}, 
	TraditionalForm[Part[qinfo,1],args]/;
	Length[qinfo]===1
];
Protect@@gwasp;

(* CenterDot is not generated in TraditionalForm *) 

zz075NonCommutativeTimes /: MakeBoxes[zz075NonCommutativeTimes[x__], TraditionalForm] := 
Module[{boxes,replaceme,myHold,y},

	SetAttributes[myHold,HoldAll];
	Reverse[myHold[x]] /. 
		myHold[y___]:>(boxes=(MakeBoxes[CenterDot[y], TraditionalForm] /.
			"\[CenterDot]"->"\[InvisibleSpace]")); 

	ReleaseHold[Hold[InterpretationBox[replaceme,zz075NonCommutativeTimes[x]]] /.
		replaceme->boxes]
];

zz050Commutator /: 
MakeBoxes[zz050Commutator[arg1_,arg2_,OptionsPattern[]], TraditionalForm]:=
	MakeBoxes[zz050Commutator[arg1,arg2],TraditionalForm];

zz050Commutator /: MakeBoxes[zz050Commutator[arg1_,arg2_], TraditionalForm] :=
Module[{boxes,replaceme},
	boxes=MakeBoxes[{arg1,arg2},TraditionalForm]/.
		{"{"->"[", "}"->"]"};
	ReleaseHold[Hold[InterpretationBox[replaceme,zz050Commutator[arg1,arg2]]] /.
		replaceme->boxes]
];

zz050AntiCommutator /: 
MakeBoxes[zz050AntiCommutator[arg1_,arg2_,OptionsPattern[]], TraditionalForm]:=
	MakeBoxes[zz050AntiCommutator[arg1,arg2],TraditionalForm];

zz050AntiCommutator /: MakeBoxes[zz050AntiCommutator[arg1_,arg2_], TraditionalForm] :=
Module[{boxes,replaceme},
	boxes=MakeBoxes[{arg1,arg2},TraditionalForm];
	ReleaseHold[Hold[InterpretationBox[replaceme,zz050AntiCommutator[arg1,arg2]]] /.
		replaceme->boxes]
];

(* Format for copy-paste to word processor. The user has the option
to combine (or not) this command with TraditionalForm *)

QuantumToGraphics[graph:((Graphics|Graphics3D)[___]),opts___Rule]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	QuantumToGraphics[Part[qinfo,1],opts]/;
	Length[qinfo]===1
];


If[TrueQ[$VersionNumber<6],
	QuantumToGraphics[expression_,opts___Rule]:=
	Module[{size},
			"Not implemented in Mathematica 5"
	],
	QuantumToGraphics[expression_,opts___Rule]:=
		Module[{size},
		size=ItemSize/.{opts}/.Options[QuantumToGraphics];
		Show[
			With[{fig = 
					ImportString[
						ExportString[Grid[{{expression}}, ItemSize -> size], "PDF"], 
						"PDF"]},
  				If[Head[fig] == List, First[fig], fig, fig]
  			],
 			ImageSize -> (7*72)
		]
	]
];

(* Subscript corrections: 
   The StandardForm representation of 
   Subscript[zz080Operator[a], b]
   and
   zz080Operator[Subscript[a,b]]
   are so similar that the human user expects them to be the same.
   Same happens with the hermitian conjugate.
   Therefore, they are transformed to be the same: *)
zz080Operator /:
Subscript[zz080Operator[a__], b__]:=
	zz080Operator[Subscript[a,b]];

zz080HermitianConjugate /:
Subscript[zz080HermitianConjugate[a__], b__]:=
	zz080HermitianConjugate[Subscript[a,b]];

(* Ket and bra attributes*)
SetAttributes[zz080Ket,{Orderless,NHoldAll}];
SetAttributes[zz080Bra,{Orderless,NHoldAll}];

(* A subscripted Ket must be considered as a Ket *)
zz080Ket /:
	Subscript[zz080Ket[arg__],sub__]:=
		zz080Ket[zz050Subscript[{arg},{sub}]];

zz080Bra /:
	Subscript[zz080Bra[arg__],sub__]:=
		zz080Bra[zz050Subscript[{arg},{sub}]];

zz080Ket[	zz050Subscript[{arg1__},{subsame__}],
			zz050Subscript[{arg2__},{subsame__}],
			otherKetArg___]:=
	zz080Ket[zz050Subscript[{arg1,arg2},{subsame}],otherKetArg];

zz080Bra[	zz050Subscript[{arg1__},{subsame__}],
			zz050Subscript[{arg2__},{subsame__}],
			otherKetArg___]:=
	zz080Bra[zz050Subscript[{arg1,arg2},{subsame}],otherKetArg];	
	
zz080Ket /:
	MakeBoxes[
			zz080Ket[
				zz050Subscript[{up:__},{dn:__}],
				otherKetArg__:None],form_]:=
Module[{},
	If[otherKetArg===None,
		(* Show like subscripted ket *)
		MakeBoxes[Subscript[zz080Ket[up],dn],form],
		(* Show like tensor product of a non-subscripted ket and a subscripted ket *)
		MakeBoxes[CircleTimes[Subscript[zz080Ket[up],dn],zz080Ket[otherKetArg]],form]
	]
]/;
Not[MemberQ[{otherKetArg},zz050Subscript[__]]];
	
zz080Ket /:
	MakeBoxes[
			zz080Ket[
				subscripts:(zz050Subscript[{__},{__}]..),
				otherKetArg__:None],form_]:= 
		Module[{ketlist,large},
			ketlist=zz080Ket /@ {subscripts};
			If[otherKetArg===None,
				(* Show like tensor product of subscripted kets *)
				Apply[MakeBoxes[CircleTimes[##],form]&,ketlist],
				(* Show like tensor product of a non-subscripted ket and subscripted kets *)
				MakeBoxes[CircleTimes[zz080Ket[subscripts],zz080Ket[otherKetArg]],form]
			]
		] /; 
And[Not[MemberQ[{otherKetArg},zz050Subscript[__]]],
	Length[{subscripts}]>1];

zz080Bra /:
	MakeBoxes[
			zz080Bra[
				zz050Subscript[{up:__},{dn:__}],
				otherKetArg__:None],form_]:=
Module[{},
	If[otherKetArg===None,
		(* Show like subscripted bra *)
		MakeBoxes[Subscript[zz080Bra[up],dn],form],
		(* Show like tensor product of a non-subscripted bra and a subscripted bra *)
		MakeBoxes[CircleTimes[Subscript[zz080Bra[up],dn],zz080Bra[otherKetArg]],form]
	]
]/;
Not[MemberQ[{otherKetArg},zz050Subscript[__]]];
	
zz080Bra /:
	MakeBoxes[
			zz080Bra[
				subscripts:(zz050Subscript[{__},{__}]..),
				otherKetArg__:None],form_]:= 
		Module[{ketlist,large},
			ketlist=zz080Bra /@ {subscripts};
			If[otherKetArg===None,
				(* Show like tensor product of subscripted bras *)
				Apply[MakeBoxes[CircleTimes[##],form]&,ketlist],
				(* Show like tensor product of a non-subscripted bra and subscripted bras *)
				MakeBoxes[CircleTimes[zz080Bra[subscripts],zz080Bra[otherKetArg]],form]
			]
		] /; 
And[Not[MemberQ[{otherKetArg},zz050Subscript[__]]],
	Length[{subscripts}]>1];


(*Correct parenthesis*)
RowBox[{"(", TagBox[arg_, zz080Ket, opts___], ")"}] := 
	TagBox[arg, zz080Ket, opts];
RowBox[{"(", TagBox[arg_, zz080Bra, opts___], ")"}] := 
	TagBox[arg, zz080Bra, opts];
RowBox[{"(", SubscriptBox[args___], ")"}] := 
	SubscriptBox[args];
RowBox[{"-",RowBox[{"(",RowBox[{arg1_,"\[CenterDot]",args2__}],")"}]}]:=
	RowBox[{"-",RowBox[{arg1,"\[CenterDot]",args2}]}];
RowBox[{"(", InterpretationBox[form_,zz075NonCommutativeTimes[ncarg__]], ")"}]:=
	InterpretationBox[form,zz075NonCommutativeTimes[ncarg]];	
RowBox[{"(", InterpretationBox[form_,zz080Ket[arg__]], ")"}]:=
	InterpretationBox[form,zz080Ket[arg]];	
	
(*Output and input of ket*)
zz080Ket /: MakeBoxes[zz080Ket[x__], form_] := 
	TagBox[	RowBox[{
				"\[VerticalSeparator]",
					TagBox[DeleteCases[MakeBoxes[{x}, form] , "{" | "}", 2],
						zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
				"\[RightAngleBracket]" }],
			zz080Ket,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}] /; 
	Not[MemberQ[Hold[x],zz050Subscript[__]]];

MakeExpression[
	TagBox[	RowBox[{
				"\[VerticalSeparator]",
				TagBox[x__,zz080KetArgs,opts1___],
				"\[RightAngleBracket]" }],
			zz080Ket,opts2___], form_] := 
	MakeExpression[RowBox[{"zz080Ket", "[", x, "]"}], form];

(*Output and input of bra*)
zz080Bra /: MakeBoxes[zz080Bra[x__], form_] := 
	TagBox[	RowBox[{
				"\[LeftAngleBracket]",
					TagBox[DeleteCases[MakeBoxes[{x}, form] , "{" | "}", 2],
						zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
				 "\[VerticalSeparator]"}],
			zz080Bra,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}] /; 
	Not[MemberQ[Hold[x],zz050Subscript[__]]];

MakeExpression[
	TagBox[	RowBox[{
				"\[LeftAngleBracket]",
				TagBox[x__,zz080BraArgs,opts1___],
				"\[VerticalSeparator]" }],
			zz080Bra,opts2___], form_] := 
	MakeExpression[RowBox[{"zz080Bra", "[", x, "]"}], form];

(*Output and input of brakets (actually, bra-kets)*)
zz075NonCommutativeTimes /: 
	MakeBoxes[zz075NonCommutativeTimes[zz080Ket[y___], zz080Bra[x___]], form_] := 
	TagBox[	RowBox[{
				"\[LeftAngleBracket]",
				TagBox[DeleteCases[MakeBoxes[{x}, form] , "{" | "}", 2],
					zz080BraArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
				 "\[VerticalSeparator]",
				 TagBox[DeleteCases[MakeBoxes[{y}, form] , "{" | "}", 2],
					zz080KetArgs,Editable->True,Selectable->True,
										BaseStyle->{ShowSyntaxStyles->True}],
				"\[RightAngleBracket]"
				 }],
			zz080BraKet,Editable->False,Selectable->False,
										BaseStyle->{ShowSyntaxStyles->False}] /;
	Not[MemberQ[Join[{x},{y}],zz050Subscript[__]]];

MakeExpression[
	TagBox[	RowBox[{
				"\[LeftAngleBracket]",
				TagBox[x__,zz080BraArgs,optsbra___],
				"\[VerticalSeparator]",
				TagBox[y__,zz080KetArgs,optsket___],
				"\[RightAngleBracket]"
			}],
			zz080BraKet,optsbraket___], form_] := 
	MakeExpression[
		RowBox[{
			"zz080BraKet", 
			"[", 	
				RowBox[{
					RowBox[{"{", x, "}"}], ",",
					RowBox[{"{", y, "}"}]
				}], 
			"]"    
    	}], 
    form];
    
zz080BraKet[{a___},{b___}] := zz075NonCommutativeTimes[zz080Ket[b],zz080Bra[a]];

powwasp2=Unprotect[Power];
(* output and input of commutators *)
zz050Commutator /: MakeBoxes[zz050Commutator[args__,OptionsPattern[]], form_] := 
	TagBox[SubscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[DeleteCases[MakeBoxes[{args}, form] , "{" | "}", 2],
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"-"],
		zz050Commutator,Editable->False,Selectable->False];

MakeExpression[
	TagBox[SubscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					x__,
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"-"],
		zz050Commutator,Editable->False,Selectable->False],form_]:=
	MakeExpression[RowBox[{"zz050Commutator", "[", x,"]"}], form];

(* output and input of powers of commutators *)
Power /: MakeBoxes[
	Power[zz050Commutator[args__,OptionsPattern[]],expo_], StandardForm] := 
	TagBox[SubsuperscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[DeleteCases[MakeBoxes[{args}, StandardForm] , "{" | "}", 2],
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"-",
			MakeBoxes[expo,StandardForm]],
		zz050Commutator,Editable->False,Selectable->False];

MakeExpression[
	TagBox[SubsuperscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					x__,
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"-",expobox_],
		zz050Commutator,Editable->False,Selectable->False],form_]:=
	MakeExpression[
		SuperscriptBox[RowBox[{"zz050Commutator", "[", x,"]"}],expobox], form];

(* output and input of anticommutators *)
zz050AntiCommutator /: MakeBoxes[zz050AntiCommutator[args__,OptionsPattern[]], form_] := 
	TagBox[SubscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					DeleteCases[MakeBoxes[{args}, form] , "{" | "}", 2],
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"+"],
		zz050AntiCommutator,Editable->False,Selectable->False];

MakeExpression[
	TagBox[SubscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					x__,
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"+"],
		zz050AntiCommutator,Editable->False,Selectable->False],form_]:=
	MakeExpression[RowBox[{"zz050AntiCommutator", "[", x,"]"}], form];

(* output and input of powers of anticommutators *)
Power /: MakeBoxes[
	Power[zz050AntiCommutator[args__,OptionsPattern[]],expo_], StandardForm] := 
	TagBox[SubsuperscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					DeleteCases[MakeBoxes[{args}, StandardForm] , "{" | "}", 2],
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"+",
			MakeBoxes[expo,StandardForm]],
		zz050AntiCommutator,Editable->False,Selectable->False];

MakeExpression[
	TagBox[SubsuperscriptBox[
			RowBox[{
				"\[LeftDoubleBracket]",
				TagBox[
					x__,
					zz080KetArgs,Editable->True,Selectable->True],
				"\[RightDoubleBracket]" }],
			"+",expobox_],
		zz050AntiCommutator,Editable->False,Selectable->False],form_]:=
	MakeExpression[
		SuperscriptBox[RowBox[{"zz050AntiCommutator", "[", x,"]"}],expobox], form];
	
Protect@@powwasp2;

(*Output and input of zz075NonCommutativeTimes*)
(*IMPORTANT: The internal representation zz075NonCommutativeTimes has
the arguments in "Reverse" order, as compared with the external representation.
This improves evaluation speed by one or two orders of magnitude,
because it avoids that operators grow too large before being applied
to a ket*)

zz075NonCommutativeTimes /: MakeBoxes[zz075NonCommutativeTimes[x__], form_] := 
Module[{mydot},
	mydot[Sequence@@Reverse[{x}]] /. 
		mydot[arg__]:>MakeBoxes[CenterDot[arg],form] 
]/; Length[{x}]>1;

CenterDot[x___] := 
	zz075NonCommutativeTimes[Apply[Sequence,Reverse[{x}]]];

CircleTimes[x__] := 
	zz075NonCommutativeTimes[Apply[Sequence,Reverse[{x}]]] /; Length[{x}]>1;

(*Output and input of operator*)

zz080Operator /: MakeBoxes[zz080Operator[x_], form_] := 
	MakeBoxes[OverHat[x],form];

OverHat[x_] := zz080Operator[x];

(*Output and input of QuantumNorm*)

QuantumNorm /: MakeBoxes[QuantumNorm[x_], form_] :=
	MakeBoxes[DoubleBracketingBar[x],form];

DoubleBracketingBar[x_]:= QuantumNorm[x];

(*Output and input of QuantumTr*)

QuantumTr /: MakeBoxes[QuantumTr[expr_,ope__], form_] := 
	MakeBoxes[Subscript[Tr,ope][expr],form];
	
subswasprotected=Unprotect[Subscript];
Subscript[Tr,ope__]:=(QuantumTr[#,ope]&);
Protect@@subswasprotected;
(* compatibility with old versions: *)
zz080TrArgs[x_]:=x;


(*Output and input of zz080HermitianConjugate*)

zz080HermitianConjugate /: MakeBoxes[zz080HermitianConjugate[x_], form_] :=
	MakeBoxes[SuperDagger[x],form];

(* Next definition for SuperDagger is included for
consistency, it is actually NOT used by Mathematica,
because the other definitions below (daggerFreeQ, removeDagger, etc)
transform any expression with an exponent that has a dagger
into a hermitian conjugate WITHOUT generating SuperDagger
 *)
SuperDagger[x_]:=zz080HermitianConjugate[x];

(* A superscript will be considered as an exponent only if 
it does not contain a dagger *)
daggerFreeQ[exp_]:=
	StringFreeQ[ToString[InputForm[exp]],"\[Dagger]"];

removeDagger[exp_]:=
	ToExpression[StringReplace[ToString[InputForm[exp]],"\[Dagger]"->" " ]];
	
countDagger[exp_]:=
	StringCount[ToString[InputForm[exp]],"\[Dagger]"];

MakeExpression[SuperscriptBox[x_, exponent_], form_] := 
 	If[EvenQ[countDagger[exponent]],
 		If[MakeExpression[removeDagger[exponent],form]===HoldComplete[Null],
 			MakeExpression[x, form],
 			MakeExpression[SuperscriptBox[x,removeDagger[exponent]], form]],
 		If[MakeExpression[removeDagger[exponent],form]===HoldComplete[Null],
 			MakeExpression[RowBox[{
				"zz080HermitianConjugate", "[", x, "]"}], form],
 			MakeExpression[RowBox[{
				"zz080HermitianConjugate", "[", 
				SuperscriptBox[x,removeDagger[exponent]], "]"}], form]]			
		]/;
	Not[daggerFreeQ[exponent]];
		
(*Output and input of Conjugate*)

Conjugate /: MakeBoxes[Conjugate[x_], form_] := 
	MakeBoxes[SuperStar[x],form];

SuperStar[x_] := Conjugate[x];

(*Output and input of eigenstate*)

zz080Eigenstate /: MakeBoxes[zz080Eigenstate[zz080Operator[op_],ev_], form_] :=
	MakeBoxes[Subscript[ev,zz080Operator[op]], form]; 
	
zz080Operator /: Subscript[ev_, zz080Operator[op_]] := 
						zz080Eigenstate[zz080Operator[op],ev] /; ev=!=Tr;

(* Output and input of QuantumSum *)

SetAttributes[zz090FlatSum,{HoldAll}];
SetAttributes[zz090NestedSum,{HoldAll}];

zz090NestedSum[zz090FlatSum[inner__],outer__]:=
	zz090NestedSum[inner,outer];

zz090FlatSum[zz090FlatSum[inner__],outer__]:=
	zz090FlatSum[inner,outer];

QuantumSum[ns:zz090NestedSum[__],outer__]:=
Module[{evolvefirst},
	SetAttributes[evolvefirst,HoldRest];
	Apply[QuantumSum,evolvefirst[ns,outer]] (*let the inner zz090NestedSum evolve*)
];

QuantumSum[fs:zz090FlatSum[__],outer__]:=
Module[{evolvefirst},
	SetAttributes[evolvefirst,HoldRest];
	Apply[QuantumSum,evolvefirst[fs,outer]] (*let the inner zz090FlatSum evolve*)
];

zz090FlatSum[ns:zz090NestedSum[__],outer__]:=
Module[{evolvefirst},
	SetAttributes[evolvefirst,HoldRest];
	Apply[zz090FlatSum,evolvefirst[ns,outer]] (*let the inner zz090NestedSum evolve*)
];

zz090NestedSum[data_?(And[Head[#]=!=zz090FlatSum,
						QuantumScalarQ[#]]&),listas:({__}..)]:=
Module[{listasrev,listasready,myHold,a,b,c},
	SetAttributes[myHold,HoldAll];
	listasrev=Reverse[myHold[listas]];
	listasready=listasrev/.HoldPattern[{Set[a_,b_],c___}]:>{a,b,c};
	listasready /. myHold[args___]:>Sum[data,args]
];

zz090NestedSum[data_?(And[Head[#]=!=zz090FlatSum,
						Not[QuantumScalarQ[#]]]&),listas:({__}..)]:=
Module[{listasrev,listasready,myHold,a,b,c},
	SetAttributes[myHold,HoldAll];
	listasrev=Reverse[myHold[listas]];
	listasready=listasrev/.HoldPattern[{Set[a_,b_],c___}]:>{a,b,c};
	listasready /. myHold[args___]:>QuantumSum[data,args]
];

zz090FlatSum[data_?(And[Head[#]=!=zz090NestedSum,
						Head[#]=!=zz090FlatSum,
						QuantumScalarQ[#]]&),listas:({__}..)]:=
Module[{listasrev,listasready,myHold,a,b,c},
	SetAttributes[myHold,HoldAll];
	listasrev=Reverse[myHold[listas]];
	listasready=listasrev/.HoldPattern[{Set[a_,b_],c___}]:>{a,b,c};
	listasready /. myHold[args___]:>Sum[data,args]
];

zz090FlatSum[data_?(And[Head[#]=!=zz090NestedSum,
						Head[#]=!=zz090FlatSum,
						Not[QuantumScalarQ[#]]]&),listas:({__}..)]:=
Module[{listasrev,listasready,myHold,a,b,c},
	SetAttributes[myHold,HoldAll];
	listasrev=Reverse[myHold[listas]];
	listasready=listasrev/.HoldPattern[{Set[a_,b_],c___}]:>{a,b,c};
	listasready /. myHold[args___]:>QuantumSum[data,args]
];

	
MakeExpression[
	RowBox[{
			UnderoverscriptBox["\[Sum]",boxini_,boxend_],
			data_ }],
	form_]:=
MakeExpression[
	RowBox[{"zz090FlatSum","[",data,",","{",boxini,",",boxend,"}","]"}],form];

MakeExpression[
	RowBox[{
			SubsuperscriptBox["\[Sum]",boxini_,boxend_],
			data_ }],
	form_]:=
MakeExpression[
	RowBox[{"zz090FlatSum","[",data,",","{",boxini,",",boxend,"}","]"}],form];

MakeExpression[
	RowBox[{"(",
			RowBox[{UnderoverscriptBox["\[Sum]",boxini_,boxend_],data_}],
			")" }],
	form_]:=
MakeExpression[
	RowBox[{"zz090NestedSum","[",data,",","{",boxini,",",boxend,"}","]"}],form];

MakeExpression[
	RowBox[{"(",
			RowBox[{SubsuperscriptBox["\[Sum]",boxini_,boxend_],data_}],
			")" }],
	form_]:=
MakeExpression[
	RowBox[{"zz090NestedSum","[",data,",","{",boxini,",",boxend,"}","]"}],form];

QuantumSum /: MakeBoxes[QuantumSum[args__],StandardForm]:=
	MakeBoxes[Sum[args],StandardForm];

(* Output and input of QuantumProduct *)

QuantumProduct /: MakeBoxes[QuantumProduct[data_,{j_,ini_,end_}],form_]:=
	TagBox[
		RowBox[{
			UnderoverscriptBox[
					"\[CircleTimes]", 
					TagBox[
						RowBox[{MakeBoxes[j,form], "=", MakeBoxes[ini,form]}],
						zz020TPNotationini,Editable->True,Selectable->True], 
					TagBox[
						MakeBoxes[end,form],
						zz020TPNotationend,Editable->True,Selectable->True]], 
			TagBox[RowBox[{"(", MakeBoxes[data,form], ")"}],
						zz020TPNotationdat,Editable->True,Selectable->True]}],
		zz020TPNotation,Editable->False,Selectable->False
	];

QuantumProduct /: MakeBoxes[QuantumProduct[data_,{j_,end_}],form_]:=
	TagBox[
		RowBox[{
			UnderoverscriptBox[
					"\[CircleTimes]", 
					TagBox[
						MakeBoxes[j,form],
						zz020TPNotationini,Editable->True,Selectable->True], 
					TagBox[
						MakeBoxes[end,form],
						zz020TPNotationend,Editable->True,Selectable->True]], 
			TagBox[RowBox[{"(", MakeBoxes[data,form], ")"}],
						zz020TPNotationdat,Editable->True,Selectable->True]}],
		zz020TPNotation,Editable->False,Selectable->False
	];

MakeExpression[
	TagBox[
		RowBox[{
			UnderoverscriptBox[
					"\[CircleTimes]", 
					TagBox[
						RowBox[{j_, "=", ini_}],
						zz020TPNotationini,opts1___], 
					TagBox[
						end_,
						zz020TPNotationend,opts2___]],
			TagBox[data_,
						zz020TPNotationdat,opts3___]}],
		zz020TPNotation,opts0___],
	form_]:=
MakeExpression[
	RowBox[{"QuantumProduct","[",data,",{",j,",",ini,",",end,"}]"}],form];

MakeExpression[
	TagBox[
		RowBox[{
			UnderoverscriptBox[
					"\[CircleTimes]", 
					TagBox[
						j_,
						zz020TPNotationini,opts1___], 
					TagBox[
						end_,
						zz020TPNotationend,opts2___]],
			TagBox[data_,
						zz020TPNotationdat,opts3___]}],
		zz020TPNotation,opts0___],
	form_]:=
MakeExpression[
	RowBox[{"QuantumProduct","[",data,",{",j,",",end,"}]"}],form];

(* Next input format is for compatiblity with old versions,
and it is also good to have it so that a structure build from pieces
with the shape of tensor product is interpreted as a tensor product*)
MakeExpression[
	RowBox[{
		UnderoverscriptBox["\[CircleTimes]", RowBox[{j_, "=", ini_}], end_],
		data_}],
	form_]:=
MakeExpression[
	RowBox[{"QuantumProduct","[",data,",{",j,",",ini,",",end,"}]"}],form];
(* Next input format accepts a form of tensor product for "inline" text*)
MakeExpression[
	RowBox[{
		SubsuperscriptBox["\[CircleTimes]", RowBox[{j_, "=", ini_}], end_],
		data_}],
	form_]:=
MakeExpression[
	RowBox[{"QuantumProduct","[",data,",{",j,",",ini,",",end,"}]"}],form];
(* Next input format is for compatiblity with old versions,
and older notebooks, created when the quantum product was in Computing *)
MakeExpression[
	TagBox[
		RowBox[{
			UnderoverscriptBox[
					"\[CircleTimes]", 
					TagBox[
						RowBox[{j_, "=", ini_}],
						Quantum`Computing`zz020TPini,opts1___], 
					TagBox[
						end_,
						Quantum`Computing`zz020TPend,opts2___]],
			TagBox[data_,
						Quantum`Computing`zz020TPdat,opts3___]}],
		Quantum`Computing`zz020TP,opts0___],
	form_]:=
MakeExpression[
	RowBox[{"QuantumProduct","[",data,",{",j,",",ini,",",end,"}]"}],form];

(* Ouput of QuantumMeasurementResults *)
Format[QuantumMeasurementResults[r_,opts:OptionsPattern[] ]]:=
Module[{assum,rfac,factorize,replaceme},
factorize= FactorKet /. {opts} /. Options[QuantumMeasurementResults];
assum=Select[{opts},#1[[1]]===Assumptions&]/.
		{(Assumptions->True)->{"Probability","Measurement","State"},
			(Assumptions->False)->{"ERROR: Conflicting assumptions",SpanFromLeft,SpanFromLeft}}/.
		{(Assumptions->a_):>{Assumptions->a,SpanFromLeft,SpanFromLeft}};
rfac=Map[Function[record,
				{record[[1]],record[[2]],
				If[TrueQ[factorize],
					HoldForm[replaceme]/.
						replaceme->FactorKetList[record[[3]]]/.
						List->CircleTimes,
					record[[3]]]}],r];
Interpretation[
	Grid[Join[{{"Probability","Measurement","State"}},rfac,
			assum],
		Dividers->All,Background->{None,
			{Lighter[Yellow,.9],Sequence@@Table[None,{Length[r]}],Lighter[Yellow,.9]}}],
QuantumMeasurementResults[r,opts]] ];


(*******************************************************************************)
(** MAIN CALCULATION RULES *****************************************************)
(*******************************************************************************)

SetAttributes[expandeNumerosComplejos,Listable]

expandeNumerosComplejos[n_]:=
	If[TrueQ[NumericQ[n]],Chop[ExpToTrig[n]],n];

serieswasp=Unprotect[Series];

Series::qni="Power series of noncommutative quantum products have not been implemented";

Series[args__]:=
	(Message[Series::qni];Abort[]) /;
	And[Not[FreeQ[{args},zz075NonCommutativeTimes]],
		Not[FreeQ[{args},Analytic]],
		FreeQ[{args},Analytic->False] ];

Series[args__]:=
	Series[args,Analytic->False] /;
	And[Not[FreeQ[{args},zz075NonCommutativeTimes]],
		FreeQ[{args},Analytic]];

Protect@@serieswasp;

graphicswasp=Unprotect[Graphics,Graphics3D];
Graphics /: Power[Graphics[args__],exponent_]:=
With[{qinfo=Cases[Graphics[args], Tooltip[g_List, e_] :> e, Infinity]}, 
	Power[Part[qinfo,1],exponent] /;
	Length[qinfo]===1
];
Graphics3D /: Power[Graphics3D[args__],exponent_]:=
With[{qinfo=Cases[Graphics3D[args], Tooltip[g_List, e_] :> e, Infinity]}, 
	Power[Part[qinfo,1],exponent] /;
	Length[qinfo]===1
];
Protect@@graphicswasp;

(* Wavefunction Collapse ***********************************************)

QuantumMeasurement[onearg_]:=
Module[{},
	Message[QuantumMeasurement::argr,QuantumMeasurement,2];
	Abort[]
];

(*
QuantumMeasurement[kq_?(Not[KetQ[#]]&),lis_List,opts:OptionsPattern[]]:=
Module[{},
	Message[QuantumMeasurement::nonket,kq];
	Abort[];
];
*)

QuantumMeasurement[kq_,lis_List,opts:OptionsPattern[]]:=
Module[{oppatt,evlists,kets,expression,normas,normak2,
	ta,lista,together,k,cond,newoptslist},
(*k=Chop[Expand[kq]];*)
k=Chop[Collect[kq,zz080Ket[__]]];
lista=Map[zz080Operator,lis];
If[Head[k]===Plus,
		expression=k,
		expression={k}
	];
oppatt=Apply[Alternatives,Map[zz080Eigenstate[#,_]&,lista]];
evlists=Split[Union[Cases[k,oppatt,Infinity]],
#1[[1]]==#2[[1]]&];

If[Length[evlists]===0,Return[0]];
cond=And[OptionValue[Assumptions],
	Apply[And,Map[Unequal[#[[1,2]],#[[2,2]]]&,Map[Sequence@@Subsets[#,{2}]&,evlists]]]];


kets=Flatten[Outer[
together[together[together[##]],
	Simplify[Plus@@Cases[expression,_.*zz080Ket[##,___]],Assumptions->cond] ]&,
Sequence@@evlists]];
kets=kets/.together->List;

kets=DeleteCases[kets,{_,0}|{_,0.0}];
normas=Map[Simplify[QuantumNorm[#[[2]]],Assumptions->cond]&,kets];

normak2=Simplify[QuantumNorm[k]^2,Assumptions->cond];
ta=Table[{
Simplify[PiecewiseExpand[
	FunctionExpand[Simplify[(normas[[j]]^2)/normak2,Assumptions->cond],
	Assumptions->cond],Assumptions->cond],Assumptions->cond],
kets[[j,1]],
Simplify[kets[[j,2]]/normas[[j]],Assumptions->cond]},
{j,Length[kets]}];
newoptslist=Union[{Assumptions->cond},
				DeleteCases[{opts},(Assumptions->_)|(Assumptions:>_)]];
QuantumMeasurementResults[expandeNumerosComplejos[ta],
						Sequence@@newoptslist]
]; 

QuantumMeasurementResults[bef__,Assumptions->assu_,after___]:=
	(Message[QuantumMeasurementResults::assum];Abort[]) /;
Simplify[assu]===False;

QuantumMeasurement[
	qmr:QuantumMeasurementResults[innerList_List,inneropts:OptionsPattern[]],
	outerList_List,outeropts:OptionsPattern[]]:=
Module[{k},
	QuantumMeasurementResults[
		Table[{innerList[[k,1]],innerList[[k,2]],
				QuantumMeasurement[innerList[[k,3]],outerList,outeropts]},
			{k,Length[innerList]}],inneropts]
];

QuantumMeasurementResults[
	{before___,
	{prob1_,opelistsame_,ketsame_},
	{prob2_,opelistsame_,ketsame_},
	after___},opts:OptionsPattern[]]:=
QuantumMeasurementResults[
	{before,
	{Simplify[prob1+prob2],opelistsame,ketsame},
	after},opts];

QuantumMeasurementResults[
	{before___,{prob_,opelist_List,
				QuantumMeasurementResults[innerList_List,inneropts:OptionsPattern[]]},
	after___},outeropts:OptionsPattern[]]:=
QuantumMeasurementResults[
	{before,
	Sequence@@Map[{prob*#[[1]],Join[#[[2]],opelist],#[[3]]}&,innerList,{1}],
	after},
	Flatten[Split[Union[{outeropts},{inneropts}],#1[[1]]==#2[[1]]&]]/.
		{Assumptions->c1_,Assumptions->c2_}:>(Assumptions->And[c1,c2])
];

(* next rule is specially useful in Quantum`Computing` for the commutativity
of measurements with controlled gates in quantum circuits, as in the
teleportation circuit where the measurement can be before or after
the two controlled gates *)
QuantumMeasurementResults/:
zz075NonCommutativeTimes[
	right___,
	qmr:QuantumMeasurementResults[arg:{_List..},opts:OptionsPattern[]],
	left___
]:=
Module[{k},
	QuantumMeasurementResults[
		Table[{arg[[k,1]],arg[[k,2]],
				Simplify[zz075NonCommutativeTimes[right,arg[[k,3]],left],
					FilterRules[{opts},Options[Simplify]]]},
			{k,Length[arg]}],opts]
];

QuantumDensityOperator[qume_QuantumMeasurementResults]:=
	Apply[Plus,
		Map[Expand[#[[1]]*#[[3]]\[CenterDot]zz080HermitianConjugate[#[[3]]]]&,
			qume[[1]],{1}]];

(** AntiCommutator rules *****************************************************)

zz050AntiCommutator[first_,graph:((Graphics|Graphics3D)[___]),opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz050AntiCommutator[first,Part[qinfo,1],opts]/;
	Length[qinfo]===1
];

zz050AntiCommutator[graph:((Graphics|Graphics3D)[___]),second_,opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz050AntiCommutator[Part[qinfo,1],second,opts]/;
	Length[qinfo]===1
];

zz050AntiCommutator[opts:OptionsPattern[]]:=
	(Message[zz050AntiCommutator::twoargs,
	 HoldForm[zz050AntiCommutator[opts]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1446"];Abort[]
	);

zz050AntiCommutator[onearg_,opts:OptionsPattern[]]:=
	(Message[zz050AntiCommutator::twoargs,
	 HoldForm[zz050AntiCommutator[onearg,opts]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1452"];Abort[]
	);

zz050AntiCommutator[firstarg_,secondarg_,third:Except[_Rule],more___]:=
	(Message[zz050AntiCommutator::twoargs,
	 HoldForm[zz050AntiCommutator[firstarg,secondarg,third,more]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1458"];Abort[]
	);

zz050AntiCommutator[same_,same_,opts:OptionsPattern[]]:=2*(same^2);

zz050AntiCommutator[first_?(QuantumScalarQ[#]&),second_,opts:OptionsPattern[]]:=
	2*first*second;

zz050AntiCommutator[first_,second_?(QuantumScalarQ[#]&),opts:OptionsPattern[]]:=
	2*second*first;

zz050AntiCommutator[Times[scalar_?(QuantumScalarQ[#]&),first_],second_,
					opts:OptionsPattern[]]:=
	scalar*zz050AntiCommutator[first,second,opts];

zz050AntiCommutator[first_,Times[scalar_?(QuantumScalarQ[#]&),second_],
					opts:OptionsPattern[]]:=
	scalar*zz050AntiCommutator[first,second,opts];

zz050AntiCommutator[first_,Plus[secondone_,secondtwo_],
					opts:OptionsPattern[]]:=
	zz050AntiCommutator[first,secondone,opts]+
	zz050AntiCommutator[first,secondtwo,opts];

zz050AntiCommutator[Plus[firstone_,firsttwo_],second_,
					opts:OptionsPattern[]]:=
	zz050AntiCommutator[firstone,second,opts]+
	zz050AntiCommutator[firsttwo,second,opts];

(* remember that zz075NonCommutativeTimes has its arguments 
in reverse order *)
zz050AntiCommutator[a_,
	zz075NonCommutativeTimes[
		c__,
		b__],opts:OptionsPattern[]]:=
	zz075NonCommutativeTimes[
		zz050AntiCommutator[a,zz075NonCommutativeTimes[c],opts],
		zz075NonCommutativeTimes[b]
	]-
	zz075NonCommutativeTimes[
		zz075NonCommutativeTimes[c],
		zz050AntiCommutator[a,zz075NonCommutativeTimes[b],opts]
	]+
	2*zz075NonCommutativeTimes[
		c,
		b,
		a
	]/; And[FreeQ[{b,c},zz080Ket],FreeQ[{b,c},zz080Bra]];

(* remember that zz075NonCommutativeTimes has its arguments 
in reverse order *)
zz050AntiCommutator[
	zz075NonCommutativeTimes[
		b__,
		a__],c_,opts:OptionsPattern[]]:=
	zz075NonCommutativeTimes[
		zz075NonCommutativeTimes[b],
		zz050AntiCommutator[zz075NonCommutativeTimes[a],c,
							opts]
	]-
	zz075NonCommutativeTimes[
		zz050AntiCommutator[zz075NonCommutativeTimes[b],c,
							opts],
		zz075NonCommutativeTimes[a]
	]+
	2*zz075NonCommutativeTimes[
		c,
		b,
		a
	]/; And[FreeQ[{a,b},zz080Ket],FreeQ[{a,b},zz080Bra]];

zz050AntiCommutator[
	a_,Power[b_,exponent_?NumericQ(*see condition after /;*)],
opts:OptionsPattern[]]:=
Module[{j},
Plus@@(
	Table[(-1)^(j+Mod[Round[exponent],2]),{j,1,Round[exponent]}]*
	zz075NonCommutativeTimes@@@
		Table[RotateLeft[
			Flatten[{Table[b,{Round[exponent]-1}],
				zz050AntiCommutator[a,b,opts]}],j],
			{j,0,Round[exponent]-1}])+
2* zz075NonCommutativeTimes[b^exponent,a] * 
Mod[Round[exponent]-1,2]] /;
And[exponent==Round[exponent],
	If[TrueQ[OptionValue[ReverseOrdering]],
		Not[OrderedQ[{a,b^exponent}]],
		Not[OrderedQ[{b^exponent,a}]]
	]];

zz050AntiCommutator[
	Power[a_,exponent_?NumericQ(*see condition after /;*)],b_,
opts:OptionsPattern[]]:=
Module[{j},
Plus@@(
	Table[(-1)^(j+1),{j,1,Round[exponent]}]*
	zz075NonCommutativeTimes@@@
		Table[RotateLeft[
			Flatten[{Table[a,{Round[exponent]-1}],
				zz050AntiCommutator[a,b,opts]}],j],
			{j,0,Round[exponent]-1}])+
2* zz075NonCommutativeTimes[b,a^exponent] * 
Mod[Round[exponent]-1,2]] /;
And[exponent==Round[exponent],
	If[TrueQ[OptionValue[ReverseOrdering]],
		Not[OrderedQ[{a^exponent,b}]],
		Not[OrderedQ[{b,a^exponent}]]
	]];

zz050AntiCommutator[second_,first_,opts:OptionsPattern[]]:= 
	zz050AntiCommutator[first,second,opts] /; 
If[TrueQ[OptionValue[ReverseOrdering]],
		Not[OrderedQ[{first,second}]],
		Not[OrderedQ[{second,first}]]
	];

(** Commutator rules *****************************************************)

zz050Commutator[first_,graph:((Graphics|Graphics3D)[___]),opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz050Commutator[first,Part[qinfo,1],opts]/;
	Length[qinfo]===1
];

zz050Commutator[graph:((Graphics|Graphics3D)[___]),second_,opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz050Commutator[Part[qinfo,1],second,opts]/;
	Length[qinfo]===1
];

zz050Commutator[opts:OptionsPattern[]]:=
	(Message[zz050Commutator::twoargs,
	 HoldForm[zz050Commutator[opts]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1579"];Abort[]
	);

zz050Commutator[onearg_,opts:OptionsPattern[]]:=
	(Message[zz050Commutator::twoargs,
	 HoldForm[zz050Commutator[onearg,opts]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1585"];Abort[]
	);

zz050Commutator[firstarg_,secondarg_,third:Except[_Rule],more___]:=
	(Message[zz050Commutator::twoargs,
	 HoldForm[zz050Commutator[firstarg,secondarg,third,more]]];
	 Message[QuantumScalarQ::error];QuantumDebug["debug1591"];Abort[]
	);

zz050Commutator[same_,same_,opts:OptionsPattern[]]:=0;

zz050Commutator[first_?(QuantumScalarQ[#]&),second_,
	opts:OptionsPattern[]]:=0;

zz050Commutator[first_,second_?(QuantumScalarQ[#]&),
	opts:OptionsPattern[]]:=0;

zz050Commutator[Times[scalar_?(QuantumScalarQ[#]&),first_],second_,
	opts:OptionsPattern[]]:=
	scalar*zz050Commutator[first,second,opts];

zz050Commutator[first_,Times[scalar_?(QuantumScalarQ[#]&),second_],
	opts:OptionsPattern[]]:=
	scalar*zz050Commutator[first,second,opts];

zz050Commutator[first_,Plus[secondone_,secondtwo_],
	opts:OptionsPattern[]]:=
	zz050Commutator[first,secondone,opts]+zz050Commutator[first,secondtwo,opts];

zz050Commutator[Plus[firstone_,firsttwo_],second_,
	opts:OptionsPattern[]]:=
	zz050Commutator[firstone,second,opts]+zz050Commutator[firsttwo,second,opts];

(* remember that zz075NonCommutativeTimes has its arguments 
in reverse order *)
zz050Commutator[a_,
	zz075NonCommutativeTimes[
		c__,
		b__],opts:OptionsPattern[]]:=
	zz075NonCommutativeTimes[
		zz075NonCommutativeTimes[c],
		zz050Commutator[a,zz075NonCommutativeTimes[b],opts]
	]+
	zz075NonCommutativeTimes[
		zz050Commutator[a,zz075NonCommutativeTimes[c],opts],
		zz075NonCommutativeTimes[b]
	]/; And[FreeQ[{b,c},zz080Ket],FreeQ[{b,c},zz080Bra]];

(* remember that zz075NonCommutativeTimes has its arguments 
in reverse order *)
zz050Commutator[
	zz075NonCommutativeTimes[
		b__,
		a__],c_,opts:OptionsPattern[]]:=
	zz075NonCommutativeTimes[
		zz075NonCommutativeTimes[b],
		zz050Commutator[zz075NonCommutativeTimes[a],c,opts]
	]+
	zz075NonCommutativeTimes[
		zz050Commutator[zz075NonCommutativeTimes[b],c,opts],
		zz075NonCommutativeTimes[a]
	]/; And[FreeQ[{a,b},zz080Ket],FreeQ[{a,b},zz080Bra]];

zz050Commutator[
	Power[a_,exponent_?NumericQ(*see condition after /;*)], b_,
	opts:OptionsPattern[]]:=
Module[{j},
Plus@@zz075NonCommutativeTimes@@@
	Table[RotateLeft[
			Flatten[{Table[a,{Round[exponent]-1}],
				zz050Commutator[a,b,opts]}],j],
		{j,0,Round[exponent]-1}]] /;
(exponent==Round[exponent]);

zz050Commutator[
	a_,Power[b_,exponent_?NumericQ(*see condition after /;*)],
	opts:OptionsPattern[]]:=
Module[{j},
Plus@@zz075NonCommutativeTimes@@@
	Table[RotateLeft[
			Flatten[{Table[b,{Round[exponent]-1}],
				zz050Commutator[a,b,opts]}],j],
		{j,0,Round[exponent]-1}]] /;
(exponent==Round[exponent]);

(*IMPORTANT NOTE: The condition OrderedQ[{first,second}] is
 Not equivalent to Not[OrderedQ[{second,first}]],
 because if both first and second are equal, for
 example first=second=a, then
 OrderedQ[{a,a}] gives True but Not[OrderedQ[{a,a}]] gives False.
 Using OrderedQ[{first,second}] in the following definition leads to
 infinite looping if z050Commutator[a,a] is Not set to zero
 somewhere else. On the other hand Not[OrderedQ[{second,first}]] never
 leads to infinite looping: *)
zz050Commutator[second_,first_,opts:OptionsPattern[]]:= 
	0-zz050Commutator[first,second,opts] /; 
If[TrueQ[OptionValue[ReverseOrdering]],
		Not[OrderedQ[{first,second}]],
		Not[OrderedQ[{second,first}]]
	];


(* Next properties of operator are useful in the quantum computing package*)
SetAttributes[zz080Operator,{Flat,OneIdentity,NHoldAll}];

zz080Operator /: zz080Operator[a_.*zz080Operator[ope_]+b_.*c_]:= zz080Operator[a*ope+b*c];

(* Inequalities and other properties of brakets *)

zz075NonCommutativeTimes /: 
	Element[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[y_]], Complexes]:=True;

zz075NonCommutativeTimes /: 
	NotElement[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[y_]], Complexes]:=False;

zz075NonCommutativeTimes /: 
	Element[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]], Reals]:=True;

zz075NonCommutativeTimes /: 
	NotElement[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]], Reals]:=False;

zz075NonCommutativeTimes /:
	Greater[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]],y_]:=True /;
	y<0;

zz075NonCommutativeTimes /:
	GreaterEqual[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]],y_]:=True /;
	y<=0;

zz075NonCommutativeTimes /:
	LessEqual[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]],y_]:=False /;
	y<0;
	
zz075NonCommutativeTimes /:
	Less[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]],y_]:=False /;
	y<=0;

zz075NonCommutativeTimes /:
	NonNegative[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]]]:=True;

zz075NonCommutativeTimes /:
	Negative[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]]]:=False;

zz075NonCommutativeTimes /:
	Abs[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]]]:=
		zz075NonCommutativeTimes[zz080Ket[x], zz080Bra[x]];

zz075NonCommutativeTimes /:
	UnitStep[zz075NonCommutativeTimes[zz080Ket[x_], zz080Bra[x_]]]:=1;
	
	
(* Hermitian conjugation rules *)		

werep=Unprotect[Norm,Normalize];
Norm[q_]:=QuantumNorm[q] /; Not[QuantumScalarQ[q]];
Normalize[q_]:=QuantumNormalize[q] /; Not[QuantumScalarQ[q]];
Protect@@werep;

QuantumNorm[qobj_]:=
 Chop[Sqrt[zz075NonCommutativeTimes[qobj,
 							zz080HermitianConjugate[qobj]]]];
 
QuantumNormalize[qobj_]:=qobj*1/QuantumNorm[qobj];

zz080Bra[x__]:=
	zz080HermitianConjugate[zz080Ket[x]] /; zz080Ket[x]=!=Unevaluated[zz080Ket[x]];

zz080Ket /: Conjugate[zz080Ket[a__]] := 
		zz080HermitianConjugate[zz080Ket[a]];

zz080Bra /: Conjugate[zz080Bra[a__]] := 
		zz080HermitianConjugate[zz080Bra[a]];

zz075NonCommutativeTimes /: Conjugate[zz075NonCommutativeTimes[a__]] := 
		zz080HermitianConjugate[zz075NonCommutativeTimes[a]];

zz080HermitianConjugate[graph:((Graphics|Graphics3D)[___])]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz080HermitianConjugate[Part[qinfo,1]]/;
	Length[qinfo]===1
];

zz080HermitianConjugate[zz075NonCommutativeTimes[a__]] := 
	zz075NonCommutativeTimes[Apply[Sequence, 
	                              Reverse[Map[zz080HermitianConjugate, {a}]]]];
zz080HermitianConjugate[(base_)^(expo_?QuantumScalarQ)] :=
	(zz080HermitianConjugate[base])^(expo);				
zz080HermitianConjugate[suma_Plus] :=
	Map[zz080HermitianConjugate,suma];
zz080HermitianConjugate[HoldPattern[QuantumSum[s_,args___]]] :=
	QuantumSum[zz080HermitianConjugate[s],args];
zz080HermitianConjugate[zz080Ket[a__]] :=
	zz080Bra[a];
zz080HermitianConjugate[zz080Bra[a__]] :=
	zz080Ket[a];

zz080HermitianConjugate[HoldPattern[zz050Commutator[a_, b_,opts:OptionsPattern[]]]]:=
	zz050Commutator[zz080HermitianConjugate[b],zz080HermitianConjugate[a],opts];

zz080HermitianConjugate[HoldPattern[zz050AntiCommutator[a_, b_,opts:OptionsPattern[]]]]:=
	zz050AntiCommutator[zz080HermitianConjugate[b],zz080HermitianConjugate[a],opts];

zz080HermitianConjugate[a_?QuantumScalarQ * b_] :=
	Conjugate[a]*zz080HermitianConjugate[b];				
zz080HermitianConjugate[a_?QuantumScalarQ] := Conjugate[a];
Conjugate[a_]:=zz080HermitianConjugate[a] /; Not[QuantumScalarQ[a]];				

Conjugate[KroneckerDelta[args__]]:=KroneckerDelta[args];

Conjugate[DiscreteDelta[args__]]:=DiscreteDelta[args];

zz080HermitianConjugate[HoldPattern[zz080HermitianConjugate[a_]]]:=a;

zz080HermitianConjugate[Conjugate[a_]]:=a;

(*ket, bra and eigenstate properties*)

SetAttributes[zz080Eigenstate,{NHoldAll}];

zz080Ket /:
Times[a_,Power[Times[a_,Conjugate[a_]],Rational[-1,2]],zz080Ket[k__]]:=zz080Ket[k];

zz080Ket[command_[args1___,zz080Eigenstate[zz080Operator[op_],val_],args2___],
	other___] := 
	zz080Ket[zz080Eigenstate[zz080Operator[op],command[args1,val,args2]],other];

zz080Bra[command_[args1___,zz080Eigenstate[zz080Operator[op_],val_],args2___],
	other___] := 
	zz080Bra[zz080Eigenstate[zz080Operator[op],command[args1,val,args2]],other];

zz080Ket[zz080Eigenstate[zz080Operator[opSame_], evket1_],
		zz080Eigenstate[zz080Operator[opSame_], evket2_],
        rest___]:= 
	Module[
      {},
      Message[zz080Eigenstate::ketrepop];
      Message[QuantumScalarQ::error];QuantumDebug["debug1866"];Abort[];
      "Errorketket"
	];

zz080Bra[zz080Eigenstate[zz080Operator[opSame_], evket1_],
		zz080Eigenstate[zz080Operator[opSame_], evket2_],
        rest___]:= 
	Module[
      {},
      Message[zz080Eigenstate::ketrepop];
      Message[QuantumScalarQ::error];QuantumDebug["debug1876"];Abort[];
      "Errorbrabra"
	];

(* Partial Trace *)

QuantumPartialTrace[args___]:=QuantumTr[args];

QuantumTr[graph:((Graphics|Graphics3D)[___]), zz080Operator[op_]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	QuantumTr[Part[qinfo,1],zz080Operator[op]]/;
	Length[qinfo]===1
];

QuantumTr[suma_Plus, zz080Operator[op_]]:=
	Map[QuantumTr[#, zz080Operator[op]]&,suma];

QuantumTr[a_?QuantumScalarQ*b_, zz080Operator[op_]]:=
	a*QuantumTr[b, zz080Operator[op]];

(* partial trace with respect to several operators: *)
QuantumTr[arg1_,arg2_,args__]:=Fold[QuantumTr,arg1,{arg2,args}];
QuantumTr[arg1_,{args__}]:=Fold[QuantumTr,arg1,{args}];

(* Remember that operands order is reversed in internal representation*)
QuantumTr[zz075NonCommutativeTimes[
		zz080Bra[
			zz080Eigenstate[zz080Operator[opSame_], evbra_],restbra___],
		zz080Ket[
			zz080Eigenstate[zz080Operator[opSame_], evket_],restket___]
		],zz080Operator[opSame_]]:= 
	KroneckerDelta[evbra-evket]*
	zz075NonCommutativeTimes[
		zz080Bra[restbra],
		zz080Ket[restket]
		];

QuantumTr[expr_,zz080Operator[op_]]:=
With[{expanded=(QuantumEvaluate[Expand[expr]]/.
					QuantumEvaluate:>Identity)},
		Expand[QuantumTr[expanded,zz080Operator[op]]] /;
	expanded=!=expr
];

(* Partial Transpose, do Not confuse with partial trace *)

(* partial trace with respect to several operators: *)
QuantumPartialTranspose[arg1_,arg2_,args__]:=
	Fold[QuantumPartialTranspose,arg1,{arg2,args}];
QuantumPartialTranspose[arg1_,{args__}]:=
	Fold[QuantumPartialTranspose,arg1,{args}];

(* zz075NonCommutativeTimes has its arguments in reverse order *)
QuantumPartialTranspose[dirac_,zz080Operator[op_]]:=
 QuantumEvaluate[dirac] /. 
	zz075NonCommutativeTimes[
  		zz080Bra[zz080Eigenstate[zz080Operator[op], b_], rest2___], 
  		zz080Ket[zz080Eigenstate[zz080Operator[op], k_], rest1___]] :>
 	zz075NonCommutativeTimes[
  		zz080Bra[zz080Eigenstate[zz080Operator[op], k], rest2], 
  		zz080Ket[zz080Eigenstate[zz080Operator[op], b], rest1]] /.
  	QuantumEvaluate:>Identity;

(* Quantum Sum *)

SetAttributes[QuantumSum,{HoldAll}];

QuantumSum[graph:((Graphics|Graphics3D)[___]), iterators__]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	QuantumSum[Part[qinfo,1], iterators] /;
	Length[qinfo]===1
];

(* Shield QSum against global variable with the same name as its dummy-index
 by creation a unique dummy-index *)
QuantumSum[sumando_,before___,{dummyindex_,rest___},after___]:=
	ReleaseHold[Hold[QuantumSum[sumando,before,{dummyindex,rest},after]] /. 
		HoldPattern[dummyindex] :> 
			Evaluate[Unique[ToString[Unevaluated[dummyindex]]]]]  /; 
	(Or[NumericQ[dummyindex],ValueQ[dummyindex]]);	

(* Transform QSum[a,list1,list2] into QSum[QSum[a,list2],list1] (nested) *)
QuantumSum[sumando_?(Not[QuantumScalarQ[#]]&),
				iterators__List,lastiterator_List,opts:OptionsPattern[]]:=
QuantumSum[QuantumSum[sumando,lastiterator,opts],iterators,opts];

(* Evolve inner (nested) QuantumSum *)	
QuantumSum[qs:QuantumSum[__],outer__]:=
With[{qsevolved=qs},
	QuantumSum[qsevolved,outer] /; 
qsevolved=!=Unevaluated[qs]];

(* Evolve the end (upper limit) of the sum *)
QuantumSum[sumando_?(Not[QuantumScalarQ[#]]&),
				{j_,ini_,end_}]:=
Module[{endevolved,replaceme},
	endevolved=end;
	Block[{j}, ReleaseHold[Hold[QuantumSum[sumando,{j,ini,replaceme}]] /. replaceme->endevolved]]
]/;ValueQ[end];

(* Evolve the ini (lower limit) of the sum *)
QuantumSum[sumando_?(Not[QuantumScalarQ[#]]&),
				{j_,ini_,end_}]:=
Module[{inievolved,replaceme},
	inievolved=ini; 
	Block[{j}, ReleaseHold[Hold[QuantumSum[sumando,{j,replaceme,end}]] /. replaceme->inievolved]]
]/;ValueQ[ini];
	
(* QSum of a scalar becomes the standard Mathematica Sum *)
QuantumSum[data_?(QuantumScalarQ[#]&), iteratorsandoptions__]:=
	Sum[data,iteratorsandoptions];

(* Use Sum rules inside QSum when we have a multiplication of
 a scalar function of the summation index and a quantum object 
 that can be also a function of the summation index.
 The trick is to create a Sum with the quantum object replaced by 
 a totally inert scalar function of the index, so that Mathematica 
 applies its rich rules for working with KroneckerDelta, UnitStep,
 Piecewise, etc. to the original scalar function without "disturbing"
 the inert scalar function (except possibly on its argument).
 Then this inert scalar function, with its new argument,
  will be replaced back to the 
 original quantum object. Notice that qobject is transformed
 into a function in order to make the "back-replacement"
  *)
Unprotect[inertfunction]; 
ClearAll[inertfunction];
Protect[inertfunction]; 
QuantumSum[
	Times[	scalar_?(QuantumScalarQ[#]&),
			qobject_?(Not[QuantumScalarQ[#]]&)],
	{j_Symbol, ini_, end_}]:=
	With[{mysum=Block[{j},Sum[Times[scalar,inertfunction[j]],{j, ini, end}]]},
		Block[{j,a,b},
			mysum /. inertfunction->((qobject&)/.j->Slot[1])
		] /;
		Block[{j},
			And[Not[FreeQ[Hold[scalar],j]],
(* avoid infinite loop, List@@ lets "Times" evolve before the comparison *)
				(List@@mysum)=!= 
					(List@@Unevaluated[Sum[Times[scalar,inertfunction[j]],{j, ini, end}]])
		]]
	]; 


(* Simplify assuming that the index is an interger*)
QuantumSum[data1_, {j_Symbol, ini_, end_}]:=
With[{simplified=Block[{j},Assuming[And[Element[j,Integers],j>=ini,j<=end],
					Simplify[data1]]]},
		 QuantumSum[simplified,{j,ini,end}] /;
	Block[{j},simplified=!=data1] (*avoid infinite loop*)
];

(* Sum of additions becomes the addition of the sums *) 
QuantumSum[data1_+data2_, {j_Symbol, ini_, end_}]:=
	Block[{j},QuantumSum[data1, {j, ini, end}]+
		QuantumSum[data2, {j, ini, end}]];

(* QSum of a quantum constant *)
QuantumSum[data_?(Not[QuantumScalarQ[#]]&), {j_Symbol, ini_, end_}]:=
	(end-ini+1)*data /; 
	Block[{j},FreeQ[data,j]];
	
(* Factorize (pull out) a scalar constant *)	
QuantumSum[
	Times[constantscalarfactor_?(QuantumScalarQ[#]&),
			quantumdata_?(Not[QuantumScalarQ[#]]&)], 
	{j_Symbol, ini_, end_}]:=
constantscalarfactor*QuantumSum[quantumdata,{j,ini,end}]/;	
Block[{j},FreeQ[constantscalarfactor,j]];

(* Quantum (noncommutative) products are pulled-in *)
zz075NonCommutativeTimes[
		after___, 
		HoldPattern[QuantumSum[sumando_,iterator:{index_,rest___}]], 
		before___
		] := 
Module[{replaceme},
	ReleaseHold[
		Hold[QuantumSum[replaceme,iterator]]/.
			replaceme->zz075NonCommutativeTimes[after,sumando,before]]
]/; And[FreeQ[Hold[before,after],HoldPattern[QuantumSum[_,{index,___}]]],
		FreeQ[Hold[before,after],HoldPattern[Sum[_,{index,___}]]]] ; 
		(*Do not pull-in a Sum with *)
		(* the same dummy index, wait *)
		(* for the rule below *)

(* If two sums are going to be combined into one sum
(because of the rule above for zz075NonCommutativeTimes) 
and they have the same dummy index, 
we modify them so each one has its unique index,
otherwise the answer is wrong.
 *)
QuantumSum /: zz075NonCommutativeTimes[
	right___,
	HoldPattern[QuantumSum[sumando1_,before1___,{sameindex_,rest1___},after1___]],
	HoldPattern[QuantumSum[sumando2_,before2___,{sameindex_,rest2___},after2___]],
	left___]:=
	zz075NonCommutativeTimes[
		right,
		ReleaseHold[Hold[QuantumSum[sumando1,before1,{sameindex,rest1},after1]] /.
			HoldPattern[sameindex] :> 
				Evaluate[Unique[ToString[Unevaluated[sameindex]]]]],
		ReleaseHold[Hold[QuantumSum[sumando2,before2,{sameindex,rest2},after2]] /.
			HoldPattern[sameindex] :> 
				Evaluate[Unique[ToString[Unevaluated[sameindex]]]]],			
		left];	

(* positive integer power of QuantumSum inside zz075NonCommutativeTimes 
is transformed to repeated quantum product *)
(* first case: there is something to the right (zz075NonCommutativeTimes has
its arguments in reverse order) and maybe also to the left. Apply to the right *)
HoldPattern[
	zz075NonCommutativeTimes[right__,
		HoldPattern[Power[QuantumSum[sumando_?(Not[QuantumScalarQ[#]]&),rest___],
						expo_?(IntegerQ[#]&&(#>1) &)]],left___]]:=
With[{suma=QuantumSum[sumando,rest]},
	zz075NonCommutativeTimes[
		Nest[zz075NonCommutativeTimes[#,suma]&,zz075NonCommutativeTimes[right],expo],
		left]
];
(* second case: there is NOTHING to the right (zz075NonCommutativeTimes has
its arguments in reverse order) and there is something on the left. Apply to the leftt *)
HoldPattern[
	zz075NonCommutativeTimes[
		HoldPattern[Power[QuantumSum[sumando_?(Not[QuantumScalarQ[#]]&),rest___],
						expo_?(IntegerQ[#]&&(#>1) &)]],left__]]:=
With[{suma=QuantumSum[sumando,rest]},
	Nest[zz075NonCommutativeTimes[suma,#]&,zz075NonCommutativeTimes[left],expo]
];

(* Sum with integer initial and final values. 
 Notice in the following definition
 the way to check that ini and end are
 NumericQ. This is because of the HoldAll attribute:
 those patterns (ini and end) must be OR EVOLVE to numbers,
 but I need the attribute HoldAll because I need two pattens
 that must NOT EVOLVE, j and data[j], to shield from possible
 global variable with the same name as the dummy index j *)
QuantumSum[data_?(Not[QuantumScalarQ[#]]&), {j_Symbol, ini_, end_}]:=
	Expand[Apply[Plus,Block[{j},Table[data,{j,ini,end}]]]] /; 
	((NumericQ[ini])&&(NumericQ[end]));

QuantumSum[data_?(Not[QuantumScalarQ[#]]&), {j_Symbol, ini_, end_, inc_}]:=
	Expand[Apply[Plus,Block[{j},Table[data,{j,ini,end,inc}]]]] /; 
	((NumericQ[ini])&&(NumericQ[end])&&(NumericQ[inc]));

(* missing initial value defaults to one *)	
QuantumSum[data_?(Not[QuantumScalarQ[#]]&), {j_Symbol, endOrList_}]:=
	QuantumSum[data,{j, 1, endOrList}];

(* an explicit list of j values with an initial "offset" *)
QuantumSum[data_?(Not[QuantumScalarQ[#]]&), {j_Symbol, ini_, {channels__}}]:=
Module[{lista,lista2,k},
	lista={channels};
	lista2=Map[ini-1+#&,lista];
	Expand[Apply[Plus,
		Block[{j},Table[j=lista2[[k]];data,{k,1,Length[lista2]}]]]]
];


(* QuantumProduct *)

SetAttributes[QuantumProduct,{HoldAll}];
 
QuantumProduct[graph:((Graphics|Graphics3D)[___]), iterators__]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	QuantumProduct[Part[qinfo,1], iterators] /;
	Length[qinfo]===1
]; 
 
QuantumProduct[data_, {j_Symbol, ini_, {}}]:=1;

(* a missing initial value defaults to one *) 
QuantumProduct[data_, {j_Symbol, endorlist_}]:=
	QuantumProduct[data, {j, 1, endorlist}]; 

(* next definition is only a precaution,
 quantum products entered in StandardNotation
 should work o.k. with or without it*) 
QuantumProduct[data_, {HoldPattern[j_Symbol=ini_], endorlist_}]:= 
 	QuantumProduct[data, {j, ini, endorlist}];

QuantumProduct[data_, {j_Symbol, ini_, 
	{before___,zz080Operator[qb_],after___}}]:=
		QuantumProduct[data,{j,ini,{before,qb,after}}];

QuantumProduct[data_, {j_Symbol, ini_, 
	zz080Operator[qb_]}]:=
		QuantumProduct[data,{j,ini,{qb}}];

(* quantum product with a specific list of qubits,
 the "initial" value of the iterator is interpreted as
 an offset *) 	
QuantumProduct[data_, {j_Symbol, ini_, qlist:{__}}]:=
Module[{lista2,k},
	lista2=Map[ini-1+#&,qlist];
	Expand[Apply[zz075NonCommutativeTimes,
		Reverse[
			Block[{j},Table[j=lista2[[k]];data,{k,1,Length[lista2]}]]]]]
] /; FreeQ[qlist,zz080Operator];

QuantumProduct[data_, {j_Symbol, ini_, end_}]:=
With[{endEvolved=end},
	QuantumProduct[data,{j,ini,endEvolved}] /;
	Unevaluated[end]=!=endEvolved
];

(* notice in the following definition
 the way to check that some of the patterns are
 NumericQ. This is because of the HoldAll attribute:
 those patterns must be or EVOLVE to numbers,
 but I need HoldAll because I need two pattens
 that must not evolve, j and data[j], to shield from possible
 global variable with the same name as the dummy index j *)
QuantumProduct[data_, {j_Symbol, ini_, end_}]:=
If[TrueQ[end>=ini],
	Expand[Apply[zz075NonCommutativeTimes,Reverse[Table[data,{j,ini,end}]]]],
	1 
]/; (   (NumericQ[ini])&&
		(NumericQ[end]) );
	
QuantumProduct[data_, {j_Symbol, ini_, end_, inc_}]:=
If[(end*Sign[inc])>=ini,
	Expand[Apply[zz075NonCommutativeTimes,Reverse[Table[data,{j,ini,end,inc}]]]],
	1 
]/; (	(NumericQ[ini])&&
		(NumericQ[end])&&
		(NumericQ[inc])  );

(* Transform QProd[a,list1,list2] into QProd[QProd[a,list2],list1] (nested) *)
QuantumProduct[mult_?(Not[QuantumScalarQ[#]]&),
				iterators__List,lastiterator_List,opts:OptionsPattern[]]:=
QuantumProduct[QuantumProduct[mult,lastiterator,opts],iterators,opts];


(*zz075NonCommutativeTimes rules*)
(*IMPORTANT: The internal representation zz075NonCommutativeTimes has
the arguments in "Reverse" order, as compared with the external representation.
This improves evaluation speed by one or two orders of magnitude,
because it avoids that operators grow too large before being applied
to a ket*)

zz075NonCommutativeTimes[
		after___,
		graph:(Graphics | Graphics3D)[__], 
		before___
		] :=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]},
	zz075NonCommutativeTimes[
		after,
		Part[qinfo, 1],
		before
	] /; Length[qinfo]===1
];

(* Asociativity *)
zz075NonCommutativeTimes[
		after___,
		zz075NonCommutativeTimes[args__], 
		before___
		] :=
	zz075NonCommutativeTimes[
		after,
		args,
		before
	];


(* OneIdentity?*)
zz075NonCommutativeTimes[]:=Sequence[];
zz075NonCommutativeTimes[x_]:=x;

(* Operator acting on its eigenket*)
(* Remember that operands order is reversed in internal representation*)
zz075NonCommutativeTimes[
		after___,
		zz080Ket[zz080Eigenstate[zz080Operator[op_], ev_],restket___], 
		zz080Operator[op_],
		before___
		] :=
	ev*zz075NonCommutativeTimes[
				after,
				zz080Ket[zz080Eigenstate[zz080Operator[op], ev],restket],
				before];
				
(* Eigenstates of the same operator are orthonormal *)
(* Remember that operands order is reversed in internal representation*)
zz075NonCommutativeTimes[
		after___,
		zz080Ket[zz080Eigenstate[zz080Operator[opSame_], evket_],restket___],
		zz080Bra[zz080Eigenstate[zz080Operator[opSame_], evbra_],restbra___],
		before___
		] := 
	KroneckerDelta[evbra-evket]*
	zz075NonCommutativeTimes[
		after,
		zz080Ket[restket],
		zz080Bra[restbra],
		before
		];

zz080Ket[]=Sequence[];
zz080Bra[]=Sequence[];

(* Eigenstates of different operators live in different subspaces*)
(* in other words, their operators are assumed to commute*)
(* Remember that operands order is reversed in internal representation*)
zz075NonCommutativeTimes[
		after___,
		zz080Ket[zz080Eigenstate[zz080Operator[opket_], evket_],restket___],
		zz080Bra[zz080Eigenstate[zz080Operator[opbra_], evbra_],restbra___],		
		before___
		]:=
	zz075NonCommutativeTimes[
			after,
			zz080Ket[restket],
			zz080Bra[zz080Eigenstate[zz080Operator[opbra], evbra]],
			zz080Ket[zz080Eigenstate[zz080Operator[opket], evket]],
			zz080Bra[restbra],
			before
		] /; opket=!=opbra;

(* Integer powers of an eigenket-eigenbra (an operator element)
gets automatically expanded (therefore gets calculated) *)
zz075NonCommutativeTimes /:
	Power[	zz075NonCommutativeTimes[
 				zz080Bra[rightbra___,zz080Eigenstate[braeigen___],leftbra___], 
 				zz080Ket[rightket___,zz080Eigenstate[keteigen___],leftket___]],
			exponent_?(IntegerQ[#]&&(#>1) &)]:=
		zz075NonCommutativeTimes[ 
			Sequence @@ Flatten[ Table[
							{zz080Bra[rightbra,zz080Eigenstate[braeigen],leftbra], 
 							 zz080Ket[rightket,zz080Eigenstate[keteigen],leftket]},
							{exponent}
						]]
		 ];


(***************** AUTOMATIC EXPANSIONS ON KETS ***********)
(* Note: We CANNOT have ALSO automatic expansions on bras, otherwise
calculations become very slow, as was discovered with the 
naive approach to the Quantum Random Walker *)
(* Linearity 1 case a in Plus is applied
if it has an effect on a ket to the right*)
HoldPattern[zz075NonCommutativeTimes[
		after___, 
		rightket_zz080Ket,
		middle___,
		(a_?(Not[QuantumScalarQ[#]]&) + b_), 
		before___
		]] := 
With[{calculated=zz075NonCommutativeTimes[rightket, middle,a] 
	},
	zz075NonCommutativeTimes[
		after,
		calculated + zz075NonCommutativeTimes[rightket, middle,b],
		before
	] /;
	Module[{rules,evaluated,unevaluated},
	 rules=RuleDelayed @@@ Transpose[{{a},Map[zz080freeze,{a}]}];
	 evaluated=(calculated /. rules);
	 unevaluated=
	 	ReleaseHold[Hold[
	 		zz075NonCommutativeTimes[rightket, middle,a]] /. 
	 	rules];
	 evaluated=!=unevaluated]
];

(* Linearity 1 case b in Plus is applied
if it has an effect on a ket *)
HoldPattern[zz075NonCommutativeTimes[
		after___, 
		(x_.*HoldPattern[zz075NonCommutativeTimes[aket_zz080Ket,a__]] + b_), 
		before___
		]] := 
With[{calculated=x*zz075NonCommutativeTimes[
					after,
					aket,
					a,
					before
					]
	},
	calculated+
	zz075NonCommutativeTimes[
		after,
		b,
		before
	] /;
	Module[{rules,evaluated,unevaluated},
	 rules=RuleDelayed @@@ Transpose[{{aket},Map[zz080freeze,{aket}]}];
	 evaluated=(calculated /. rules);
	 unevaluated=
	 	ReleaseHold[Hold[
	 		x*zz075NonCommutativeTimes[
					after,
					aket,
					a,
					before
					]] /. 
	 	rules];
	 evaluated=!=unevaluated]
];

(* Linearity 1 case c in Plus is applied
if it has an effect on a ket *)
HoldPattern[zz075NonCommutativeTimes[
		after___, 
		(x_.*aket_zz080Ket + b_), 
		before___
		]] := 
With[{calculated=x*zz075NonCommutativeTimes[
					after,
					aket,
					before
					]
	},
	calculated+
	zz075NonCommutativeTimes[
		after,
		b,
		before
	] /;
	Module[{rules,evaluated,unevaluated},
	 rules=RuleDelayed @@@ Transpose[{{aket},Map[zz080freeze,{aket}]}];
	 evaluated=(calculated /. rules);
	 unevaluated=
	 	ReleaseHold[Hold[
	 		x*zz075NonCommutativeTimes[
					after,
					aket,
					before
					]] /. 
	 	rules];
	 evaluated=!=unevaluated]
];

(* The commutator [a,b] is evaluated to ab-ba if
the evaluation has an effect on the ket to the right  *)
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	rightket_zz080Ket, 
	HoldPattern[zz050Commutator[nc1_,nc2_,opts:OptionsPattern[]]],
 	left___]]:=
With[{calculated=
		zz075NonCommutativeTimes[rightket,nc2,nc1]-
			zz075NonCommutativeTimes[rightket,nc1,nc2]
		},
	zz075NonCommutativeTimes[
		rightmost,
		calculated,
		left
	] /;
	Module[{nc1rules,nc2rules,rules,evaluated,unevaluated},
	 nc1rules=RuleDelayed @@@ Transpose[{{nc1},Map[zz080freeze,{nc1}]}];
	 nc2rules=RuleDelayed @@@ Transpose[{{nc2},Map[zz080freeze,{nc2}]}];
	 rules=Join[nc1rules,nc2rules];
	 evaluated=(calculated /. rules);
	 unevaluated=
	 	ReleaseHold[Hold[
	 		zz075NonCommutativeTimes[rightket,nc2,nc1]-
			zz075NonCommutativeTimes[rightket,nc1,nc2]] /. 
	 	rules];
	 evaluated=!=unevaluated]
];

(* Integer powers of a commutator 
get expanded if one application
of the commutator has an effect 
on the kets to the right *) 
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	right_zz080Ket, 
	Power[HoldPattern[zz050Commutator[nc1_,nc2_,opts:OptionsPattern[]]],
		m_?(IntegerQ[#]&&(#>1) &)],
 	left___]]:=
With[{onetime=zz075NonCommutativeTimes[right,zz050Commutator[nc1,nc2,opts]]},
	zz075NonCommutativeTimes[ 
		rightmost,
 		onetime,
 		Power[zz050Commutator[nc1,nc2,opts],m-1],
 		left] /;
	Module[{nc1rules,nc2rules,rules,evaluated,unevaluated},
	 nc1rules=RuleDelayed @@@ Transpose[{{nc1},Map[zz080freeze,{nc1}]}];
	 nc2rules=RuleDelayed @@@ Transpose[{{nc2},Map[zz080freeze,{nc2}]}];
	 rules=Join[nc1rules,nc2rules];
	 evaluated=(onetime /. rules);
	 unevaluated=ReleaseHold[Hold[
	 	zz075NonCommutativeTimes[right,zz050Commutator[nc1,nc2,opts]]] /. rules];
	 evaluated=!=unevaluated]
];

(* The anticommutator {a,b} is evaluated to ab+ba if
the evaluation has an effect on the ket to the right  *)
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	rightket_zz080Ket, 
	HoldPattern[zz050AntiCommutator[nc1_,nc2_,opts:OptionsPattern[]]],
 	left___]]:=
With[{calculated=
		zz075NonCommutativeTimes[rightket,nc2,nc1]+
			zz075NonCommutativeTimes[rightket,nc1,nc2]
		},
	zz075NonCommutativeTimes[
		rightmost,
		calculated,
		left
	] /;
	Module[{nc1rules,nc2rules,rules,evaluated,unevaluated},
	 nc1rules=RuleDelayed @@@ Transpose[{{nc1},Map[zz080freeze,{nc1}]}];
	 nc2rules=RuleDelayed @@@ Transpose[{{nc2},Map[zz080freeze,{nc2}]}];
	 rules=Join[nc1rules,nc2rules];
	 evaluated=(calculated /. rules);
	 unevaluated=
	 	ReleaseHold[Hold[
	 		zz075NonCommutativeTimes[rightket,nc2,nc1]+
			zz075NonCommutativeTimes[rightket,nc1,nc2]] /. 
	 	rules];
	 evaluated=!=unevaluated]
];

(* Integer powers of an anticommutator 
get expanded if one application
of the commutator has an effect 
on the kets to the right *) 
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	right_zz080Ket, 
	Power[HoldPattern[zz050AntiCommutator[nc1_,nc2_,opts:OptionsPattern[]]],
		m_?(IntegerQ[#]&&(#>1) &)],
 	left___]]:=
With[{onetime=zz075NonCommutativeTimes[right,zz050AntiCommutator[nc1,nc2,opts]]},
	zz075NonCommutativeTimes[ 
		rightmost,
 		onetime,
 		Power[zz050AntiCommutator[nc1,nc2,opts],m-1],
 		left] /;
	Module[{nc1rules,nc2rules,rules,evaluated,unevaluated},
	 nc1rules=RuleDelayed @@@ Transpose[{{nc1},Map[zz080freeze,{nc1}]}];
	 nc2rules=RuleDelayed @@@ Transpose[{{nc2},Map[zz080freeze,{nc2}]}];
	 rules=Join[nc1rules,nc2rules];
	 evaluated=(onetime /. rules);
	 unevaluated=ReleaseHold[Hold[
	 	zz075NonCommutativeTimes[right,zz050AntiCommutator[nc1,nc2,opts]]] /. rules];
	 evaluated=!=unevaluated]
];


(* Integer powers of a concatenation of 
quantum objects get expanded if one application
of the concatenation has an effect on the kets to the right *) 
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	right_zz080Ket, 
	Power[HoldPattern[zz075NonCommutativeTimes[nc1_,nc2__]],
		m_?(IntegerQ[#]&&(#>1) &)],
 	left___]]:=
With[{onetime=zz075NonCommutativeTimes[right,nc1,nc2]},
	zz075NonCommutativeTimes[ 
		rightmost,
 		onetime,
 		Power[zz075NonCommutativeTimes[nc1,nc2],m-1],
 		left] /;
	Module[{nc1rules,nc2rules,rules,evaluated,unevaluated},
	 nc1rules=RuleDelayed @@@ Transpose[{{nc1},Map[zz080freeze,{nc1}]}];
	 nc2rules=RuleDelayed @@@ Transpose[{{nc2},Map[zz080freeze,{nc2}]}];
	 rules=Join[nc1rules,nc2rules];
	 evaluated=(onetime /. rules);
	 unevaluated=ReleaseHold[Hold[zz075NonCommutativeTimes[right,nc1,nc2]] /. rules];
	 evaluated=!=unevaluated]
]; 

(* The power of an addition of quantum objects
 is expanded if the expantion has an effect on the
 ket to the right *)
HoldPattern[zz075NonCommutativeTimes[
	rightmost___,
	right_zz080Ket, 
	pow:Power[Plus[_?(Not[QuantumScalarQ[#]]&),__],_?(IntegerQ[#]&&(#>1) &)],
 	left___]]:=
With[{calculated=zz075NonCommutativeTimes[right,Expand[pow]]},
	zz075NonCommutativeTimes[rightmost,calculated,left] /;
	Module[{quantumAtoms,rules,evaluated,unevaluated},
		quantumAtoms=
			Cases[pow, _?(And[Not[QuantumScalarQ[#]],
							FreeQ[#,Plus],
							FreeQ[#,zz075NonCommutativeTimes]]&),
					Infinity];
		rules=RuleDelayed @@@ 
				Transpose[{quantumAtoms,Map[zz080freeze,quantumAtoms]}];
		evaluated=(calculated /. rules);
		unevaluated=
			zz075NonCommutativeTimes[
				right,(Expand[pow] /. rules)];
		evaluated=!=unevaluated]
];

(* END OF AUTOMATIC EXPANSIONS ON KETS *)

(* Tensor product of kets. No checking is done at this point*)
zz075NonCommutativeTimes[
		after___,
		zz080Ket[e1__],
		zz080Ket[e2__],
		before___
		] :=  
	zz075NonCommutativeTimes[
			after,			
			zz080Ket[e1,e2],
			before
		];

(* Tensor product of bras. No checking is done in this moment*)
zz075NonCommutativeTimes[
		after___,
		zz080Bra[e1__],
		zz080Bra[e2__],
		before___
		] :=  
	zz075NonCommutativeTimes[
			after,			
			zz080Bra[e1,e2],
			before
		];

(* Linearity 1 in plus was moved to Expand and action on kets *)
(* Linearity 2*)  
zz075NonCommutativeTimes[
		after___, 
		(a_?QuantumScalarQ *b_), 
		before___
		] := 
		a*zz075NonCommutativeTimes[after, b, before] /; ({before, after} =!= {});

(* The quantum product with a nonzero scalar becomes a normal product*)
zz075NonCommutativeTimes[
		after___, 
		a_?(And[#=!=0,#=!=0.0,QuantumScalarQ[#]]&), 
		before___
		] := 
		a*zz075NonCommutativeTimes[after, before] /; ({before, after} =!= {});

(* The quantum product with zero becomes zero
 this could Not be included in the rule above, otherwise gives
 problems in large calculations where intermidiate zeros 
 are generated and,
 if pulled out, create wrong ket-ket products *)
zz075NonCommutativeTimes[
		after___, 
		a_?(#==0&), (*this includes 0 and 0.0*) 
		before___
		] := 0;
		
(* Quantum product of (powers of) identical objects goes to Power*)
zz075NonCommutativeTimes[
		after___, 
		x_^m_.,x_^n_., 
		before___
		] := 
		zz075NonCommutativeTimes[after, x^(m+n) ,before] /;
And[QuantumScalarQ[m],QuantumScalarQ[n]];

(* CommutatorExpand and EvaluateCommutators RULES *)

(* Usually the output of Expand[expr] is the
same as the output of Expand[EvaluateAllCommutators[CommutatorExpand[expr]]],
therefore EvaluateAllCommutators is (nearly) the inverse of CommutatorExpand 
*)

EvaluateAllCommutators[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	EvaluateAllCommutators[Part[qinfo,1], opts] /;
	Length[qinfo]===1
]; 
 
EvaluateAllCommutators[expr_,opts:OptionsPattern[]]:=
Module[{e2},
	e2=expr//. (* ReplaceRepeated: All commutators *)
			{HoldPattern[zz050Commutator[x_,y_,OptionsPattern[]]]:>
				(zz075NonCommutativeTimes[y,x]-
					zz075NonCommutativeTimes[x,y]),
			HoldPattern[zz050AntiCommutator[x_,y_,OptionsPattern[]]]:>
				(zz075NonCommutativeTimes[y,x]+
					zz075NonCommutativeTimes[x,y])
			}
];

EvaluateCommutators[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	EvaluateCommutators[Part[qinfo,1], opts] /;
	Length[qinfo]===1
]; 

EvaluateCommutators[expr_,opts:OptionsPattern[]]:=
Module[{e2},
	e2=expr/. (* ReplaceAll: only top layer of commutators *)
			{HoldPattern[zz050Commutator[x_,y_,OptionsPattern[]]]:>
				(zz075NonCommutativeTimes[y,x]-
					zz075NonCommutativeTimes[x,y]),
			HoldPattern[zz050AntiCommutator[x_,y_,OptionsPattern[]]]:>
				(zz075NonCommutativeTimes[y,x]+
					zz075NonCommutativeTimes[x,y])
			} 
];

CommutatorExpand[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	CommutatorExpand[Part[qinfo,1], opts] /;
	Length[qinfo]===1
]; 

(* CommutatorExpand threads on equations  *)
CommutatorExpand[HoldPattern[lhs_==rhs_],opts:OptionsPattern[]]:=
	(CommutatorExpand[lhs,opts]==CommutatorExpand[rhs,opts]);

(* CommutatorExpand of power of an addition INSIDE zz075NonCommutativeTimes  *)
CommutatorExpand[
	sumando_.+factor_.*
		HoldPattern[
			zz075NonCommutativeTimes[
				after___,
				pow:Power[HoldPattern[Plus[__]],_],
				before___
]],opts:OptionsPattern[]]:=
With[{powcomexpanded=CommutatorExpand[pow,opts]},
	CommutatorExpand[	
		sumando+factor*
			zz075NonCommutativeTimes[
				after,
				powcomexpanded,
				before ],opts] /;
powcomexpanded=!=pow]; (* avoid infinite loop *)

(* Fast expansion for binomials of operators
with a scalar commutator
by Gianfranco Arroyo-Orrico *)
CommutatorExpand[
	sumando_.+factor_.*
		powplus:Power[HoldPattern[
					Plus[qoA_?(Not[QuantumScalarQ[#]]&),
						 qoB_?(Not[QuantumScalarQ[#]]&)]],
					n_?(And[IntegerQ[#],#>0]&)],
	opts:OptionsPattern[]]:=
With[{x=zz050Commutator[qoB,qoA]},
	Module[{k,c,a,b,ro,rules,comm},
		ro=OptionValue[ReverseOrdering];
		rules=If[TrueQ[Or[ro&&Not[OrderedQ[{qoA,qoB}]],Not[ro]&&Not[OrderedQ[{qoB,qoA}]]]],
				comm=x;
				{HoldPattern[Times[Power[a,na_.],Power[b,nb_.],arg___]]:>
					zz075NonCommutativeTimes[Power[qoB,nb],Power[qoA,na],arg]},
				comm=-x;
				{HoldPattern[Times[Power[a,na_.],Power[b,nb_.],arg___]]:>
					zz075NonCommutativeTimes[Power[qoA,na],Power[qoB,nb],arg]}
			];
		c[n1_, k1_] := (n1 + k1)!/(2^k1*(n1 - k1)!*k1!);
		CommutatorExpand[sumando+factor*
			Sum[Expand[comm^k*c[n - k, k]*(a + b)^(n - 2*k)], {k, 0, n/2}] /.
			rules /. 
			{HoldPattern[Times[Power[b,e_.],arg___]]:>
				zz075NonCommutativeTimes[Power[qoB,e],arg],
			HoldPattern[Times[Power[a,e_.],arg___]]:>
				zz075NonCommutativeTimes[Power[qoA,e],arg]} /.
			{HoldPattern[Power[b,e_.]]:>Power[qoB,e],
			 HoldPattern[Power[a,e_.]]:>Power[qoA,e]},
		opts]
	] /;
And[OptionValue[Method]===Automatic,
	Or[OptionValue[Anticommutators]===False,
		OptionValue[Anticommutators]===None,
		OptionValue[Anticommutators]===Automatic,
		And[Head[OptionValue[Anticommutators]]===List,
			FreeQ[OptionValue[Anticommutators],{qoA,qoB}],
			FreeQ[OptionValue[Anticommutators],{qoB,qoA}]
	]], 
	QuantumScalarQ[x],
	x=!=0,
	x=!=0.0
	]
];

(* Fast expansion for binomials of operators
with a scalar Anticommutator
by Gianfranco Arroyo-Orrico *)
CommutatorExpand[
	sumando_.+factor_.*
		powplus:Power[HoldPattern[
					Plus[qoA_?(Not[QuantumScalarQ[#]]&),
						 qoB_?(Not[QuantumScalarQ[#]]&)]],
					m_?(And[IntegerQ[#],#>0]&)],
	opts:OptionsPattern[]]:=
With[{anti=zz050AntiCommutator[qoB,qoA]},
	Module[{x,n,p,a,b,ro,rules},
		ro=OptionValue[ReverseOrdering];

		rules=If[TrueQ[Or[ro&&Not[OrderedQ[{qoA,qoB}]],Not[ro]&&Not[OrderedQ[{qoB,qoA}]]]],
				{HoldPattern[Times[Power[a,na_.],Power[b,nb_.],arg___]]:>
					zz075NonCommutativeTimes[Power[qoB,nb],Power[qoA,na],arg]},
				{HoldPattern[Times[Power[a,na_.],Power[b,nb_.],arg___]]:>
					zz075NonCommutativeTimes[Power[qoA,na],Power[qoB,nb],arg]}
			];

		CommutatorExpand[sumando+factor*
			Sum[anti^(p/2)*
				Sum[Limit[QBinomial[m - p, n, x], x -> -1]*
						a^n*b^(m - n - p)*
						Limit[QBinomial[m, p, x], x -> -1],
				{n, 0, m}], 
			{p, 0, m, 2}] /.
			rules /. 
			{HoldPattern[Times[Power[b,e_.],arg___]]:>
				zz075NonCommutativeTimes[Power[qoB,e],arg],
			HoldPattern[Times[Power[a,e_.],arg___]]:>
				zz075NonCommutativeTimes[Power[qoA,e],arg]} /.
			{HoldPattern[Power[b,e_.]]:>Power[qoB,e],
			 HoldPattern[Power[a,e_.]]:>Power[qoA,e]},
		opts] 
	] /;
And[TrueQ[$VersionNumber>=7.0],
	OptionValue[Method]===Automatic,
	Or[ OptionValue[Anticommutators]===True,
		OptionValue[Anticommutators]===All,
		OptionValue[Anticommutators]===Automatic,
		And[ Head[OptionValue[Anticommutators]]===List,
			 Or[Not[FreeQ[OptionValue[Anticommutators],{qoA,qoB}]],
				Not[FreeQ[OptionValue[Anticommutators],{qoB,qoA}]]
		]]], 
	QuantumScalarQ[anti],
	anti=!=0,
	anti=!=0.0]
];

(* CommutatorExpand of power of an addition OUTSIDE zz075NonCommutativeTimes
it is assumed that CommutatorExpand will always have an effect on the 
 result of an expansion of a power *)
CommutatorExpand[
	sumando_.+factor_.*
		powplus:Power[HoldPattern[Plus[__]],_],
	opts:OptionsPattern[]]:=
With[{powexpanded=Expand[powplus,Sequence@@FilterRules[{opts},Options[Expand]]]},
	CommutatorExpand[
		sumando + factor * powexpanded,
	opts] /;
powexpanded=!=powplus]; (* avoid infinite loop *)

(* CommutatorExpand of power of a concatenation (noncommutative "product")
   INSIDE zz075NonCommutativeTimes 
   it is assumed that CommutatorExpand will always have an effect on the 
 result of an expansion of a power *)
CommutatorExpand[
	sumando_.+factor_.*
		nct:HoldPattern[
			zz075NonCommutativeTimes[
				after___,
				Power[HoldPattern[zz075NonCommutativeTimes[__]],_],
				before___]],
	opts:OptionsPattern[]]:=
With[{nctexpanded=Expand[nct,Sequence@@FilterRules[{opts},Options[Expand]]]},
	CommutatorExpand[
		sumando + factor * nctexpanded,
	opts] /;
nctexpanded=!=nct]; (* avoid infinite loop *)

(* CommutatorExpand of power of a concatenation (noncommutative "product")
   OUTSIDE zz075NonCommutativeTimes 
   it is assumed that CommutatorExpand will always have an effect on the 
 result of an expansion of a power*)
CommutatorExpand[
	sumando_.+factor_.*
		pownct:Power[HoldPattern[
					zz075NonCommutativeTimes[__]],_],
	opts:OptionsPattern[]]:=
With[{powexpanded=Expand[pownct,Sequence@@FilterRules[{opts},Options[Expand]]]},
	CommutatorExpand[
		sumando + factor * powexpanded,
	opts] /;
powexpanded=!=pownct]; (* avoid infinite loop *)

(* Linearity 1 in CommutatorExpand is used 
only if it generates commutators.
	It is assumed that Expand will always have an effect on
	an expression with this structure
*)
CommutatorExpand[
	sumando_.+factor_.*
		HoldPattern[zz075NonCommutativeTimes[
			after___, 
			myplus:Plus[__], 
			before___]],
	opts:OptionsPattern[]] := 
With[{comexpanded=CommutatorExpand[Expand[
		sumando+factor*
			zz075NonCommutativeTimes[
			after, 
			myplus, 
			before]],opts]},
	comexpanded/;
comexpanded=!=
	Expand[sumando+factor*
			zz075NonCommutativeTimes[
			after, 
			myplus, 
			before]]];	

(* Main CommutatorExpand rule: Organize (order) the terms in a noncommutative 
"multiplication" (concatenation) paying the "price" of the 
commutator or the anticommutator. 
 *)
CommutatorExpand[
	HoldPattern[zz075NonCommutativeTimes[
		after___,
		qoAfter:Power[qoA_?(And[Not[QuantumScalarQ[#]],Not[Head[#]===Plus]]&),expA_.],
		qoBefore:Power[qoB_?(And[Not[QuantumScalarQ[#]],Not[Head[#]===Plus]]&),expB_.],
		before___
	]],opts:OptionsPattern[]]:=
Module[{type,comm,anti,calculated,expanded,repA,repB,k},
	(* Selection of type of expansion (commutators or anticommutators) *)
	type=Switch[OptionValue[Anticommutators],
		True, "anti",
		All,"anti",
		False, "comm",
		None, "comm",
		{__}, If[TrueQ[And[FreeQ[OptionValue[Anticommutators],{qoA,qoB}],
						FreeQ[OptionValue[Anticommutators],{qoB,qoA}]]],
				"comm","anti"], 
		_,	Which[ (* Automatic selection of the type of expansion
					(either commutators or anticommutators) *)
				NumericQ[zz050Commutator[qoA,qoB]],"comm",
				NumericQ[zz050AntiCommutator[qoA,qoB]],"anti",
				If[	TrueQ[OptionValue[ReverseOrdering]],
					ReleaseHold[Hold[ValueQ[zz050Commutator[repB,repA]]]/.
						{repA->qoA,repB->qoB}],
					ReleaseHold[Hold[ValueQ[zz050Commutator[repA,repB]]]/.
						{repA->qoA,repB->qoB}] ],
					"comm",
				If[	TrueQ[OptionValue[ReverseOrdering]],
					ReleaseHold[Hold[ValueQ[zz050AntiCommutator[repB,repA]]]/.
						{repA->qoA,repB->qoB}],
					ReleaseHold[Hold[ValueQ[zz050AntiCommutator[repA,repB]]]/.
						{repA->qoA,repB->qoB}] ],
					"anti",
				Not[FreeQ[{after,qoAfter,qoBefore,before},
							zz050AntiCommutator]],
					"anti",
				True,"comm"]]; (* end of selection of type of expansion *)
				
	If[ type==="comm",
		(* COMMUTATORS *)
		If[TrueQ[And[OptionValue[Method]===Automatic,
					IntegerQ[expA],expA>0,
					IntegerQ[expB],expB>0,
					QuantumScalarQ[zz050Commutator[qoB, qoA]],
					zz050Commutator[qoB, qoA]!=0
				]],
			(* Use fast-expansion formulas for scalar commutator 
				developed by Sergio E Martinez-Casas*)
			CommutatorExpand[zz075NonCommutativeTimes[
					after,
					Sum[(1/(expB - expA + k)!)*
						Binomial[expA, k]*(expB!)*
						Power[zz050Commutator[qoB, qoA],(expA - k)]*
						zz075NonCommutativeTimes[qoB^(expB - expA + k), qoA^k], 
						{k, 0, expA}],
					before],
				opts],
			(* Use slow general exchange procedure for commutators *)
				(* A previous expansion that does Not call CommutatorExpand in order
	 				to investigate and avoid the posibility of infinite looping *)				
			calculated=ExpandAll[
				zz075NonCommutativeTimes[
					after,
					zz075NonCommutativeTimes[
						qoBefore,
						qoAfter] - 
					zz050Commutator[qoAfter,qoBefore,
						Sequence@@FilterRules[{opts},Options[zz050Commutator]]],
					before]];
			expanded=ExpandAll[zz075NonCommutativeTimes[after,qoAfter,qoBefore,before]];
			(* If there is No possibility of infinite looping, go on with the expansion: *)
			If[And[FreeQ[calculated,expanded],FreeQ[expanded,calculated]],
				zz075NonCommutativeTimes[
					CommutatorExpand[zz075NonCommutativeTimes[after,qoBefore],opts],
					CommutatorExpand[zz075NonCommutativeTimes[qoAfter,before],opts]
				] -
				CommutatorExpand[zz075NonCommutativeTimes[
					after,
					zz050Commutator[qoAfter,qoBefore,
										Sequence@@FilterRules[{opts},Options[zz050Commutator]]],
					before
				],opts],
				(* if there is the possibility of infinite looping,
					then try expanding the other subparts of the expression: *)
				zz075NonCommutativeTimes[
					CommutatorExpand[zz075NonCommutativeTimes[after,qoAfter],opts],
					CommutatorExpand[zz075NonCommutativeTimes[qoBefore,before],opts]]					
			] 
		], (*end of expansion in the case of commutators *)
		
		(* ANTICOMMUTATORS *)
		If[	TrueQ[And[OptionValue[Method]===Automatic,
					IntegerQ[expA],expA>0,
					IntegerQ[expB],expB>0,
					QuantumScalarQ[zz050AntiCommutator[qoB, qoA]]
				]],
			(* Use fast-expansion formulas for scalar anticommutator 
				developed by Sergio E Martinez-Casas*)			
			If[ TrueQ[And[OddQ[expA],OddQ[expB]]],
				(* case when both exponents are odd: *)
				CommutatorExpand[
				zz075NonCommutativeTimes[
						after,
						zz050AntiCommutator[qoB, qoA]*
							zz075NonCommutativeTimes[qoB^(expB-1),qoA^(expA-1)]-
							zz075NonCommutativeTimes[qoB^expB,qoA^expA],
						before],
					opts],
				(* case when at least one exponent is even: *)
				CommutatorExpand[
					zz075NonCommutativeTimes[after,qoB^expB,qoA^expA,before],
					opts] ],
			(* Use slow general exchange procedure for anticommutators *)
				(* A previous expansion that does Not call CommutatorExpand in order
	 				to investigate and avoid the posibility of infinite looping *)				
			calculated=ExpandAll[
				zz075NonCommutativeTimes[
					after,
					zz050AntiCommutator[qoAfter,qoBefore,
						Sequence@@FilterRules[{opts},Options[zz050AntiCommutator]]]-
					zz075NonCommutativeTimes[
						qoBefore,
						qoAfter],
					before]];
			expanded=ExpandAll[zz075NonCommutativeTimes[after,qoAfter,qoBefore,before]];
			(* If there is No possibility of infinite looping, go on with the expansion: *)
			If[And[FreeQ[calculated,expanded],FreeQ[expanded,calculated]],
				CommutatorExpand[zz075NonCommutativeTimes[
					after,
					zz050AntiCommutator[qoAfter,qoBefore,
										Sequence@@FilterRules[{opts},Options[zz050Commutator]]],
					before
				],opts] -
				zz075NonCommutativeTimes[
					CommutatorExpand[zz075NonCommutativeTimes[after,qoBefore],opts],
					CommutatorExpand[zz075NonCommutativeTimes[qoAfter,before],opts]
				],
				(* if there is the possibility of infinite looping,
					then try expanding the other subparts of the expression: *)
				zz075NonCommutativeTimes[
					CommutatorExpand[zz075NonCommutativeTimes[after,qoAfter],opts],
					CommutatorExpand[zz075NonCommutativeTimes[qoBefore,before],opts]]					

			]]	(*end of expansion in the case of anticommutators *)	
	] (*end of expansion stage*)
] /; (*end of module*)
And[
	If[TrueQ[OptionValue[ReverseOrdering]],
		Not[OrderedQ[{qoAfter,qoBefore}]],
		Not[OrderedQ[{qoBefore,qoAfter}]]
	],
	
	And[FreeQ[qoBefore,zz080Ket],
		FreeQ[qoAfter,zz080Ket],
		FreeQ[qoBefore,zz080Bra],
		FreeQ[qoAfter,zz080Bra]
	],
	
	Or[	OptionValue[NestedCommutators],	
		And[FreeQ[qoBefore,zz050Commutator],
			FreeQ[qoAfter,zz050Commutator],
			FreeQ[qoBefore,zz050AntiCommutator],
			FreeQ[qoAfter,zz050AntiCommutator]
	]]];(*end of main CommutatorExpand rule *)

(* Simple (but important) CommutatorExpand general rules: *)
CommutatorExpand[suma_Plus,opts:OptionsPattern[]]:=
	Map[CommutatorExpand[#,opts]&,suma];

CommutatorExpand[mult_Times,opts:OptionsPattern[]]:=
	Map[CommutatorExpand[#,opts]&,mult];

CommutatorExpand[e_,opts:OptionsPattern[]]:=e;

CommutatorExpand[opts:OptionsPattern[]]:=Sequence[];

CommutatorExpand[]:=Sequence[];

(** COLLECT rules and definitions  **)

(* Rules of zz075NonCommutativeTimes inside CollectFromLeft*)
ClearAll[zz080ncleft,zz080ncright];
SetQuantumObject[zz080ncleft,zz080ncright];

zz080ncleft[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz080ncleft[Part[qinfo,1], opts] /;
	Length[qinfo]===1
];

zz080ncleft[arg___,common__,common__]:=
	zz080ncleft[arg,Power[zz080ncleft[common],2]];
zz080ncleft[arg___,common__,Power[zz080ncleft[common__],n_]]:=
	zz080ncleft[arg,Power[zz080ncleft[common],n+1]];
zz080ncleft[arg___,Power[zz080ncleft[common__],n_],common__]:=
	zz080ncleft[arg,Power[zz080ncleft[common],n+1]];

zz080ncright[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	zz080ncright[Part[qinfo,1], opts] /;
	Length[qinfo]===1
];

zz080ncright[common__,common__,arg___]:=
	zz080ncright[Power[zz080ncright[common],2],arg];
zz080ncright[Power[zz080ncright[common__],n_],common__,arg___]:=
	zz080ncright[Power[zz080ncright[common],n+1],arg];
zz080ncright[common__,Power[zz080ncright[common__],n_],arg___]:=
	zz080ncright[Power[zz080ncright[common],n+1],arg];
		
Protect[zz080ncleft,zz080ncright];

CollectFromLeft[graph:((Graphics|Graphics3D)[___])]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	CollectFromLeft[Part[qinfo,1]] /;
	Length[qinfo]===1
];

CollectFromRight[graph:((Graphics|Graphics3D)[___])]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	CollectFromRight[Part[qinfo,1]] /;
	Length[qinfo]===1
];

CollectFromLeft[x_?(Not[FreeQ[#,Graphics]]&)]:=
	CollectFromLeft[x/.Graphics[args__]:>CollectFromLeft[Graphics[args]]];

CollectFromRight[x_?(Not[FreeQ[#,Graphics]]&)]:=
	CollectFromRight[x/.Graphics[args__]:>CollectFromRight[Graphics[args]]];
	
CollectFromLeft[x_?(Not[FreeQ[#,Graphics3D]]&)]:=
	CollectFromLeft[x/.Graphics3D[args__]:>CollectFromLeft[Graphics3D[args]]];

CollectFromRight[x_?(Not[FreeQ[#,Graphics3D]]&)]:=
	CollectFromRight[x/.Graphics3D[args__]:>CollectFromRight[Graphics3D[args]]];
	
(* inside CollectFromLeft 
 zz075NonCommutativeTimes is transformed 
 to zz080ncleft in
order to appy left-collect rules.
The repeated application (FixedPoint) allows the alternate use of
the rules of zz080ncleft (for example left factorization) 
and zz075NonCommutativeTimes (for example asociativity) till the result 
is totally "collected".
 *)
CollectFromLeft[x_?(Not[FreeQ[#,zz075NonCommutativeTimes]]&)] := 
FixedPoint[
		#/. zz075NonCommutativeTimes->zz080ncleft /.
		{ 	s1_.*zz080ncleft[arg1__,common_]+s2_.*common_+others___:>
				zz080ncleft[s1*zz080ncleft[arg1]+s2,common]+others,
			s1_.*zz080ncleft[arg1__,common__]+s2_.*zz080ncleft[common__]+others___:>
				zz080ncleft[s1*zz080ncleft[arg1]+s2,common]+others,
			s1_.*zz080ncleft[arg1__,common__]+s2_.*zz080ncleft[arg2__,common__]+others___:>
				zz080ncleft[s1*zz080ncleft[arg1]+s2*zz080ncleft[arg2],common]+others,
				
			s1_.*zz080ncleft[arg1__,Power[common_,n1_?(IntegerQ[#]&&(#>1) &)]] +  
			s2_.*zz080ncleft[arg2__,Power[common_,n2_?(IntegerQ[#]&&(#>1) &)]] +  
			others___ :> 
				If[TrueQ[n1>n2],
					zz080ncleft[
						s1*zz080ncleft[arg1,Power[common,n1-n2]]+
						s2*zz080ncleft[arg2],
						Power[common,n2]],
					zz080ncleft[
						s1*zz080ncleft[arg1]+
						s2*zz080ncleft[arg2,Power[common,n2-n1]],
						Power[common,n1]]
					]
				+ others,

			s1_.*zz080ncleft[arg1__,common_] +  
			s2_.*zz080ncleft[arg2__,Power[common_,n2_?(IntegerQ[#]&&(#>1) &)]] +  
			others___ :> 
				zz080ncleft[
						s1*zz080ncleft[arg1]+
						s2*zz080ncleft[arg2,Power[common,n2-1]],
						common]
				+ others,
				
			s1_.*zz080ncleft[arg1__,Power[common_,n1_?(IntegerQ[#]&&(#>1) &)]] +  
			s2_.*Power[common_,n2_?(IntegerQ[#]&&(#>1) &)] +  
			others___ :> 
				If[TrueQ[n1>n2],
					zz080ncleft[
						s1*zz080ncleft[arg1,Power[common,n1-n2]]+s2,
						Power[common,n2]],
					zz080ncleft[
						s1*zz080ncleft[arg1]+s2*Power[common,n2-n1],
						Power[common,n1]]
					]
				+ others,
				
			s1_.*zz080ncleft[arg1__,common_] +  
			s2_.*Power[common_,n2_?(IntegerQ[#]&&(#>1) &)] +  
			others___ :> 
				zz080ncleft[
						s1*zz080ncleft[arg1]+s2*Power[common,n2-1],
						common]
				+ others,
			
			s1_.*zz080ncleft[arg1__,Power[common_,n1_?(IntegerQ[#]&&(#>1) &)]] +  
			s2_.*common_ +  
			others___ :> 
				zz080ncleft[
						s1*zz080ncleft[arg1,Power[common,n1-1]]+s2,
						common]
				+ others	
			
		}/.
		zz080ncleft->zz075NonCommutativeTimes &,
		x
	];

CollectFromLeft[x_?(FreeQ[#,zz075NonCommutativeTimes]&)]:=x;
	
(* *)	
CollectFromRight[x_?(Not[FreeQ[#,zz075NonCommutativeTimes]]&)] := 
FixedPoint[
		#/. zz075NonCommutativeTimes->zz080ncright /.
		{	s1_.*zz080ncright[common_,arg1__]+s2_.*common_+others___:>
				zz080ncright[common,s1*zz080ncright[arg1]+s2]+others,
			s1_.*zz080ncright[common__,arg1__]+s2_.*zz080ncright[common__]+others___:>
				zz080ncright[common,s1*zz080ncright[arg1]+s2]+others,
			s1_.*zz080ncright[common__,arg1__]+s2_.*zz080ncright[common__,arg2__]+others___:>
				zz080ncright[common,s1*zz080ncright[arg1]+s2*zz080ncright[arg2]]+others,			
				
			s1_.*zz080ncright[Power[common_,n1_?(IntegerQ[#]&&(#>1) &)],arg1__] +  
			s2_.*zz080ncright[Power[common_,n2_?(IntegerQ[#]&&(#>1) &)],arg2__] +  
			others___ :> 
				If[TrueQ[n1>n2],
					zz080ncright[
						Power[common,n2],
						s1*zz080ncright[Power[common,n1-n2],arg1]+
						s2*zz080ncright[arg2]],
					zz080ncright[
						Power[common,n1],
						s1*zz080ncright[arg1]+
						s2*zz080ncright[Power[common,n2-n1],arg2]]
					]
				+ others,

			s1_.*zz080ncright[common_,arg1__] +  
			s2_.*zz080ncright[Power[common_,n2_?(IntegerQ[#]&&(#>1) &)],arg2__] +  
			others___ :> 
				zz080ncright[
						common,
						s1*zz080ncright[arg1]+
						s2*zz080ncright[Power[common,n2-1],arg2]
					]
				+ others,
				
			s1_.*zz080ncright[Power[common_,n1_?(IntegerQ[#]&&(#>1) &)],arg1__] +  
			s2_.*Power[common_,n2_?(IntegerQ[#]&&(#>1) &)] +  
			others___ :> 
				If[TrueQ[n1>n2],
					zz080ncright[
						Power[common,n2],
						s1*zz080ncright[Power[common,n1-n2],arg1]+s2
					],
					zz080ncright[
						Power[common,n1],
						s1*zz080ncright[arg1]+s2*Power[common,n2-n1]
					]
					]
				+ others,
				
			s1_.*zz080ncright[common_,arg1__] +  
			s2_.*Power[common_,n2_?(IntegerQ[#]&&(#>1) &)] +  
			others___ :> 
				zz080ncright[
						common,
						s1*zz080ncright[arg1]+s2*Power[common,n2-1]
					]
				+ others,
			
			s1_.*zz080ncright[Power[common_,n1_?(IntegerQ[#]&&(#>1) &)],arg1__] +  
			s2_.*common_ +  
			others___ :> 
				zz080ncright[
						common,
						s1*zz080ncright[Power[common,n1-1],arg1]+s2
					]
				+ others	
			
		}/.
		zz080ncright->zz075NonCommutativeTimes &,
		x
	];	
	
CollectFromRight[x_?(FreeQ[#,zz075NonCommutativeTimes]&)]:=x;

(*FactorKet is NOT used as a transformation in Simplify
because it returns the factorization wrapped by Hold,
otherwise the factorization would be automatically destroyed
*)

FactorKet[k_?(FreeQ[#,zz075NonCommutativeTimes]&)]:= 
Module[{y,z,w},
	y=k/.zz080Ket[args__]:>
		Apply[Times,Map[\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR],{args}]];
	z=Factor[y];
	Hold[w]/.w->z //.
		HoldPattern[Times[arg1_?(Not[FreeQ[#,\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR]]]&),
						arg2_?(Not[FreeQ[#,\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR]]]&)]]:>
			CircleTimes[arg1,arg2] //. 
		HoldPattern[CircleTimes[argb___,CircleTimes[argi___],arga___]]:>
			CircleTimes[argb,argi,arga] //.
		\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR][args__]:>zz080Ket[args] 
];

FactorKet[k_?(Not[FreeQ[#,zz075NonCommutativeTimes]]&)]:= 
Module[{y,z,w},
	y=k/.zz080Ket[args__]:>
		Apply[zz075NonCommutativeTimes,Reverse[Map[\[ScriptK]\[ScriptE]\[ScriptT],{args}]]];
	z=CollectFromLeft[CollectFromRight[y]];
	Hold[w]/.w->z/.\[ScriptK]\[ScriptE]\[ScriptT][args__]:>zz080Ket[args]
];

FactorKetList[k_?KetQ]:=
Module[{hfk,holdorlist,lista},
	hfk=FactorKet[k];
	holdorlist=hfk /. Hold[CircleTimes[arg__]]:>List[arg];
	(*includes case when it was not possible to factorize*)
	lista=Flatten[ReleaseHold[{holdorlist}]];
	Map[CollectKet,lista]
];

CollectKet[expr_]:=
	Collect[expr,zz080Ket[__]];

(* MODIFICATIONS TO EXPAND TO INCLUDE QUANTUM OBJECTS AND 
NONCOMMUTATIVE PRODUCT (CONCATENATION) *)
expandwasprotected=Unprotect[Expand,ExpandAll];
(* ExpandAll of a Quantum object calls Expand, which has
some rules for quantum objects, 
marks the object as already quantum-expanded with zz080expanded
and calls ExpandAll again, this second time ExpandAll will
use its built-in rules 
*)
ClearAll[zz080quantumexpanded];
SetQuantumObject[zz080quantumexpanded];
Protect[zz080quantumexpanded];
ExpandAll[expr_?(And[Not[QuantumScalarQ[#]],Head[#]=!=zz080quantumexpanded]&),
	opts:OptionsPattern[]]:=
	ExpandAll[
		zz080quantumexpanded[
			Expand[expr,Sequence@@FilterRules[{opts},Options[Expand]]]],
	opts] /. zz080quantumexpanded->Identity;

Expand[graph:((Graphics|Graphics3D)[___]), opts:OptionsPattern[]]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	Expand[Part[qinfo,1], opts] /;
	Length[qinfo]===1
];

(* Expand of power of an addition OUTSIDE zz075NonCommutativeTimes.
Notice that the associativity of addition makes this definition
work for trinomials, etc. 
THIS ONE DOES NOT USE zz080nct*) 
Expand[
	sumando_.+factor_.*
		HoldPattern[
			Power[	Plus[a_?(Not[QuantumScalarQ[#]]&), b_],
					expo_?(IntegerQ[#]&&(#>1) &)]],
        opts:OptionsPattern[]]:=
Module[{tuplas,j},
	If[TrueQ[ And[expo>2,Not[FreeQ[{a,b},zz080Ket]]] ],
		Expand[ sumando+factor*fastPowerExpand[(a+b)^expo,opts],opts ],
		If[$VersionNumber>=5.2,
			tuplas=Tuples[{a,b},expo],
			tuplas=Table[IntegerDigits[j,2,expo],{j,0,2^expo -1}]/.{0->a,1->b}
		];
		Expand[sumando+factor*
				(Plus @@ (Expand[#,Sequence@@FilterRules[{opts},Options[Expand]]]& /@ 
					zz075NonCommutativeTimes @@@ tuplas)),
			Sequence@@FilterRules[{opts},Options[Expand]]]
	]
];

fastPowerExpand[
	HoldPattern[Power[qg_,n_?(And[IntegerQ[#],#>2]&)]],opts:OptionsPattern[]]:=
Module[{lista,lista2,listacal,j,exp},
	lista=Reverse[IntegerDigits[n,2]];
	listacal={};
	exp=qg;
	Do[
		If[lista[[j]]==1,AppendTo[listacal,exp]];
		exp=Expand[exp\[CenterDot]exp,opts],
		{j,Length[lista]}];
	Expand[Apply[zz075NonCommutativeTimes,listacal],opts]
];

(* inside Expand zz075NonCommutativeTimes is transformed to zz080nct in
order to appy linearity and other expansion rules.
The repeated application (FixedPoint) allows the alternate use of
the rules of zz080nct (for example linearity) 
and zz075NonCommutativeTimes (for example asociativity) till the result 
is totally expanded.
 *)
Expand[x_?(Not[FreeQ[#,zz075NonCommutativeTimes]]&),opts:OptionsPattern[]] := 
	FixedPoint[
		Expand[#/.zz075NonCommutativeTimes->zz080nct,
			Sequence@@FilterRules[{opts},Options[Expand]]]/.
		zz080nct->zz075NonCommutativeTimes &,
		x
	];

(* End of modifications to Expand and ExpandAll *)
Protect@@expandwasprotected;

(* Rules of zz075NonCommutativeTimes inside Expand*)
ClearAll[zz080nct];
SetQuantumObject[zz080nct];
(* Linearity of zz075NonCommutativeTimes inside Expand: *)
HoldPattern[zz080nct[
		after___, 
		suma_Plus, 
		before___
		]]:=
	Map[zz080nct[after, #, before]&,suma];
(* Powers of additions get expanded inside Expand: *)
HoldPattern[zz080nct[
			after___,
			powplus:Power[HoldPattern[Plus[__]],_],
			before___
]]:=
With[{powexpanded=Expand[powplus]},
zz080nct[after,
		powexpanded,
		before]/;
powexpanded=!=powplus];
(* zz075NonCommutativeTimes of integer powers get expanded
 inside Expand in order
 to give the oportunity to other rules to be applied.
 For example, let the rule (assignment) for a.b=c be applied to
 the case a.b^3 (a.b.b.b) and give as a result c.b^2 *)
HoldPattern[zz080nct[
			after___,
			pow:Power[base_,expo_Integer],
			before___	
]]:=
zz080nct[after,
		Sequence@@Table[base,{expo}],
		before] /;
FreeQ[pow,Plus];
(* power of zz075NonCommutativeTimes is transformed to
repeated application*)
zz080nct/:
HoldPattern[Power[zz080nct[ncarg__],
				expo_?(IntegerQ[#]&&(#>1) &)]]:=
Nest[zz080nct[ncarg,#]&,zz080nct[ncarg],expo-1];
(*end of rules of zz075NonCommutativeTimes inside Expand*)
Protect[zz080nct];

(* The end-user can assign expresions  
to powers of quantum objects, to quantum products, 
to kets, to commutators and to hermitian conjugates of symbols.
It is not necessary to use HoldPattern because
Set, UpSet, SetDelayed and UpSetDelayed have attribute
HoldFirst or HoldAll *)

VerifyOrderedCommutators::comm="The commutator `1` must be written"<>
								" in the form (order) `2` in the left-hand side"<>
								" of assignments";
VerifyOrderedCommutators::anti="The anticommutator `1` must be written"<>
								" in the form (order) `2` in the left-hand side"<>
								" of assignments";
SetAttributes[VerifyOrderedCommutators,HoldAll];
VerifyOrderedCommutators[args__]:=
Module[{x,y},
	ReleaseHold[Cases[Hold[args],
		HoldPattern[zz050Commutator[x_,y_]]:>
		(Message[VerifyOrderedCommutators::comm,
			HoldForm[zz050Commutator[x,y]],
			HoldForm[zz050Commutator[y,x]]
			];Abort[])/;
			OrderedQ[{Unevaluated[y],Unevaluated[x]}]]];
	ReleaseHold[Cases[Hold[args],
		HoldPattern[zz050AntiCommutator[x_,y_]]:>
		(Message[VerifyOrderedCommutators::anti,
			HoldForm[zz050AntiCommutator[x,y]],
			HoldForm[zz050AntiCommutator[y,x]]
			];Abort[])/;
			OrderedQ[{Unevaluated[y],Unevaluated[x]}]]]
];

powwasp = Unprotect[Power];

Set[Power[arg_?(Not[QuantumScalarQ[#]]&),expo_?(And[IntegerQ[#],#>1]&)], rhs_] ^:=
	Module[{},
		VerifyOrderedCommutators[arg];
		SetDelayed[Power[arg,expo], rhs];
		rhs 
		(* show assignment result, because 
		although SetDelayed is internally used, 
		the assignment is Not really delayed 
		because rhs gets evaluated in Set even before
		entering the module *)	
	];

SetDelayed[Power[arg_?(Not[QuantumScalarQ[#]]&),expo_?(And[IntegerQ[#],#>1]&)], rhs_] ^:=
Module[{unpr,obj,rep,i,myP,ii,arg2,arg3,
		x1,x2,myTagSetDelayed,myCondition,cond,
		argrep,exporep,powrep,n},
		VerifyOrderedCommutators[arg];
		obj=Which[
			Head[arg]===Symbol,arg,
			Head[Head[arg]]===Symbol,Head[arg],
			True, Power
		];
		unpr = Unprotect[Evaluate[obj]];
		If[ Head[rhs]===Condition,
			x1= (Hold[rhs] /. Hold[_[a_,b_]]:>Hold[a]);
			x2= (Hold[rhs] /. Hold[_[a_,b_]]:>Hold[b]);
			SetAttributes[{myTagSetDelayed,myCondition},HoldAll];
			ReleaseHold[myTagSetDelayed[rep,
					Power[argrep,n_?(And[#>1,Mod[#,exporep]===0]&)],
					myCondition[Power[powrep,Quotient[n,exporep]],cond]]/.
				{rep->obj, argrep->arg, exporep->expo, 
					powrep->x1,cond->x2}] /.
			{myCondition->Condition,myTagSetDelayed->TagSetDelayed},
			
			ReleaseHold[Hold[
				TagSetDelayed[rep,
							Power[arg,n_?(And[#>1,Mod[#,expo]===0]&)],
							Power[rhs,Quotient[n,expo]]]]/. rep->obj ]
		];
		Protect@@unpr;
		(* Do Not show assignment result,
		this one is a Delayed assignment 
		because of the HoldAll attribute of SetDelayed  *)
];

(* For integer powers of quantum objects without any assignment,
qo^n, try qo.qo^(n-1) if there is a definition for qo^(n-1).
The static variable outsidepower makes qo^n ask only for qo^(n-1)
without this last one asking for qo^(n-2), etc. *)
outsidepower=True;
Power[base_?(Not[QuantumScalarQ[#]]&),expo_?(And[outsidepower,IntegerQ[#],#>2]&)]:=
	Module[{powminusone},
		powminusone=Power[base,expo-1];
		zz075NonCommutativeTimes[base,powminusone]
	]/;
	Module[{cond,expom},
		outsidepower=False; 
		cond=ReleaseHold[Hold[
				(Unevaluated[Power[base,expom]]=!=Power[base,expom])
			]/.expom->(expo-1)];
		outsidepower=True;
		cond
	];

Protect@@powwasp;

Set[CenterDot[args:((_?(Not[QuantumScalarQ[#]] &) ..))], x_] ^:=
	Module[{},
		VerifyOrderedCommutators[args];
		SetDelayed[CenterDot[args], x];
		x 
		(* show assignment result, because 
		although SetDelayed is internally used, 
		the assignment is Not really delayed 
		because x gets evaluated in Set even before
		entering the module *)	
	];

SetDelayed[CenterDot[repseq:(repeated_?(Not[QuantumScalarQ[#]] &))..], rhs_] ^:=
Module[{mySetDelayed,p,e},
	VerifyOrderedCommutators[repeated];
	SetAttributes[{mySetDelayed},HoldAll];
	mySetDelayed[Power[p,e],rhs]/.
		{p->repeated, e->Length[{repseq}]}/.
		mySetDelayed->SetDelayed
]; 

SetDelayed[
	CenterDot[args1___,
		repseq:(repeated_?(Not[QuantumScalarQ[#]] &))..,
		args2___], rhs_] ^:=
Module[{mySetDelayed,p,e,a1,a2},
	VerifyOrderedCommutators[args1,repeated,args2];
	SetAttributes[{mySetDelayed},HoldAll];
	mySetDelayed[CenterDot[a1,Power[p,e],a2],rhs]/.
		{p->repeated, e->Length[{repseq}],a1->Sequence[args1],a2->Sequence[args2]}/.
		mySetDelayed->SetDelayed 
] /; And[	Length[{repseq}]>1,
			{args1,args2}=!={},
			FreeQ[{args1},repeated],
			FreeQ[{args2},repeated]];
	
SetDelayed[CenterDot[args:((_?(Not[QuantumScalarQ[#]] &) ..))], x_] ^:=
	Module[{lista, lista2, unpr, unpr2, x1, x2, cond, rev, her, rhs,
		myUpSetDelayed,myCondition,before,after},
		VerifyOrderedCommutators[args];
		lista=Cases[Map[If[Head[#]===Symbol,#,Head[#]]&,List[args]],_Symbol];
		lista2=DeleteCases[lista,Power];
		If[Length[lista2]===0,
			Print["There is no symbol in the left side of the assignment"];
			Message[QuantumScalarQ::error];QuantumDebug["debug3265"];Abort[]];
		
		unpr = Unprotect[Evaluate[lista]];
		If[	Head[x]===Condition,
			x1= (Hold[x] /. Hold[_[a_,b_]]:>Hold[a]);
			x2= (Hold[x] /. Hold[_[a_,b_]]:>Hold[b]);
			SetAttributes[{myUpSetDelayed,myCondition},HoldAll];
			ReleaseHold[myUpSetDelayed[zz075NonCommutativeTimes[after___,rev,before___], 
					myCondition[zz075NonCommutativeTimes[after,rhs,before],cond]] /.
			{rev :> Sequence@@Reverse[{args}], cond->x2, rhs->x1}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed};
			unpr2 = Unprotect[zz080HermitianConjugate];
			ReleaseHold[myUpSetDelayed[zz075NonCommutativeTimes[after___,her,before___], 
					myCondition[zz075NonCommutativeTimes[
									after,zz080HermitianConjugate[rhs],before],cond]] /.
			{her :> Sequence@@Map[zz080HermitianConjugate,{args}], 
				cond->x2, rhs->x1}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed};
			Protect@@unpr2,
			
			ReleaseHold[Hold[
				UpSetDelayed[zz075NonCommutativeTimes[after___,rev,before___], 
					zz075NonCommutativeTimes[after,x,before]]] /.
				{rev :> Sequence@@Reverse[{args}]}];
			unpr2 = Unprotect[zz080HermitianConjugate];
			ReleaseHold[Hold[
				UpSetDelayed[zz075NonCommutativeTimes[after___,her,before___], 
					zz075NonCommutativeTimes[after,zz080HermitianConjugate[x],before]]] /.
				{her :> Sequence@@Map[zz080HermitianConjugate,{args}]}];
			Protect@@unpr2
		];
		Protect@@unpr;
		(* Do Not show assignment result,
		this one is a Delayed assignment 
		because of the HoldAll attribute of SetDelayed  *)
	] /; Length[{args}]===Length[Split[{args}]];

Set[zz050Commutator[ arg1_,
					 arg2_,
					opts:OptionsPattern[]], x_] ^:=
	Module[{},
		VerifyOrderedCommutators[arg1,arg2];
		SetDelayed[zz050Commutator[arg1,arg2,opts], x];
		x 
		(* show assignment result, because 
		although SetDelayed is internally used, 
		the assignment is Not really delayed 
		because x gets evaluated in Set even before
		entering the module *)	
	];
	
SetDelayed[zz050Commutator[ arg1_,
							arg2_,
						opts:OptionsPattern[]], x_] ^:= 
	Module[{lista, unpr, x1, x2, cond, middle, rhs,
		myUpSetDelayed,myCondition,rev},
		VerifyOrderedCommutators[arg1,arg2];
		lista=Cases[Map[If[Head[#]===Symbol,#,Head[#]]&,{arg1,arg2}],_Symbol];
		If[Length[lista]===0,
			Print["There is no symbol in the left side of the assignment"];
			Message[QuantumScalarQ::error];QuantumDebug["debug3319"];Abort[]];
		unpr = Unprotect[Evaluate[lista]];
		If[	Head[x]===Condition,
		
			x1= (Hold[x] /. Hold[_[a_,b_]]:>Hold[a]);
			x2= (Hold[x] /. Hold[_[a_,b_]]:>Hold[b]);
			SetAttributes[{myUpSetDelayed,myCondition},HoldAll];
			ReleaseHold[myUpSetDelayed[zz050Commutator[rev,___], 
					myCondition[rhs,cond]] /.
			{rev :> Sequence[arg2,arg1], cond->x2, rhs->(-x1)}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed};
			ReleaseHold[myUpSetDelayed[zz050Commutator[middle,___], 
					myCondition[rhs,cond]] /.
			{middle->Sequence[arg1,arg2], cond->x2, rhs->x1}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed},
			
			ReleaseHold[Hold[UpSetDelayed[zz050Commutator[rev,___], -x]] /. 
				rev :> Sequence[arg2,arg1]];
			UpSetDelayed[zz050Commutator[arg1,arg2,___], x]
		];
		Protect@@unpr;
		(* Do Not show assignment result,
		this one is a Delayed assignment 
		because of the HoldAll attribute of SetDelayed  *)
	];

Set[zz050AntiCommutator[ arg1_,
						 arg2_,
						opts:OptionsPattern[]], x_] ^:=
	Module[{},
		VerifyOrderedCommutators[arg1,arg2];
		SetDelayed[zz050AntiCommutator[arg1,arg2,opts], x];
		x 
		(* show assignment result, because 
		although SetDelayed is internally used, 
		the assignment is Not really delayed 
		because x gets evaluated in Set even before
		entering the module *)	
	];
	
SetDelayed[zz050AntiCommutator[ arg1_,
								arg2_,
						opts:OptionsPattern[]], x_] ^:= 
	Module[{lista, unpr, x1, x2, cond, middle, rhs,
		myUpSetDelayed,myCondition,rev},
		VerifyOrderedCommutators[arg1,arg2];
		lista=Cases[Map[If[Head[#]===Symbol,#,Head[#]]&,{arg1,arg2}],_Symbol];
		If[Length[lista]===0,
			Print["There is no symbol in the left side of the assignment"];
			Message[QuantumScalarQ::error];QuantumDebug["debug3726"];Abort[]];
		unpr = Unprotect[Evaluate[lista]];
		If[	Head[x]===Condition,
		
			x1= (Hold[x] /. Hold[_[a_,b_]]:>Hold[a]);
			x2= (Hold[x] /. Hold[_[a_,b_]]:>Hold[b]);
			SetAttributes[{myUpSetDelayed,myCondition},HoldAll];
			ReleaseHold[myUpSetDelayed[zz050AntiCommutator[rev,___], 
					myCondition[rhs,cond]] /.
			{rev :> Sequence[arg2,arg1], cond->x2, rhs->(+x1)}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed};
			ReleaseHold[myUpSetDelayed[zz050AntiCommutator[middle,___], 
					myCondition[rhs,cond]] /.
			{middle->Sequence[arg1,arg2], cond->x2, rhs->x1}] /.
			{myCondition->Condition} /. {myUpSetDelayed->UpSetDelayed},
			
			ReleaseHold[Hold[UpSetDelayed[zz050AntiCommutator[rev,___], +x]] /. 
				rev :> Sequence[arg2,arg1]];
			UpSetDelayed[zz050AntiCommutator[arg1,arg2,___], x]
		];
		Protect@@unpr;
		(* Do Not show assignment result,
		this one is a Delayed assignment 
		because of the HoldAll attribute of SetDelayed  *)
	];

Set[zz080Ket[args__], x_] ^:= 
		UpSet[zz080Ket[args], x];
SetDelayed[zz080Ket[args__], x_] ^:= 
		UpSetDelayed[zz080Ket[args], x];

Set[Subscript[zz080Ket[ketargs__], subs__],x_] ^:= 
	(Unprotect[zz050Subscript];
	UpSet[zz080Ket[zz050Subscript[{ketargs}, {subs}]],x];
	Protect[zz050Subscript];
	x);
SetDelayed[Subscript[zz080Ket[ketargs__], subs__],x_] ^:= 
	(Unprotect[zz050Subscript];
	UpSetDelayed[zz080Ket[zz050Subscript[{ketargs}, {subs}]],x];
	Protect[zz050Subscript];);
		
Set[zz080HermitianConjugate[arg_?(Not[QuantumScalarQ[#]]&)], x_] ^:= 
		UpSet[zz080HermitianConjugate[arg], x];
SetDelayed[zz080HermitianConjugate[arg_?(Not[QuantumScalarQ[#]]&)], x_] ^:= 
		UpSetDelayed[zz080HermitianConjugate[arg], x];

QuantumReplace[exp_,listoflists:{{___}..}]:=
	Map[QuantumReplace[exp,#]&,listoflists];

QuantumReplace[exp_,rules:{(_Rule | _RuleDelayed) ..}]:=
	Fold[QuantumReplace,exp,rules];

QuantumReplace[exp_,rule:(_Rule | _RuleDelayed)]:=
With[{
		modrulesk={rule} /.
			{HoldPattern[Rule[a_, b_]] :> 
						zz080regla[a /. zz080Ket[k___]:>zz080Ket[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Ket[k,zz080freeze]],
			HoldPattern[RuleDelayed[a_, b_]] :> 
						zz080reglaretrasada[a /. zz080Ket[k___]:>zz080Ket[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Ket[k,zz080freeze]]}/.
			{ zz080regla->Rule, zz080reglaretrasada->RuleDelayed},
		modrulesb={rule} /.
			{HoldPattern[Rule[a_, b_]] :> 
						zz080regla[a /. zz080Ket[k___]:>zz080Bra[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Bra[k,zz080freeze]],
			HoldPattern[RuleDelayed[a_, b_]] :> 
						zz080reglaretrasada[a /. zz080Ket[k___]:>zz080Bra[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Bra[k,zz080freeze]]}/.
			{ zz080regla->Rule, zz080reglaretrasada->RuleDelayed}
	},
	ReplaceAll[exp ,Join[modrulesk,modrulesb]]
]; 

(* The end-user can create new operators *)
DefineOperatorOnKets[op_, rules:{(_Rule | _RuleDelayed) ..}] :=
With[{modrules = rules /.
		{HoldPattern[Rule[a_, b_]] :> 
						zz080regla[a /. zz080Ket[k___]:>zz080Ket[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Ket[k,zz080freeze]],
		HoldPattern[RuleDelayed[a_, b_]] :> 
						zz080reglaretrasada[a /. zz080Ket[k___]:>zz080Ket[k,zz080freeze___], 
							b /. zz080Ket[k___]:>zz080Ket[k,zz080freeze]]} /.
		{ zz080regla->Rule, zz080reglaretrasada->RuleDelayed}/.
    	{HoldPattern[Rule[a_, b_]] :> Rule[a, zz080mod[b]],
     	HoldPattern[RuleDelayed[a_, b_]] :> RuleDelayed[a, zz080mod[b]]} 
	},
 Module[{werep,objeto},

  SetQuantumObject[op];

  (* Starts defintions for new operator acting on ket *) 
  objeto=Which[
  	Head[op] === Symbol,op,
  	Head[Head[op]]===Symbol,Head[op],
  	True,zz075NonCommutativeTimes
  ];
  werep = Unprotect[Evaluate[objeto]];
  With[{obj=objeto}, 
  	obj /: zz075NonCommutativeTimes[r___, anyket_zz080Ket, op, l___] :=
  		With[{newket = ReplaceAll[anyket, modrules]},
  			Module[{val},
				val=zz075NonCommutativeTimes[r, (newket/.zz080mod[z___]->z), l];
				val] /; newket =!= anyket]
  ];
  Protect@@werep; (* protect the object that has the definitions *)
  (* Ends defintions for new operator acting on ket *) 
  
  werep = Unprotect[zz075NonCommutativeTimes]; 
  (* Starts defintions for positive integer powers of the new operator*)
  zz075NonCommutativeTimes[r___, anyket_zz080Ket, 
  	Power[op,n_?(IntegerQ[#]&&(#>1) &)], l___] :=
  		With[{newket = ReplaceAll[anyket, modrules]},
  			Module[{val},
				val=zz075NonCommutativeTimes[r, 
						Nest[zz075NonCommutativeTimes[#,op]&,
							(newket/.zz080mod[z___]->z),n-1], 
						l];
				val] /; newket =!= anyket];
  (* Ends defintions for positive integer powers of the new operator*)

  (* Starts defintions for hermitian conjugate of new operator (on bras)*)
  zz075NonCommutativeTimes[r___, zz080HermitianConjugate[op], anybra_zz080Bra, l___] :=
  		With[{newbra = zz080HermitianConjugate[
							ReplaceAll[zz080HermitianConjugate[anybra], modrules]]},
				Module[{val},
					val=zz075NonCommutativeTimes[r, (newbra/.zz080mod[z___]->z), l];
					val] /; newbra =!= anybra];
  (* Ends defintions for hermitian conjugate of new operator (on bras)*)

  (* Starts defintions for positive integer powers of hermitian conjugate new operator*)
  zz075NonCommutativeTimes[r___, 
  	Power[zz080HermitianConjugate[op],n_?(IntegerQ[#]&&(#>1) &)], 
  	anybra_zz080Bra, l___] :=
  		With[{newbra = zz080HermitianConjugate[
							ReplaceAll[zz080HermitianConjugate[anybra], modrules]]},
				Module[{val},
					val=zz075NonCommutativeTimes[r,
							Nest[zz075NonCommutativeTimes[zz080HermitianConjugate[op],#]&,
								(newbra/.zz080mod[z___]->z),n-1], 
							l];
					val] /; newbra =!= anybra];
  (* Ends defintions for positive integer powers of hermitian conjugate new operator*)

(* Special definitions for operators that have the structure Power[base,exponent],
for example j^2, s^2. etc.*)
  If[Head[op]===Power,
  		With[{base=op[[1]],exponent=op[[2]]},
  			SetQuantumObject[base];
  (* Starts defintions for powers of the new operator that are multiples of the exponent *)
			zz075NonCommutativeTimes[r___, anyket_zz080Ket, 
  				Power[base,n_?((IntegerQ[#])&&(#>=exponent) &)], l___] :=
  					With[{newket = ReplaceAll[anyket, modrules]},
  						Module[{val},
							val=zz075NonCommutativeTimes[r, 
									Nest[zz075NonCommutativeTimes[#,op]&,
										(newket/.zz080mod[z___]->z),
										Quotient[n, exponent]-1], 
									Power[base,Mod[n,exponent]],
									l];
							val] /; newket =!= anyket];
  (* Ends defintions for powers of the new operator that are multiples of the exponent *)
  (* Starts definitions for powers of hermitian conjugate of the new operator 
  that are multiples of the exponent. HERE IT MUST BE #>=exponent *)
			zz075NonCommutativeTimes[r___, 
  				Power[	zz080HermitianConjugate[base],
  						n_?((IntegerQ[#])&&(#>=exponent) &)], 
  				anybra_zz080Bra, l___] :=
  					With[{newbra = zz080HermitianConjugate[
							ReplaceAll[zz080HermitianConjugate[anybra], modrules]]},
						Module[{val},
							val=zz075NonCommutativeTimes[r,
									Power[base,Mod[n,exponent]],
									Nest[zz075NonCommutativeTimes[
											zz080HermitianConjugate[op],#]&,
										(newbra/.zz080mod[z___]->z),
										Quotient[n, exponent]-1], 
									l];
							val] /; newbra =!= anybra];
  (* Ends definitions for powers of hermitian conjugate of the new operator 
  that are multiples of the exponent *)
  		]
  	];

  Protect@@werep; (*protect zz075NonCommutativeTimes*)

  Column[ReplaceAll[rules, 
    HoldPattern[Rule[a_, b_]] :> (Defer[op\[CenterDot]a] -> op\[CenterDot]a)] ]
]];

(* Transforming from Dirac Notation to matrix notation *)
(* It includes (modified) code by Francisco Delgado *)

newIntegerDigits[n_Integer, dimen_List] :=
  Module[{iterador, iterando, nu, ta1, i, j},
   iterador = 
    Sequence @@ Table[{i[j], 0, dimen[[j]] - 1}, {j, Length[dimen]}];
   iterando = nu @@ Table[i[j], {j, Length[dimen]}];
   ta1 = Flatten[Table[Evaluate[iterando], Evaluate[iterador]]];
   List @@ ta1[[Abs[Mod[n, Times @@ dimen]] + 1]]
   ];

TensorToDirac[tensor_?ArrayQ,rules:{(_Rule | _RuleDelayed) ..}] :=
	Module[{},
		TensorToDirac[tensor] /. rules
	];

TensorToDirac[tensor_?ArrayQ] :=
Module[{dimt,same},
	dimt=same@@@Partition[Dimensions[tensor], 2];
	dimt=(dimt /. {same[x_,x_]:>x, same[x_,1]:>x});
	MatrixToDirac[
			If[TrueQ[$VersionNumber>=6],
				FixedPoint[ArrayFlatten,tensor],
				tensor], 
			dimt]
];

MatrixToDirac[matriz_?MatrixQ, dime_List, rules:{(_Rule | _RuleDelayed) ..}] :=
	Module[{},
		MatrixToDirac[matriz, dime] /. rules
	];

MatrixToDirac[vec_?VectorQ, args___]:=
Module[{},
	Message[MatrixToDirac::vect];
	VectorToDirac[vec,args]
];

TensorToDirac[vec_?VectorQ, args___]:=
Module[{},
	Message[TensorToDirac::vect];
	VectorToDirac[vec,args]
];

VectorToDirac[vec_?VectorQ, dime_List]:=
	MatrixToDirac[Map[List,vec], dime];

MatrixToDirac[matriz_?MatrixQ, dime_List] :=
  Module[{qbitbinary, rango, i, j, ket, bra},
   qbitbinary[x_, lb_] := 
   	(zz075NonCommutativeTimes @@ Table[
      zz080Ket[
       zz080Eigenstate[zz080Operator[lb[[j]]], 
        newIntegerDigits[x, dime][[j]]]], {j, 1, Length[lb]}]);
   rango = Range[Length[dime]];
	If[Dimensions[matriz][[2]]===1,
		Plus @@ Flatten[Table[
			ket = qbitbinary[i - 1, rango];
			matriz[[i, 1]] * ket,
			{i, 1, Length[matriz]}]],
		Plus @@ Flatten[Table[
			ket = qbitbinary[i - 1, rango];
			bra = zz080HermitianConjugate[qbitbinary[j - 1, rango]];
(* operands order is reversed in zz075NonCommutativeTimes *)
			matriz[[i, j]] * zz075NonCommutativeTimes[bra,ket],
			{i, 1, Length[matriz]}, {j, 1, Length[matriz]}]]
	]
   ];


DiracToTensor[graph:((Graphics|Graphics3D)[___]), args___]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	DiracToTensor[Part[qinfo,1], args] /;
	Length[qinfo]===1
];

DiracEigensystem[graph:((Graphics|Graphics3D)[___]), args___]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	DiracEigensystem[Part[qinfo,1], args] /;
	Length[qinfo]===1
];

DiracEigenvalues[graph:((Graphics|Graphics3D)[___]), args___]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	DiracEigenvalues[Part[qinfo,1], args] /;
	Length[qinfo]===1
];

DiracEigenvectors[graph:((Graphics|Graphics3D)[___]), args___]:=
With[{qinfo=Cases[graph, Tooltip[g_List, e_] :> e, Infinity]}, 
	DiracEigenvectors[Part[qinfo,1], args] /;
	Length[qinfo]===1
];

DiracToMatrix[arg1_,rest__] := 
	NestWhile[ArrayFlatten, DiracToTensor[arg1,rest], And[ArrayQ[#],Not[MatrixQ[#]]]&];

DiracToVector[ket_?KetQ,rest__]:=
	Flatten[DiracToMatrix[ket,rest]];

DiracToMatrix[n_?NumericQ,rest__]:=n;
DiracToTensor[n_?NumericQ,rest__]:=n;

DiracEigenvalues[args__]:=DiracEigensystem[args][[1]];

DiracEigenvectors[args__]:=DiracEigensystem[args][[2]];

DiracEigensystem[diracope_, 
		sp:{{zz080Eigenstate[zz080Operator[_],_]..}..},
		n_:0,
		opts:OptionsPattern[]]:=
Module[{matope,dim,myfun,reglas,values,vectors,diracvectors,nval},
	matope=DiracToMatrix[diracope,sp];
	If[TrueQ[Abs[n]>Length[matope]],nval=Length[matope],nval=n];
	dim=Map[Length,sp];
	myfun=Function[{lista,pos},MapIndexed[
		zz080Eigenstate[zz080Operator[pos[[1]]], (#2[[1]]-1)]->#1&,lista]];
	reglas=Flatten[MapIndexed[myfun,sp]];
	{values,vectors}=
		If[TrueQ[nval==0],
			Eigensystem[matope,opts],
			Eigensystem[matope,nval,opts]
		];
	If[Not[FreeQ[{values,vectors},Root]],
		{values,vectors}=N[{values,vectors}]];
	diracvectors=
		(Map[Collect[VectorToDirac[Normalize[#],dim],zz080Ket[__],
				Function[{coef},expandeNumerosComplejos[Simplify[coef]]]]&,
						vectors]/.reglas);
	expandeNumerosComplejos[{Simplify[values],diracvectors}]
];

(* New DiracToTensor syntax: *)
DiracToTensor[dirac_, sp:{{zz080Eigenstate[zz080Operator[_],_]..}..}]:=
Module[{correctFormat, rulef, diracmod, ope, iterando, iterador, i, j, dimen, d,
		rulefi, matrix, ineqf, assump, mat, op},
	correctFormat[list_]:=(Length[Union[Cases[list,zz080Operator[_],Infinity]]]===1);
	If[Apply[And,Map[correctFormat,sp]],
				rulef[zz080Eigenstate[zz080Operator[y_], x_], {oppos_, evpos_}] := 
					zz080Eigenstate[zz080Operator[y], x] -> 
						zz080Eigenstate[zz080Operator[ope[oppos]], evpos - 1];
				diracmod = dirac /.  Flatten[MapIndexed[rulef[#1, #2] &, sp, {2}]];
				
				If[TrueQ[diracmod===dirac],
					SetQuantumObject[op],
					op=diracmod	];
	
				dimen=Map[Length,sp];
				
				iterador = Table[{{i[d], 0, dimen[[d]] - 1},{j[d], 0, dimen[[d]] - 1}}, 
								{d, Length[dimen]}];
				iterador = Flatten[iterador,1];
				iterador = Sequence @@ iterador;
				
				iterando = zz075NonCommutativeTimes[
   				zz075NonCommutativeTimes @@ Table[
   					zz080Ket[zz080Eigenstate[zz080Operator[ope[d]], j[d]]], 
   					{d, Length[dimen]}],
   				op,
   				zz075NonCommutativeTimes @@ Table[
   					zz080Bra[zz080Eigenstate[zz080Operator[ope[d]], i[d]]], 
   					{d, Length[dimen]}]
   				];
				
				matrix=Table[Evaluate[iterando], Evaluate[iterador]];
				
				rulefi[zz080Eigenstate[zz080Operator[y_], x_], {oppos_, evpos_}] := 
					zz080Eigenstate[zz080Operator[ope[oppos]], evpos - 1] -> 
						zz080Eigenstate[zz080Operator[y], x];
				mat=(matrix /.  Flatten[MapIndexed[rulefi[#1, #2] &, sp, {2}]]);
				mat=(mat /. HoldPattern[op]->dirac);
				ineqf[evlist_]:=
					Module[{ss},
						ss=Subsets[evlist,{2}];
						ss=(ss /. zz080Eigenstate[zz080Operator[y_], x_]:>x);
						Unequal@@@ss
					];
				assump=Simplify[Apply[And,Flatten[Map[ineqf,sp]]]];
				Simplify[mat,assump],

				(*  WRONG FORMAT  *)
				QuantumDebug["debug DiracToTensor wrong list format"];
				Message[DiracToTensor::wrongformat];
				Abort[]
	]
];
(* KET TO TENSOR *)
DiracToTensor[dirac_?KetQ, sp:{{zz080Eigenstate[zz080Operator[_],_]..}..}]:=
Module[{correctFormat, rulef, diracmod, ope, iterando, iterador, i, j, dimen, d,
		rulefi, matrix, ineqf, assump, mat, op},
	correctFormat[list_]:=(Length[Union[Cases[list,zz080Operator[_],Infinity]]]===1);
	If[Apply[And,Map[correctFormat,sp]],
				rulef[zz080Eigenstate[zz080Operator[y_], x_], {oppos_, evpos_}] := 
					zz080Eigenstate[zz080Operator[y], x] -> 
						zz080Eigenstate[zz080Operator[ope[oppos]], evpos - 1];
				diracmod = dirac /.  Flatten[MapIndexed[rulef[#1, #2] &, sp, {2}]];
				
				If[TrueQ[diracmod===dirac],
					SetQuantumObject[op],
					op=diracmod	];
	
				dimen=Map[Length,sp];
				(* The {j[d], 0, 0} is necessary to give the correct tensor structure *)
				iterador = Table[{{i[d], 0, dimen[[d]] - 1},{j[d], 0, 0}}, 
								{d, Length[dimen]}];
				iterador = Flatten[iterador,1];
				iterador = Sequence @@ iterador;
				
				iterando = zz075NonCommutativeTimes[
   				op,
   				zz075NonCommutativeTimes @@ Table[
   					zz080Bra[zz080Eigenstate[zz080Operator[ope[d]], i[d]]], 
   					{d, Length[dimen]}]
   				];
				
				matrix=Table[Evaluate[iterando], Evaluate[iterador]];
				
				rulefi[zz080Eigenstate[zz080Operator[y_], x_], {oppos_, evpos_}] := 
					zz080Eigenstate[zz080Operator[ope[oppos]], evpos - 1] -> 
						zz080Eigenstate[zz080Operator[y], x];
				mat=(matrix /.  Flatten[MapIndexed[rulefi[#1, #2] &, sp, {2}]]);
				mat=(mat /. HoldPattern[op]->dirac);
				ineqf[evlist_]:=
					Module[{ss},
						ss=Subsets[evlist,{2}];
						ss=(ss /. zz080Eigenstate[zz080Operator[y_], x_]:>x);
						Unequal@@@ss
					];
				assump=Simplify[Apply[And,Flatten[Map[ineqf,sp]]]];
				Simplify[mat,assump],

				(*  WRONG FORMAT  *)
				QuantumDebug["debug DiracToTensor wrong list format"];
				Message[DiracToTensor::wrongformat];
				Abort[]
	]
];

(* Obsolete DiracToTensor syntax. It has some bugs, but I leave it here because
Francisco Delgado (and maybe other users) has code that sucesfully uses
this obsolete syntax *)
DiracToTensor[dirac_, dimen_List,rules:{(_Rule | _RuleDelayed) ..}] :=
	Module[{dt},
	    (* rules are replaced two times, first for "normal" dirac operators
	    expressions, to make more efficient the calculation,
	    second for operators from DefineOperators, for which it is
	    necessay to build all the symbolic Tensor before doing the replacement*)
		dt=DiracToTensor[dirac /. rules, dimen];
        dt /. rules
	];

(* Obsolete DiracToTensor syntax. It has some bugs, but I leave it here because
Francisco Delgado (and maybe other users) has code that sucesfully uses
this obsolete syntax *)
DiracToTensor[dirac_, dimen:{_Integer..}] :=
  Module[{iterador, d, i, j, iterando, uni, opef, x, y, sp, rulef, diracmod},
	Message[DiracToTensor::obsolete];
	 Print["The syntax for DiracToTensor that you are using is OBSOLETE and "<>
		"it uses old programs that have some bugs. Please use the new "<>
		"syntax of DiracToTensor"];

	uni = Union[
   		Cases[dirac, zz080Eigenstate[zz080Operator[y_], x_], Infinity]];
   	opef[zz080Eigenstate[zz080Operator[y_], x_]] := y;
   	sp = Split[uni, opef[#1] === opef[#2] &];

   	rulef[zz080Eigenstate[zz080Operator[y_], x_], {op_, ev_}] := 
  		zz080Eigenstate[zz080Operator[y], x] -> zz080Eigenstate[zz080Operator[op], ev - 1];
   	diracmod = dirac /.  Flatten[MapIndexed[rulef[#1, #2] &, sp, {2}]];
	
   iterador = Table[{{i[d], 0, dimen[[d]] - 1},{j[d], 0, dimen[[d]] - 1}}, 
    					{d, Length[dimen]}];
   iterador = Flatten[iterador,1];
   iterador = Sequence @@ iterador; 

   iterando = zz075NonCommutativeTimes[
   				zz075NonCommutativeTimes @@ Table[
   					zz080Ket[zz080Eigenstate[zz080Operator[d], j[d]]], 
   					{d, Length[dimen]}],
   				diracmod,
   				zz075NonCommutativeTimes @@ Table[
   					zz080Bra[zz080Eigenstate[zz080Operator[d], i[d]]], 
   					{d, Length[dimen]}]
   				];

   Table[Evaluate[iterando], Evaluate[iterador]]
   ];

(* Make Simplify and FullSimplify use (try) quantum commands *)
SetOptions[Simplify,
	TransformationFunctions->
		{Automatic,
		QuantumEvaluate,
		CollectFromLeft,
		CollectFromRight,
		Expand[EvaluateAllCommutators[#]]&,
		CommutatorExpand[EvaluateAllCommutators[#], Anticommutators->False]&,
		CommutatorExpand[EvaluateAllCommutators[#], ReverseOrdering->True]&,
		CommutatorExpand[EvaluateAllCommutators[#], NestedCommutators->True]&,
		CommutatorExpand[EvaluateAllCommutators[#], Anticommutators->True]&
		 }];
SetOptions[FullSimplify,
	TransformationFunctions->
		{Automatic,
(*N is necessaty as a TransformationFunction for Simplify
to avoid odd "conditions on kets" like 1.|0> == 1.|1> 
that can be generated when mixing exact and approximate numbers,
like in the simplification of equations that include in one
side the numerical version of QFT and in the other side
the exact version of QFT, applied both to bell states
(to generate 1.|0> == 1.|1> makes sense to Simplify 
since |0> and |1> are seen as
variables that could have any value, as complex numbers)
(should I add rules for Equal, so that 1.|0> == 1.|1> evaluates to False?
maybe that does not solve the problem, maybe it just makes Simplify
answer False instead of 1.|0> == 1.|1>, I do not know)
 *)
		N, 
		QuantumEvaluate,
		CollectFromLeft,
		CollectFromRight,
		Expand[EvaluateAllCommutators[#]]&,
		CommutatorExpand[EvaluateAllCommutators[#], Anticommutators->False]&,
		CommutatorExpand[EvaluateAllCommutators[#], ReverseOrdering->True]&,
		CommutatorExpand[EvaluateAllCommutators[#], NestedCommutators->True]&,
		CommutatorExpand[EvaluateAllCommutators[#], Anticommutators->True]&
		 }];

(*Finishing the package: protect the commands and definitions created in the package*)
SetAttributes[
    {\[Dagger],\[ScriptCapitalB],\[ScriptK]\[ScriptE]\[ScriptT],\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR],FactorKet,FactorKetList,CollectKet,
	QuantumEvaluate,
    zz050Subscript,
    zz075NonCommutativeTimes,SetQuantumObject,SetQuantumScalar,SetQuantumFunction,
	QuantumTr, QuantumPartialTranspose,QuantumPartialTrace,
	QuantumNorm,QuantumNormalize,SetQuantumAliases,
	SetNotationAliases,
	zz080Bra,zz080BraArgs,zz080BraKet,zz080Eigenstate,
	zz080HermitianConjugate,zz080Ket,zz080KetArgs,
	zz050Commutator,zz050AntiCommutator,
	zz075NonCommutativeTimes,zz080Operator,
	QuantumToGraphics,DefineOperatorOnKets,QuantumReplace,
	QuantumDensityOperator,
	QuantumMeasurement,QuantumMeasurementResults,
	MatrixToDirac,TensorToDirac,DiracToTensor,DiracToMatrix,
	VectorToDirac,DiracToVector,
	DiracEigensystem,DiracEigenvalues,DiracEigenvectors,
	CommutatorExpand,EvaluateCommutators,EvaluateAllCommutators,
	CollectFromLeft,CollectFromRight,
	QuantumProduct,QuantumSum,VerifyOrderedCommutators,
	Anticommutators,NestedCommutators,ReverseOrdering,
	CenterDot,CircleTimes,SuperStar,SuperDagger,OverHat,DoubleBracketingBar,
	Subscript,
	zz080mod,zz080freeze,
	KetQ,QuantumScalarQ
    },
    ReadProtected
];

Protect[
	\[Dagger],\[ScriptCapitalB],\[ScriptK]\[ScriptE]\[ScriptT],\[ScriptS]\[ScriptC]\[ScriptA]\[ScriptL]\[ScriptA]\[ScriptR],FactorKet,FactorKetList,CollectKet,
	QuantumEvaluate,
	zz050Subscript,
	QuantumTr, QuantumPartialTranspose,QuantumPartialTrace,
	QuantumNorm,QuantumNormalize,SetQuantumAliases,
	SetNotationAliases,
	SetQuantumObject,SetQuantumFunction,
	zz080Bra,zz080BraArgs,zz080BraKet,zz080Eigenstate,
	zz080HermitianConjugate,zz080Ket,zz080KetArgs,
	zz050Commutator,zz050AntiCommutator,
	zz075NonCommutativeTimes,zz080Operator,
	QuantumToGraphics,DefineOperatorOnKets,QuantumReplace,
	QuantumDensityOperator,
	QuantumMeasurement,QuantumMeasurementResults,
	MatrixToDirac,TensorToDirac,DiracToTensor,DiracToMatrix,
	VectorToDirac,DiracToVector,
	DiracEigensystem,DiracEigenvalues,DiracEigenvectors,
	CommutatorExpand,EvaluateCommutators,EvaluateAllCommutators,
	CollectFromLeft,CollectFromRight,
	QuantumProduct,QuantumSum,VerifyOrderedCommutators,
	Anticommutators,NestedCommutators,ReverseOrdering,
	CenterDot,CircleTimes,SuperStar,SuperDagger,OverHat,DoubleBracketingBar,
	RowBox,Conjugate,
	zz080mod,zz080freeze,
	KetQ, QuantumScalarQ
];

(*  In version 5.2 supress the violet color of 
	the angle brackets which gives the impression that
	there is a mistake in the ket (or bra). In version 6.0 this
	does not work, but it is not so important since in
	version 6.0 the vertical line also has the same color
	as the angle bracket, which gives the impression of
	a formating color for the ket (bra), rather than a mistake*)
If[$VersionNumber<6.0,SetOptions[InputNotebook[], 
					AutoStyleOptions -> {"UnmatchedBracketStyle" -> None}]];

(* If AutoLoadPalette is undefined, it defaults to True*)
If[ Not[ ValueQ[AutoLoadPalette] ],AutoLoadPalette=True ];

(* Open palette *)
If[AutoLoadPalette,
   If[$VersionNumber>=6.0,
	NotebookOpen["QuantumAlgebra.nb"];
	NotebookOpen["QuantumTests.nb"];
	NotebookOpen["QuantumToMatrix.nb"];
	NotebookOpen["QuantumNotation.nb"]
     ]
];

End[]

EndPackage[]

$RecursionLimit=100*$RecursionLimit;
$IterationLimit=100*$IterationLimit;

Column[{
"Quantum`Notation` \n"<>
"A Mathematica package for Quantum calculations in Dirac bra-ket notation\n"<>
"by Jos\[EAcute] Luis G\[OAcute]mez-Mu\[NTilde]oz\n"<>
"\nThis add-on does NOT work properly with the debugger turned on."<>
" Therefore the debugger must NOT be checked in the Evaluation menu of"<>
" Mathematica.\n"<>         
"Execute SetQuantumAliases[] in order"<>
" to use the keyboard to enter quantum objects"<>
" in Dirac's notation\n"<>
"SetQuantumAliases[] must be executed again in"<>
" each new notebook that is created, only one time per notebook.",
"\nMATHEMATICA "<>$Version,
"\nQUANTUM version EN CONSTRUCCION",
"\nTODAY IS "<>DateString[]
}]  

  
     
     
     
     
    
