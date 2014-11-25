class Note < ActiveRecord::Base
	belongs_to :community

	scope :with_community, -> (cid) { 
		cid ? where(community: cid) : all
	}

	scope :published, -> { where(published: true) }
	scope :unpublished, -> { where(published: false) }

	scope :accesible_by, -> (community_id) {
		where('community_id = :com OR published = :pub', 
			com: community_id,
			pub: true)
	}
end
