// main template for etcd
local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.etcd;

local secrets = com.generateResources(
  params.secrets,
  function(name) com.namespaced(params.namespace, kube.Secret(name)),
);

// Define outputs below
{
  secrets: secrets,
}
