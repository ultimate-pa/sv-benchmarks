# Translating from Boogie to C

For each Boogie file:

* translate the program to C and pthreads
* update the YAML file with the new input file, language and data model (ILP32)
* analyse with Automizer to see if C program is (still) correct or incorrect

Generally:

* find out what preprocessing is needed
* fix paths to property files

Semantical differences to pay attention to:

* Reading uninitialized local variables is undefined behaviour in C.
  **Solution:** Initialize explicitly using `__VERIFIER_nondet_*` functions.
* Global variables are initialized implicitly (deterministically).
  **Solution:** Initialize explicitly using `__VERIFIER_nondet_*` functions.
* Signed integer overflow is undefined behaviour in C.
  **Solution:** Depends; possibly use unsigned integers; or add checks to prevent overflow.
* Single-line statements (including increments / decrements) are not necessarily atomic in C.
  **Solution:** Where necessary, wrap in `__VERIFIER_atomic_*` functions.
* Data races between threads are undefined behaviour in C.
  **Solution:** Where necessary, wrap in `__VERIFIER_atomic_*` functions.

## `./`
- [x] `./array-eq-symm.wvr.yml`
- [x] `./array-eq-trans.wvr.yml`
- [x] `./clever.wvr.yml`
- [x] `./fibonacci.wvr.yml`
- [x] `./loop-tiling-eq.wvr.yml`
- [x] `./mult-comm.wvr.yml`
- [x] `./mult-dist.wvr.yml`
- [x] `./mult-flipped-dist.wvr.yml`
- [x] `./security.wvr.yml`
- [x] `./spaghetti.wvr.yml`
- [x] `./unroll-2.wvr.yml`
- [x] `./unroll-3.wvr.yml`
- [x] `./unroll-4.wvr.yml`
- [x] `./unroll-5.wvr.yml`
- [x] `./unroll-cond-2.wvr.yml`
- [x] `./unroll-cond-3.wvr.yml`
- [x] `./unroll-cond-4.wvr.yml`
- [x] `./unroll-cond-5.wvr.yml`

## `./bench/`
- [x] `./bench/exp1x3.wvr.yml`
- [x] `./bench/exp2x3.wvr.yml`
- [x] `./bench/exp2x4.wvr.yml`
- [x] `./bench/exp2x6.wvr.yml`
- [x] `./bench/exp2x9.wvr.yml`
- [x] `./bench/exp3x3-opt.wvr.yml`
- [x] `./bench/exp3x3.wvr.yml`

## `./chl/`
- [x] `./chl/array-int-subst.wvr.yml`
- [x] `./chl/array-int-symm.wvr.yml`
- [x] `./chl/array-int-trans.wvr.yml`
- [x] `./chl/chromosome-opt-symm.wvr.yml`
- [x] `./chl/chromosome-subst.wvr.yml`
- [x] `./chl/chromosome-symm.wvr.yml`
- [x] `./chl/chromosome-trans.wvr.yml`
- [x] `./chl/collitem-subst.wvr.yml`
- [x] `./chl/collitem-symm.wvr.yml`
- [x] `./chl/collitem-trans.wvr.yml`
- [x] `./chl/container-subst.wvr.yml`
- [x] `./chl/container-symm.wvr.yml`
- [x] `./chl/container-trans.wvr.yml`
- [x] `./chl/exp-term-subst.wvr.yml`
- [x] `./chl/exp-term-symm.wvr.yml`
- [x] `./chl/file-item-subst.wvr.yml`
- [x] `./chl/file-item-symm.wvr.yml`
- [x] `./chl/file-item-trans.wvr.yml`
- [x] `./chl/match-subst.wvr.yml`
- [x] `./chl/match-symm.wvr.yml`
- [x] `./chl/match-trans.wvr.yml`
- [x] `./chl/name-comparator-subst.wvr.yml`
- [x] `./chl/name-comparator-symm.wvr.yml`
- [x] `./chl/name-comparator-trans.wvr.yml`
- [x] `./chl/node-subst.wvr.yml`
- [x] `./chl/node-symm.wvr.yml`
- [x] `./chl/node-trans.wvr.yml`
- [x] `./chl/nzb-file-subst.wvr.yml`
- [x] `./chl/nzb-file-symm.wvr.yml`
- [x] `./chl/nzb-file-trans.wvr.yml`
- [x] `./chl/poker-hand-subst.wvr.yml`
- [ ] `./chl/poker-hand-symm.wvr.yml`
- [ ] `./chl/poker-hand-trans.wvr.yml`
- [ ] `./chl/simpl-str-subst.wvr.yml`
- [ ] `./chl/simpl-str-symm.wvr.yml`
- [ ] `./chl/simpl-str-trans.wvr.yml`
- [ ] `./chl/sre-subst.wvr.yml`
- [ ] `./chl/sre-symm.wvr.yml`
- [ ] `./chl/sre-trans.wvr.yml`
- [x] `./chl/time-subst.wvr.yml`
- [x] `./chl/time-symm.wvr.yml`
- [x] `./chl/time-trans.wvr.yml`
- [ ] `./chl/word-subst.wvr.yml`
- [ ] `./chl/word-symm.wvr.yml`
- [ ] `./chl/word-trans.wvr.yml`


