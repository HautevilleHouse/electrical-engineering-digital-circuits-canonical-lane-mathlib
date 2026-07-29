import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.CombinationalLogicClosure

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure SequentialLogicEvidenceTerms {C : CombinationalLogicPackage} (Seq : SequentialLogicPackage C) where
  stateTransitionDefined : Seq.stateTransition
  clockSynchronization : Seq.clockSynchronization
  setupHoldTiming : Seq.setupHoldTiming
  resetLogicDefined : Seq.resetLogicDefined
  sequentialClosed : SequentialLogicClosed Seq

def SequentialLogicPackage.evidenceTerms {C : CombinationalLogicPackage} (Seq : SequentialLogicPackage C) :
  SequentialLogicEvidenceTerms Seq := {
  stateTransitionDefined := Seq.stateTransitionClosed
  clockSynchronization := Seq.clockSynchronizationClosed
  setupHoldTiming := Seq.setupHoldTimingClosed
  resetLogicDefined := Seq.resetLogicDefinedClosed
  sequentialClosed := sequential_logic_closed_from_evidence Seq Seq.sequentialEvidence
}

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse