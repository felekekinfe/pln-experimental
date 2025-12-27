
        (= (synthesize $query $kb $rb $depth)
        (let*
            (
            ($query ($kb))
            )
            $query
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $conclusion)) ($rb))
                ((: ($ructor $proof1) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $premise7 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6 $proof7) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
          ((: $proof7 $premise7) (synthesize (: $proof7 $premise7) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $premise7 $premise8 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6 $proof7 $proof8) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
          ((: $proof7 $premise7) (synthesize (: $proof7 $premise7) $kb $rb $k))
          ((: $proof8 $premise8) (synthesize (: $proof8 $premise8) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        

        (= (synthesize $query $kb $rb (S $k))
        (let* (
                ((: $ructor (-> $premise1 $premise2 $premise3 $premise4 $premise5 $premise6 $premise7 $premise8 $premise9 $conclusion)) ($rb))
                ((: ($ructor $proof1 $proof2 $proof3 $proof4 $proof5 $proof6 $proof7 $proof8 $proof9) $conclusion) $query)
                ((: $proof1 $premise1) (synthesize (: $proof1 $premise1) $kb $rb $k))
          ((: $proof2 $premise2) (synthesize (: $proof2 $premise2) $kb $rb $k))
          ((: $proof3 $premise3) (synthesize (: $proof3 $premise3) $kb $rb $k))
          ((: $proof4 $premise4) (synthesize (: $proof4 $premise4) $kb $rb $k))
          ((: $proof5 $premise5) (synthesize (: $proof5 $premise5) $kb $rb $k))
          ((: $proof6 $premise6) (synthesize (: $proof6 $premise6) $kb $rb $k))
          ((: $proof7 $premise7) (synthesize (: $proof7 $premise7) $kb $rb $k))
          ((: $proof8 $premise8) (synthesize (: $proof8 $premise8) $kb $rb $k))
          ((: $proof9 $premise9) (synthesize (: $proof9 $premise9) $kb $rb $k))
                )
            (let (: $finalproof ($measq $finalconc $finalstv))
                $query
                (: $finalproof
                    ($measq $finalconc
                            (let $res (cdr-atom $finalstv)
                                (eval $res)))))
        )
        )
        