## `./parallel/`
- [x] `./parallel/bakery-2.wvr.yml`
- [x] `./parallel/bakery-3.wvr.yml`
- [x] `./parallel/bakery-4.wvr.yml`
- [x] `./parallel/barrier-loop.wvr.yml`
- [x] `./parallel/barrier.wvr.yml`
- [x] `./parallel/bluetooth.wvr.yml`
- [x] `./parallel/lamport.wvr.yml`
- [x] `./parallel/min-max-1.wvr.yml`
- [x] `./parallel/min-max-2.wvr.yml`
- [x] `./parallel/misc-1.wvr.yml`
- [x] `./parallel/misc-2-unrolled-atomic.wvr.yml`
- [x] `./parallel/misc-2-unrolled.wvr.yml`
- [x] `./parallel/misc-2.wvr.yml`
- [x] `./parallel/misc-3-extended.wvr.yml`
- [x] `./parallel/misc-3.wvr.yml`
- [x] `./parallel/misc-4.wvr.yml`
- [x] `./parallel/misc-5.wvr.yml`
- [x] `./parallel/parallel-sum-1-dsl.wvr.yml`
- [x] `./parallel/parallel-sum-1.wvr.yml`
- [x] `./parallel/parallel-sum-2.wvr.yml`
- [x] `./parallel/parallel-sum-equiv.wvr.yml`
- [x] `./parallel/simple-equiv.wvr.yml`
- [x] `./parallel/ticket-2.wvr.yml`
- [x] `./parallel/ticket-3.wvr.yml`
- [x] `./parallel/ticket-4.wvr.yml`
- [x] `./parallel/ticket-5.wvr.yml`
- [x] `./parallel/ticket-6.wvr.yml`
- [x] `./parallel/ticket-7.wvr.yml`
- [x] `./parallel/ticket-8.wvr.yml`

## `./popl20/`
- [x] `./popl20/channel-sum.wvr.yml`
- [x] `./popl20/commit-1.wvr.yml`
- [x] `./popl20/commit-2.wvr.yml`
- [x] `./popl20/counter-determinism.wvr.yml`
- [ ] `./popl20/counter-fun.wvr.yml`
- [x] `./popl20/difference-det.wvr.yml`
- [x] `./popl20/figure1-alt.wvr.yml`
- [x] `./popl20/figure1.wvr.yml`
- [x] `./popl20/figure3.wvr.yml`
- [x] `./popl20/horseshoe.wvr.yml`
- [x] `./popl20/min-max-dec.wvr.yml`
- [x] `./popl20/min-max-inc-dec.wvr.yml`
- [x] `./popl20/min-max-inc.wvr.yml`
- [x] `./popl20/mult-4.wvr.yml`
- [x] `./popl20/mult-equiv.wvr.yml`
- [x] `./popl20/nonblocking-cntr-alt.wvr.yml`
- [x] `./popl20/nonblocking-cntr.wvr.yml`
- [x] `./popl20/prod-cons3.wvr.yml`
- [ ] `./popl20/prod-cons-eq.wvr.yml`
- [x] `./popl20/prod-cons.wvr.yml`
- [x] `./popl20/queue-add-2.wvr.yml`
- [x] `./popl20/queue-add-3.wvr.yml`
- [x] `./popl20/send-receive-alt.wvr.yml`
- [x] `./popl20/send-receive.wvr.yml`
- [x] `./popl20/simple-array-sum.wvr.yml`
- [x] `./popl20/simple-queue.wvr.yml`
- [x] `./popl20/threaded-sum-3.wvr.yml`
- [x] `./popl20/three-array-max.wvr.yml`
- [x] `./popl20/three-array-min.wvr.yml`
- [x] `./popl20/three-array-sum.wvr.yml`
- [x] `./popl20/two-queue.wvr.yml`

