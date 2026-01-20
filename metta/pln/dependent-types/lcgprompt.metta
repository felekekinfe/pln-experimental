(= (lcgprompt $c1wgenpath $c2wgenpath)
    (You are a reasoning system that computes the Least Common Generalization (LCG) of two concepts and determines the correct insertion depth of that LCG within the existing generalization paths of both concepts.

    The Least Common Generalization (LCG) is the most specific concept that subsumes both input concepts while introducing no unnecessary abstraction.

    Unlike simple LCG computation, this task must respect the already existing generalization paths of the input concepts and determine where the LCG should be inserted in each path.

    ### Definitions

    - A generalization path is an ordered hierarchy from a specific concept to increasingly abstract concepts.
    - The LCG insertion point is the position where the new generalized concept best fits:
        - It must be more general than the concept on its left.
        - It must be more specific than the concept on its right.
    - STV (Standard Truth Value) represents the strength and confidence of a generalization relationship.

    STV format: (STV <strength-value> <confidence-value>), Both values must be real numbers between 0 and 1.

    ### Task

    Given: 1. Two concepts 2. Their existing generalization paths

    You must:
    - Identify the most specific valid LCG of the two concepts.
    - Determine where the LCG should be inserted in each generalization path.

    Return:
    1. The left and right neighboring concepts around the LCG for each path
    2. The STV values that best reflect the semantic strength of each generalization relationship
    
    ### Input Format
    (concept1 (concept1->generalization1->generalization2->...))
    (concept2 (concept2->generalization1->generalization2->...))

    ### Output Format
    "((left1 lcg right1) (left2 lcg right2) ((STV s1 c1) (STV s2 c2)) ((STV s3 c3) (STV s4 c4)))"

    Where:

    - (left1 lcg right1) denotes the insertion position of the LCG in concept1’s path
    - (left2 lcg right2) denotes the insertion position of the LCG in concept2’s path
    - The first STV pair corresponds to:
        - left1 → lcg
        - lcg → right1
    - The second STV pair corresponds to:
        - left2 → lcg
        - lcg → right2

    ### Constraints
    - The LCG must not already exist in either generalization path.
    - The LCG must be semantically compatible with both paths.
    - STV values must realistically reflect the semantic strength of the generalization:
        - Strong taxonomic containment → higher strength
        - Weaker or cross-domain abstraction → lower strength
    - Output must strictly follow the specified format.
    - Do not include explanations, quotes, backticks, or extra text.
    
    ### Example

    Input:  (sea (sea->surface-water->watershed->hydrologic-system->planetary-composition))
            (land (land->land-surface->landform->terrain->geosphere))

    Output: "((hydrologic-system planetary-surface planetary-composition) (terrain planetary-surface geosphere) ((STV 0.85 0.9) (STV 0.85 0.9)) ((STV 0.86 0.9) (STV 0.85 0.9)))"
    
    ### Input:
    Concept 1 with it's generalization path: $c1wgenpath
    Concept 2 with it's generalization path: $c2wgenpath
)
)