Events:Subscribe('Partition:Loaded', function(partition)
	if partition == nil then
		return
	end

	local instances = partition.instances
	for _, instance in pairs(instances) do
		if instance ~= nil then
			-- Remove depthtree preventing craters on roads and other areas.
			if instance:Is("VehicleSpawnReferenceObjectData") then
				instance = VehicleSpawnReferenceObjectData(instance)
				instance:MakeWritable()
				instance.applyDamageToAbandonedVehicles = true
				instance.maxCount = -1
				instance.maxCountSimultaneously = 2
				instance.totalCountSimultaneouslyOfType = -1
				instance.autoSpawn = true
				instance.spawnDelay = 30
				instance.initialSpawnDelay = 2
			end
		end
	end
end)