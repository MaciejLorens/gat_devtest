json.id target_group.id
json.name target_group.name
json.external_id target_group.external_id
json.parent_id target_group.parent_id
json.child_target_groups target_group.child_target_groups.map do |target_group|
  json.partial! 'target_group', target_group: target_group
end
