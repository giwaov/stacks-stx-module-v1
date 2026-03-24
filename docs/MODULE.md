# STX Module v1

## Modules

### Ownable
Ownership pattern for contracts.
```clarity
(define-public (set-owner (new-owner principal))
  (begin
    (asserts! (is-eq tx-sender (var-get contract-owner)) (err u401))
    (var-set contract-owner new-owner)
    (ok true)))
```

### Pausable
```clarity
(define-public (pause) ...)
(define-public (unpause) ...)
(define-read-only (is-paused) ...)
```

### Access Control
Role-based access control.
