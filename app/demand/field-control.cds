using Demandservice from '../../srv/service.cds';

annotate Demandservice.Demand with {

} actions {
    fullfilled @(
      Core.OperationAvailable : { $edmJson: { $Ne: [{ $Path: 'in/to_status_code'}, 'F']}},
    Common.SideEffects.TargetProperties : ['in/to_status_code']
    );
}