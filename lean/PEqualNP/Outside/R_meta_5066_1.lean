import Mathlib
import PEqualNP.Defs

theorem PEqualNP.Outside.R_meta_5066_1
    (normalise :
      ∀ (n m : ℕ) (E : Finset (Fin n × Fin m))
        (C : PEqualNP.CircuitLowerBounds.Circuit),
        (∀ (a b : Fin n) (c d : Fin m), a ≠ b → c ≠ d →
          ¬ ((a, c) ∈ E ∧ (a, d) ∈ E ∧ (b, c) ∈ E ∧ (b, d) ∈ E)) →
        PEqualNP.TopForm.IsAO2 (n + m) C →
        (∀ x : Fin (n + m) → Bool,
          PEqualNP.MetaComplexity.circuitFun (n + m) C x =
            decide (∃ a b, (a, b) ∈ E ∧
              x (Fin.castAdd m a) = true ∧ x (Fin.natAdd n b) = true)) →
        ∃ (D : PEqualNP.CircuitLowerBounds.Circuit) (P L : Finset ℕ),
          PEqualNP.TopForm.IsAO2 (n + m) D ∧
          (∀ x : Fin (n + m) → Bool,
            PEqualNP.MetaComplexity.circuitFun (n + m) D x =
              decide (∃ a b, (a, b) ∈ E ∧
                x (Fin.castAdd m a) = true ∧ x (Fin.natAdd n b) = true)) ∧
          D.size ≤ C.size ∧
          (∀ w ∈ P, w < n ∨
            ∃ i < D.gates.length,
              w = n + m + i ∧
              (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
                PEqualNP.CircuitLowerBounds.GateOp.or ∧
              ∀ u ∈ (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs,
                u ∈ P) ∧
          (∀ w ∈ L, n ≤ w ∧ w < n + m ∨
            ∃ i < D.gates.length,
              w = n + m + i ∧
              (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
                PEqualNP.CircuitLowerBounds.GateOp.or ∧
              ∀ u ∈ (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs,
                u ∈ L) ∧
          ∀ i < D.gates.length,
            (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
                PEqualNP.CircuitLowerBounds.GateOp.and →
              ∃ a b,
                (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs = [a, b] ∧
                a ∈ P ∧ b ∈ L)
    (charge :
      ∀ (n : ℕ) (E : Finset (Fin n × Fin n))
        (p : Equiv.Perm (Fin n))
        (C D : PEqualNP.CircuitLowerBounds.Circuit) (P L : Finset ℕ),
        n < E.card →
        (∀ (a b c d : Fin n), a ≠ b → c ≠ d →
          ¬ ((a, c) ∈ E ∧ (a, d) ∈ E ∧ (b, c) ∈ E ∧ (b, d) ∈ E)) →
        (∀ i, (i, p i) ∈ E) →
        (∀ i, ∃ j, j ≠ p i ∧ (i, j) ∈ E) →
        (∀ j, ∃ i, p i ≠ j ∧ (i, j) ∈ E) →
        2 * n ≤ C.size + 1 →
        PEqualNP.TopForm.IsAO2 (n + n) D →
        (∀ x : Fin (n + n) → Bool,
          PEqualNP.MetaComplexity.circuitFun (n + n) D x =
            decide (∃ a b, (a, b) ∈ E ∧
              x (Fin.castAdd n a) = true ∧ x (Fin.natAdd n b) = true)) →
        D.size ≤ C.size →
        (∀ w ∈ P, w < n ∨
          ∃ i < D.gates.length,
            w = n + n + i ∧
            (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
              PEqualNP.CircuitLowerBounds.GateOp.or ∧
            ∀ u ∈ (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs,
              u ∈ P) →
        (∀ w ∈ L, n ≤ w ∧ w < n + n ∨
          ∃ i < D.gates.length,
            w = n + n + i ∧
            (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
              PEqualNP.CircuitLowerBounds.GateOp.or ∧
            ∀ u ∈ (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs,
              u ∈ L) →
        (∀ i < D.gates.length,
          (PEqualNP.MetaComplexity.NestedCover.gateAt D i).op =
              PEqualNP.CircuitLowerBounds.GateOp.and →
            ∃ a b,
              (PEqualNP.MetaComplexity.NestedCover.gateAt D i).inputs = [a, b] ∧
              a ∈ P ∧ b ∈ L) →
        E.card + n ≤ C.size + 1) :
    ∀ (x1 : ℕ) (x2 : Finset (Fin x1 × Fin x1))
      (x3 : Equiv.Perm (Fin x1))
      (x4 : PEqualNP.CircuitLowerBounds.Circuit),
      x1 < x2.card →
      (2 : ℕ) * x1 ≤ x4.size + (1 : ℕ) →
      (∀ (x7 x8 x9 x10 : Fin x1), x7 ≠ x8 → x9 ≠ x10 →
        ¬ ((x7, x9) ∈ x2 ∧ (x7, x10) ∈ x2 ∧
          (x8, x9) ∈ x2 ∧ (x8, x10) ∈ x2)) →
      (∀ (x8 : Fin x1), (x8, x3 x8) ∈ x2) →
      PEqualNP.TopForm.IsAO2 (x1 + x1) x4 →
      (∀ (x10 : Fin (x1 + x1) → Bool),
        PEqualNP.MetaComplexity.circuitFun (x1 + x1) x4 x10 =
          Decidable.decide (∃ (x11 : Fin x1) (x12 : Fin x1),
            (x11, x12) ∈ x2 ∧
            x10 (Fin.castAdd x1 x11) = Bool.true ∧
            x10 (Fin.natAdd x1 x12) = Bool.true)) →
      ((∀ (x11 : Fin x1), ∃ (x12 : Fin x1),
          x12 ≠ x3 x11 ∧ (x11, x12) ∈ x2) ∧
        ∀ (x11 : Fin x1), ∃ (x12 : Fin x1),
          x3 x12 ≠ x11 ∧ (x12, x11) ∈ x2) →
      x2.card + x1 ≤ x4.size + (1 : ℕ) := by
  intro n E p C hDense hBase hSquare hMatch hAO hFun hExtra
  obtain ⟨D, P, L, hD, hFunD, hDSize, hP, hL, hAnd⟩ :=
    normalise n n E C hSquare hAO hFun
  exact charge n E p C D P L hDense hSquare hMatch hExtra.1 hExtra.2
    hBase hD hFunD hDSize hP hL hAnd
