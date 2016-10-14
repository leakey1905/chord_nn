local nn = require 'nn'

local model = {}

function model:createAutoencoder(X)
  local featureSize = X:size(2) * X:size(3)

  -- Create encoder
  self.encoder = nn.Sequential()
  self.encoder:add(nn.View(-1, featureSize))
  self.encoder:add(nn.Linear(featureSize, 32))
  self.encoder:add(nn.ReLU(true))

  -- Create decoder
  self.decoder = nn.Sequential()
  self.decoder:add(nn.Linear(32, featureSize))
  self.decoder:add(nn.Sigmoid(true))
  self.decoder:add(nn.View(X:size(2), X:size(3)))

  -- Create autoencoder
  self.autoencoder = nn.Sequential()
  self.autoencoder:add(self.encoder)
  self.autoencoder:add(self.decoder)
end

return model
