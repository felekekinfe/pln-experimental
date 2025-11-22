;; MeTTa port for deduction PLN rule
;; as DTL (Dependent Type Language)
;;
;; (≞ P ptv)
;; (≞ Q qtv)
;; (≞ R rtv)
;; (≞ (→ P Q) tv1)
;; (≞ (→ Q R) tv2)
;; ⊢
;; (≞ (→ P R) TV)
;;
;; where ptv, qtv, rtv, tv1 and tv2 are truth values of the
;; premises P, Q, R, (→ P Q) and (→ Q R) respectively.
;; TV represents the resulting truth value of the conclusion.

;; Import modules
; !(register-module! ../../../metta)
; !(import! &self metta:common:truthvalue:MeasEq)
; !(import! &self metta:common:formula:DeductionFormula)
; !(import! &self metta:common:truthvalue:TruthValue)
; !(import! &self metta:common:Num)

;; Define deduction rule
(: deduction-rule (-> Atom))
(= (deduction-rule)
   (: Deduction
      (-> (≞ $q $qtv)
          (≞ $p $ptv)
          (≞ $r $rtv)
          (≞ (→ $q $p ()) $qptv)
          (≞ (→ $p $r ()) $prtv)
          (≞ (→ $q $r ($p)) (deduction-formula $qtv $ptv $rtv $qptv $prtv)))))

; !(deduction-rule)