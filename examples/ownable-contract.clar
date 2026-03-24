;; Example: Ownable module

(define-data-var contract-owner principal tx-sender)

(define-public (admin-action)
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u401))
    (ok true)))

(define-public (transfer-ownership (new-owner principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u401))
    (var-set contract-owner new-owner)
    (print { event: "ownership-transferred", new-owner: new-owner })
    (ok true)))

(define-read-only (get-owner)
  (ok (var-get contract-owner)))
