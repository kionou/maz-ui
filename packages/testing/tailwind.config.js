// Tailwind CSS configuration (https://tailwindcss.com/docs/configuration)

const tailwindConfig = require('./../lib/package/tailwindcss/tailwind.config.js')

module.exports = {
  mode: 'jit',
  prefix: 'maz-',
  presets: [tailwindConfig],
  content: ['./src/**/*', './../lib/package/**/*'],
  corePlugins: {
    container: false,
  },
}
