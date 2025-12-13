def build_chain(side, depth, var_offset):
    """
    side: 'c1' or 'c2'
    depth: chain depth (0 means direct to lcg)
    var_offset: starting index for fresh variables

    Returns:
      atoms: list of (≞ ...) strings
      tv_expr: string to be used inside lcg-formula
      next_var_offset: updated offset
    """
    atoms = []

    # depth 0 → direct link
    if depth == 0:
        tv = f"${side}lcgtv"
        atoms.append(f"(≞ (→ ${side} $lcg ()) {tv})")
        return atoms, tv, var_offset

    # depth ≥ 1 → chain + STV
    tvs = []
    prev = f"${side}"

    for i in range(depth):
        var = f"$var{var_offset}"
        tv = f"${prev.strip('$')}{var.strip('$')}tv"
        atoms.append(f"(≞ (→ {prev} {var} ()) {tv})")
        tvs.append(tv)
        prev = var
        var_offset += 1

    tv = f"${prev.strip('$')}lcgtv"
    atoms.append(f"(≞ (→ {prev} $lcg ()) {tv})")
    tvs.append(tv)

    return atoms, f"(STV ({' '.join(tvs)}) ())", var_offset


def generate_lcg_rules(max_depth):
    rules = []

    # ---------- depth 0 (single rule) ----------
    rules.append(
        """(: LCG-DEPTH-0
    (-> (≞ $c1 $c1tv)
        (≞ $c2 $c2tv)
        (≞ $lcg $lcgtv)
        (≞ (→ $c1 $lcg ()) $c1lcgtv)
        (≞ (→ $c2 $lcg ()) $c2lcgtv)
        (≞ (→ $c1 $c2 ($lcg))
            (Method lcg-formula
                $c1tv $c2tv $lcgtv
                $c1lcgtv
                $c2lcgtv)))
)"""
    )

    # ---------- depths ≥ 1 ----------
    for D in range(1, max_depth + 1):
        for d1 in range(D + 1):
            for d2 in range(D + 1):
                if max(d1, d2) != D:
                    continue

                atoms = [
                    "(≞ $c1 $c1tv)",
                    "(≞ $c2 $c2tv)",
                    "(≞ $lcg $lcgtv)"
                ]

                var_offset = 0

                c1_atoms, c1_tv, var_offset = build_chain("c1", d1, var_offset)
                c2_atoms, c2_tv, var_offset = build_chain("c2", d2, var_offset)

                atoms.extend(c1_atoms)
                atoms.extend(c2_atoms)

                rule = f"""(: LCG-D{D}-C1{d1}-C2{d2}
    (-> {' '.join(atoms)}
        (≞ (→ $c1 $c2 ($lcg))
            (Method lcg-formula
                $c1tv $c2tv $lcgtv
                {c1_tv}
                {c2_tv})))
)"""

                rules.append(rule)

    # ---------- wrap everything ----------
    return "(\n" + "\n\n".join(rules) + "\n)"

print(generate_lcg_rules(2))