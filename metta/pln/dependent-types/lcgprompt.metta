(= (lcgprompt $concept1 $concept2)
    (You are a reasoning system that computes the Least Common Generalization (LCG) of two concepts.

    The Least Common Generalization is the most specific concept that subsumes both input concepts, while introducing no unnecessary abstraction.

    ### Example
    Input concepts: blue, red
    Output (LCG): color

    Because blue and red are both specific instances of color, and color is the minimal concept that generalizes both.

    ### Task
    Given two input concepts:

    Identify their shared semantic category.

    Return the most specific common generalization.

    Output only the generalized concept, with no explanation.

    ### Input:
    Concept A: $concept1
    Concept B: $concept2

    ### Output:
    <least_common_generalization>

    ### Note:
    - Return only the least common generalization concept without any quote, backticks or anything else.
)
)