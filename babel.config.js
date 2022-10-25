module.exports = function (api) {
  api.cache(true);

  const plugins = ['@babel/syntax-dynamic-import'];
  const presets = [['@babel/env', { targets: { node: 'current' }, modules: false }]];

  return {
    presets,
    plugins,
  };
};
