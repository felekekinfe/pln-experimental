;; Import modules
; !(import! &self metta:common:Num)
;; !(import! &self metta:synthesis:Unify)

;; Enumerate all programs up to a given depth that are consistent with
;; the query, using the given axiom non-deterministic functions and rules.
;;
;; The arguments are:
;;
;; $query: an Atom under the form (: TERM TYPE).  The atom may contain
;;         free variables within TERM and TYPE to form various sort of
;;         queries, such as:
;;         1. Backward chaining: (: $term (Inheritance $x Mammal))
;;         2. Forward chaining: (: ($rule $premise AXIOM) $type)
;;         3. Mixed chaining: (: ($rule $premise AXIOM) (Inheritance $x Mammal))
;;         4. Type checking: (: TERM TYPE)
;;         5. Type inference: (: TERM $type)
;;
;; $kb: a nullary function to axiom, to non-deterministically pick up
;;      an axiom.  An axiom is an Atom of the form (: TERM TYPE).
;;
;; $rb: a nullary function to rule, to non-deterministically pick up a
;;      rule.  A rule is a function mapping premises to conclusion,
;;      where premises and conclusion have the form (: TERM TYPE).
;;
;; $depth: a Nat representing the maximum depth of the generated
;;         programs.
;;
;; TODO: recurse over curried rules instead of duplicating code over
;; tuples.
; (: synthesize (-> $a (-> $kt) (-> $rt) Nat $a))
;; Nullary rule (axiom)
(= (synthesize $query $kb $rb $depth)
   (let*
     (
               ($_ (println! ("In Nullary Rule")))
               ($query ($kb))
               ($_ (println! (Nullary $query)))
     )
     $query
    )
)

;; Unary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise $conclusion)) ($rb))
          ((: ($ructor $proof) $conclusion) $query)
          ((: $proof $premise) (synthesize (: $proof $premise) $kb $rb $k))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))
;; Binary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise1 $premise2 $conclusion)) ($rb))
          ((: ($ructor $proof1 $proof2) $conclusion) $query)
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))
;; Trinary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise1 $premise2 $premise3 $conclusion)) ($rb))
          ((: ($ructor $proof1 $proof2 $proof3) $conclusion) $query)
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))
;; Quaternary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $conclusion)) ($rb))
          ((: ($ructor $proof1 $proof2 $proof3 $proof4) $conclusion) $query)
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))
;; Quintenary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (($_ (println! ("In Quintenary synthesizer")))
          ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $conclusion)) ($rb))
          ($_ (println! (premises ($premise1 premise2 $premise2 $premise3 $premise4 $premise5) conclusions ($conclusion))))
          ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5) $conclusion) $query)
          ($_ (println! (Query distructed : ($ructor $proof1 $proof2 $proof3 $proof4 $proof5) $conclusion)))
          ; (() (println! (In quintenary rule synthesizer)))
          ($_ (println! (: $proof1 $premise1)))
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))        ;  (≞ $q#1675 (STV $Qs#1993 $Qc#1994))
          ($_ (println! (PP1 : $proof1 $premise1)))
          ($_ (println! (: $proof2 $premise2)))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ($_ (println! (PP2 : $proof2 $premise2)))
          ($_ (println! (: $proof3 $premise3)))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))    
          ($_ (println! (PP3 : $proof3 $premise3)))
          ($_ (println! (: $proof4 $premise4)))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ($_ (println! (PP4 : $proof4 $premise4)))
          ($_ (println! (: $proof5 $premise5)))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ($_ (println! (PP5 : $proof5 $premise5)))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
   ))

; Quaternary rule
(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $conclusion)) ($rb))
          ($_ (println! (premises ($premise1 premise2 $premise2 $premise3 $premise4 $premise5 $premise6) conclusions ($conclusion))))
          ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6) $conclusion) $query)
          ($_ (println! (Query distructed : ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6) $conclusion)))
          ($_ (println! (: $proof1 $premise1)))
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ($_ (println! (PP1 : $proof1 $premise1)))
          ($_ (println! (: $proof2 $premise2)))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ($_ (println! (PP2 : $proof2 $premise2)))
          ($_ (println! (: $proof3 $premise3)))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ($_ (println! (PP3 : $proof3 $premise3)))
          ($_ (println! (: $proof4 $premise4)))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ($_ (println! (PP4 : $proof4 $premise4)))
          ($_ (println! (: $proof5 $premise5)))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ($_ (println! (PP5 : $proof5 $premise5)))
          ($_ (println! (: $proof6 $premise6)))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
          ($_ (println! (PP6 : $proof6 $premise6)))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))

(= (synthesize $query $kb $rb (S $k))
   (let* (((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $premise7 $conclusion)) ($rb))
          ($_ (println! (premises ($premise1 premise2 $premise2 $premise3 $premise4 $premise5 $premise6 $premise7) conclusions ($conclusion))))
          ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6 $proof7) $conclusion) $query)
          ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
          ((: $proof7 $premise7) (synthesize (: $proof7 $premise7) $kb $rb $k))
          )
     (let (: $finalproof ($measq $finalconc $finalstv)) $query (: $finalproof ($measq $finalconc (let $res (cdr-atom $finalstv) (eval $res)))))
     ))