; !(register-module! ../../../metta)
;; Import modules
!(import! &self ../../../metta/pln/dependent-types/GeneralizationDTLhelper)
!(import! &self ../../../metta/pln/dependent-types/GeneralizationDTL)
!(import! &self ../../../metta/common/truthvalue/MeasEq)
; !(import! &self metta:common:formula:DeductionFormula)
!(import! &self ../../../metta/common/truthvalue/TruthValue)
; !(import! &self ../../../metta/common/Num)
!(import! &self ../../../metta/synthesis/Synthesize)
!(import! &self ../../../metta/common/Record)
; !(import! &self metta:pln:dependent-types:helper)

(: Predicate Type)
(: → (-> Predicate %Undefined% Expression Type))
(: water Predicate)
(: land Predicate)
(: medium Predicate)
(: surface Predicate)

; (= (lcg-rule)
;    (: LCG ;; Least Common Generalization
;       (-> (≞ $c1 $c1tv)
;           (≞ $c2 $c2tv)
;           (≞ $lcg $lcgtv)
;           (≞ (→ $c1 $lcg ()) $c1lcgtv)
;           (≞ (→ $c2 $lcg ()) $c2lcgtv) 
;           (≞ (→ $c1 $c2 ($lcg)) (lcg-formula $c1tv $c2tv $lcgtv $c1lcgtv $c2lcgtv)))))

(: kb (-> Atom))
(= (kb) (superpose(
        (: waterm (≞ water (STV 0.9 0.86)))
        (: landm (≞ land (STV 0.88 0.84)))
        (: surfacem (≞ surface (STV 0.9 0.86)))
        (: landsurfacem (≞ (→ land surface ()) (STV 0.88 0.84)))
        (: mediumm (≞ medium (STV 0.9 0.86)))
        (: watermediumm (≞ (→ water medium ()) (STV 0.9 0.86)))
        (: surfacemediumm (≞ (→ surface medium ()) (STV 0.9 0.86)))
)))

(: rb (-> Atom))
(= (rb) (double-depth-lcg-rule))


!(synthesize (: $proof (≞ (→ water land ($lcg)) $tv)) kb rb (S Z))
