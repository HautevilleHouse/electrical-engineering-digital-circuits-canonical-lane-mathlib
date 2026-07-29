import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.SequentialLogicEvidence

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure FormalVerificationCertificate (A : AdmissibleClass) where
  combinationalEvidence : CombinationalLogicEvidence A.combinationalPackage
  sequentialEvidence : SequentialLogicEvidence A.sequentialPackage
  equivalenceCheckPassed : Prop
  modelCheckingCompleted : Prop
  propertyProved : Prop
  equivalenceCheckPassedClosed : equivalenceCheckPassed
  modelCheckingCompletedClosed : modelCheckingCompleted
  propertyProvedClosed : propertyProved

def FormalVerificationCertificateClosed (A : AdmissibleClass) (C : FormalVerificationCertificate A) : Prop :=
  CombinationalLogicClosed A.combinationalPackage ∧
  SequentialLogicClosed A.sequentialPackage ∧
  C.equivalenceCheckPassed ∧
  C.modelCheckingCompleted ∧
  C.propertyProved

theorem formal_verification_certificate_closed (A : AdmissibleClass) (C : FormalVerificationCertificate A) :
  FormalVerificationCertificateClosed A C := by
  exact And.intro (combinational_logic_closed_from_evidence A.combinationalPackage C.combinationalEvidence)
    (And.intro (sequential_logic_closed_from_evidence A.sequentialPackage C.sequentialEvidence)
      (And.intro C.equivalenceCheckPassedClosed
        (And.intro C.modelCheckingCompletedClosed C.propertyProvedClosed)))

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse