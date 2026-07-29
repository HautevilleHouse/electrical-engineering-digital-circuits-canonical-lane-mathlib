import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure BooleanAlgebraPackage where
  carrier : Type u
  zero : carrier
  one : carrier
  andOp : carrier → carrier → carrier
  orOp : carrier → carrier → carrier
  notOp : carrier → carrier
  andAssoc : Prop
  orAssoc : Prop
  andComm : Prop
  orComm : Prop
  andDistrib : Prop
  orDistrib : Prop
  andIdentity : Prop
  orIdentity : Prop
  andComplement : Prop
  orComplement : Prop

structure BooleanAlgebraEvidence (B : BooleanAlgebraPackage) where
  andAssocClosed : B.andAssoc
  orAssocClosed : B.orAssoc
  andCommClosed : B.andComm
  orCommClosed : B.orComm
  andDistribClosed : B.andDistrib
  orDistribClosed : B.orDistrib
  andIdentityClosed : B.andIdentity
  orIdentityClosed : B.orIdentity
  andComplementClosed : B.andComplement
  orComplementClosed : B.orComplement

def BooleanAlgebraClosed (B : BooleanAlgebraPackage) : Prop :=
  B.andAssoc ∧ B.orAssoc ∧ B.andComm ∧ B.orComm ∧
  B.andDistrib ∧ B.orDistrib ∧ B.andIdentity ∧ B.orIdentity ∧
  B.andComplement ∧ B.orComplement

theorem boolean_algebra_closed_from_evidence (B : BooleanAlgebraPackage) (E : BooleanAlgebraEvidence B) :
    BooleanAlgebraClosed B := by
  exact And.intro E.andAssocClosed
    (And.intro E.orAssocClosed
      (And.intro E.andCommClosed
        (And.intro E.orCommClosed
          (And.intro E.andDistribClosed
            (And.intro E.orDistribClosed
              (And.intro E.andIdentityClosed
                (And.intro E.orIdentityClosed
                  (And.intro E.andComplementClosed E.orComplementClosed))))))))

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse