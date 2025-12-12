;; Generalization Knowledge Base for Common Concepts(Water and Land)

(: waterm (≞ water (STV 0.9 0.86)))
(: landm (≞ land (STV 0.88 0.84)))
(: mediumm (≞ medium (STV 0.9 0.86)))
(: watermediumm (≞ (→ water medium ()) (STV 0.9 0.86)))
(: landmediumm (≞ (→ land medium ()) (STV 0.9 0.86)))