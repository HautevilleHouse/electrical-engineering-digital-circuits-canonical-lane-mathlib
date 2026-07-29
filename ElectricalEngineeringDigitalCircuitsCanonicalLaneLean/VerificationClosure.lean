import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.DigitalCircuitPackages
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.TimingAnalysis

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure VerificationClosurePackage where
  timing : TimingClosurePackage
  verification : VerificationPackage
  functionCorrect : Prop

def verificationClosureClosed (V : VerificationClosurePackage) : Prop :=
  timingClosureClosed V.timing ∧ verificationClosed V.verification ∧ V.functionCorrect

theorem verification_closure_from_evidence (V : VerificationClosurePackage) (h1 : timingClosureClosed V.timing) (h2 : verificationClosed V.verification) (h3 : V.functionCorrect) :
    verificationClosureClosed V := by
  exact And.intro h1 (And.intro h2 h3)

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse