module VSet.Transform.Properties where

open import VSet.Prelude
open import VSet.Data.Fin hiding (pred)

open import VSet.Function.Base
open import VSet.Function.Injection
open import VSet.Function.Iso
open import VSet.Function.Properties
open import VSet.Data.SomeFin.Base
open import VSet.Data.SomeFin.Injection
open import VSet.Transform.Sub
open import VSet.Transform.Tensor
open import VSet.Transform.Split using (⊎↔+; ⊎→+; +→⊎)
open import VSet.Transform.Pred

open import Cubical.Data.Nat.Properties

𝟘⊕≡id : ∀ {X Y : SomeFin} → (f : [ X ↣ Y ]) → 𝟘 ⊕ f ≈ f
𝟘⊕≡id {X} {Y} f x = 
  fst (𝟘 ⊕ f) x ≡⟨ refl ⟩
  fst (↔to↣ ⊎↔+ ↣∘↣ ↣-map-⊎ 𝟘 f ↣∘↣ ↔to↣ (flip-↔ ⊎↔+)) x ≡⟨ refl ⟩
  (fst (↔to↣ ⊎↔+) ∘ fst (↣-map-⊎ 𝟘 f) ∘ fst (↔to↣ (flip-↔ ⊎↔+))) x ≡⟨ refl ⟩
  ⊎→+ (⊎-map (λ ()) (fst f) (+→⊎ x)) ≡⟨ refl ⟩
  ⊎→+ (inr (fst f x)) ≡⟨ refl ⟩
  fst f x ∎

finPath : (n : ℕ) → Fin n ≡ Fin (n + 0)
finPath n = cong Fin (sym (+-zero n))

x1 : Fin 1
x1 = fzero 
refl1 : x1 ≡ x1
refl1 = refl
x2 : Fin (1 + 0)
x2 = fzero

q = subst Fin (+-zero 1) x2

r : Fin 1 ≡ Fin (1 + 0)
r = subst (λ ○ → Fin ○ ≡ Fin (○ + 0)) (+-zero 1) (cong Fin (sym (+-zero 1)))

w : ∀ {m : ℕ} → fzero {n = m} ≡ subst Fin (cong suc (+-zero m)) (fzero {n = m + 0})
w {m} = transport (cong (λ ○ → fzero {n = m} ≡ Fin {!suc ○!} ) {!!}) {!!} {!!}

foo : ∀ (n m : ℕ) → (f : Fin n → Fin m) → (g : Fin (n + 0) → Fin (m + 0)) → Type
foo n m f g = PathP (λ i → (x : Fin n) → (Fin (m + 0)))
  (g ∘ subst Fin (sym (+-zero n))) 
  (subst Fin (sym (+-zero m)) ∘ f)



-- ⊕𝟘≡id : ∀ {X Y : SomeFin} → (f : [ X ↣ Y ]) → f ⊕ 𝟘 ≈ f
-- ⊕𝟘≡id {X} {Y} f x =  ?
--   -- fst (f ⊕ 𝟘) x ≡⟨ refl ⟩
  -- fst (↔to↣ ⊎↔+ ↣∘↣ ↣-map-⊎ f 𝟘 ↣∘↣ ↔to↣ (flip-↔ ⊎↔+)) x ≡⟨ refl ⟩
  -- (fst (↔to↣ ⊎↔+) ∘ fst (↣-map-⊎ f 𝟘) ∘ fst (↔to↣ (flip-↔ ⊎↔+))) x ≡⟨ refl ⟩
  -- ⊎→+ (⊎-map (λ ()) (fst f) {!+→⊎ x!}) ≡⟨ refl ⟩
  -- ⊎→+ (inl (fst f x)) ≡⟨ refl ⟩
  -- fst f x ∎

lemma1-3 : ∀ (X Y A : SomeFin) → (f : [ X ↣ Y ])
         → sub A (ladd A f) ≡ f
lemma1-3 X Y zero f = {!!}
lemma1-3 X Y (suc A) f =
  {!!}

lemma1-4 : ∀ (X Y A B : SomeFin) → (f : [ A + X ↣ A + Y ])
         → radd B (sub A f) ≡ sub A {!add B f!} 
