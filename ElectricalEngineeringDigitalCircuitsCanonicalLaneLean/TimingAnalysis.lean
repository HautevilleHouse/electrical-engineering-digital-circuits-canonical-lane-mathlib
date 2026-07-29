import HautevilleHouse.ElectricalEngineeringDigitalCircuitsCanonicalLaneLean.SequentialCircuits

namespace HautevilleHouse
namespace ElectricalEngineeringDigitalCircuitsCanonicalLaneLean

structure TimingAnalysisPackage {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} (S : SequentialCircuitPackage C) where
  setupTime : ℝ
  holdTime : ℝ
  clockPeriod : ℝ
  criticalPaths : List (Nat × ℝ)
  setupConstraint : ∀ path ∈ criticalPaths, path.2 + S.stateUpdate?…… ≤ clockPeriod - setupTime
  holdConstraint : ∀ path ∈ criticalPaths, path.2 ≥ holdTime

structure TimingAnalysisEvidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} {S : SequentialCircuitPackage C} (T : TimingAnalysisPackage S) where
  setupClosed : ∀ path ∈ T.criticalPaths, path.2 + ?_ ≤ T.clockPeriod - T.setupTime
  holdClosed : ∀ path ∈ T.criticalPaths, path.2 ≥ T.holdTime

def TimingAnalysisClosed {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} {S : SequentialCircuitPackage C} (T : TimingAnalysisPackage S) : Prop :=
  (∀ path ∈ T.criticalPaths, path.2 + ?_ ≤ T.clockPeriod - T.setupTime) ∧
  (∀ path ∈ T.criticalPaths, path.2 ≥ T.holdTime)

theorem timing_analysis_closed_from_evidence {B : BooleanAlgebraPackage} {L : LogicGatePackage B} {C : CombinationalCircuitPackage L} {S : SequentialCircuitPackage C} (T : TimingAnalysisPackage S) (E : TimingAnalysisEvidence T) :
    TimingAnalysisClosed T := by
  exact And.intro E.setupClosed E.holdClosed

end ElectricalEngineeringDigitalCircuitsCanonicalLaneLean
end HautevilleHouse