## `./popl20-bad/`
- [x] `./popl20-bad/buffer-mult-alt.wvr.yml`
- [x] `./popl20-bad/commit-1.wvr.yml`
- [x] `./popl20-bad/commit-2.wvr.yml`
- [x] `./popl20-bad/counter-queue.wvr.yml`
- [x] `./popl20-bad/dot-product-alt.wvr.yml`
- [x] `./popl20-bad/dot-product.wvr.yml`
- [x] `./popl20-bad/ring-nondet.wvr.yml`
- [x] `./popl20-bad/ring.wvr.yml`
- [x] `./popl20-bad/threaded-sum-2.wvr.yml`
- [x] `./popl20-bad/three-array-sum-alt.wvr.yml`

## `./popl20-more/`
- [x] `./popl20-more/array-sum-alt.wvr.yml`
- [x] `./popl20-more/array-sum.wvr.yml`
- [x] `./popl20-more/buffer-mult.wvr.yml`
- [x] `./popl20-more/buffer-series-array.wvr.yml`
- [x] `./popl20-more/buffer-series.wvr.yml`
- [x] `./popl20-more/dec-subseq-array.wvr.yml`
- [x] `./popl20-more/dec-subseq.wvr.yml`
- [x] `./popl20-more/dot-product-array.wvr.yml`
- [x] `./popl20-more/dot-product.wvr.yml`
- [x] `./popl20-more/inc-subseq-array.wvr.yml`
- [x] `./popl20-more/inc-subseq.wvr.yml`
- [x] `./popl20-more/max-array-hom.wvr.yml`
- [x] `./popl20-more/max-array.wvr.yml`
- [x] `./popl20-more/max-fun-alt.wvr.yml`
- [x] `./popl20-more/max-fun.wvr.yml`
- [x] `./popl20-more/min-array-hom.wvr.yml`
- [x] `./popl20-more/min-array.wvr.yml`
- [x] `./popl20-more/min-fun-alt.wvr.yml`
- [x] `./popl20-more/min-fun.wvr.yml`
- [x] `./popl20-more/min-le-max.wvr.yml`
- [x] `./popl20-more/mts-array.wvr.yml`
- [x] `./popl20-more/mts.wvr.yml`
- [x] `./popl20-more/multiply-verify.wvr.yml`
- [x] `./popl20-more/nonblocking-counter-alt2.wvr.yml`
- [x] `./popl20-more/parray-copy.wvr.yml`
- [x] `./popl20-more/queue-add-2-nl.wvr.yml`
- [x] `./popl20-more/queue-add-3-nl.wvr.yml`
- [x] `./popl20-more/sorted.wvr.yml`
- [x] `./popl20-more/sum-array-hom.wvr.yml`
- [x] `./popl20-more/sum-array.wvr.yml`
- [x] `./popl20-more/sum-fun-alt.wvr.yml`
- [x] `./popl20-more/sum-fun.wvr.yml`
- [x] `./popl20-more/vector-add.wvr.yml`

## `./popl20-proofs/`
- [x] `./popl20-proofs/counter-add-4-semi-Q67.wvr.yml`

## `./test/`
- [x] `./test/context1.wvr.yml`
- [x] `./test/easy10.wvr.yml`
- [x] `./test/easy11.wvr.yml`
- [x] `./test/easy1.wvr.yml`
- [x] `./test/easy6.wvr.yml`
- [x] `./test/easy7.wvr.yml`
- [x] `./test/easy8.wvr.yml`
- [x] `./test/hard1.wvr.yml`
- [x] `./test/semi1.wvr.yml`

