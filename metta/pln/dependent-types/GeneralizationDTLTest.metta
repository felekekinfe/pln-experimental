!(register-module! ../../../metta)
;; Import modules
!(import! &self metta:pln:dependent-types:GeneralizationDTL)
; !(import! &self metta:pln:dependent-types:GeneralizationKB)
!(import! &self metta:common:truthvalue:MeasEq)
; !(import! &self metta:common:formula:DeductionFormula)
!(import! &self metta:common:truthvalue:TruthValue)
!(import! &self metta:common:Num)
!(import! &self metta:synthesis:Synthesize)
!(import! &self metta:common:Record)

(: Predicate Type)
(: → (-> Predicate Predicate Expression Type))
(: water Predicate)
(: land Predicate)
(: medium Predicate)

(: kb (-> Atom))
(= (kb) (superpose(
        (: waterm (≞ water (STV 0.9 0.86)))
        (: landm (≞ land (STV 0.88 0.84)))
        (: mediumm (≞ medium (STV 0.9 0.86)))
        (: watermediumm (≞ (→ water medium ()) (STV 0.9 0.86)))
        (: landmediumm (≞ (→ land medium ()) (STV 0.9 0.86)))
)))

(: rb (-> Atom))
(= (rb) (lcg-rule))


!(synthesize (: $proof (≞ (→ water land (medium)) $tv)) kb rb (S Z)) 