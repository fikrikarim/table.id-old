users = User.all.map{|c|
  {id: c.id, ip:
  c.last_sign_in_ip.to_s}
}

users_ids = users.pluck(:id)

unq_users = users.uniq {|c| c[:ip]}

unq_users_ids = unq_users.each.map{|c| c[:id]}

dup_users_ids = users_ids - unq_users_ids

Vote.where(voter_id: dup_users_ids).delete_all
