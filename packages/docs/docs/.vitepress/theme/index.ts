import 'maz-ui/package/tailwindcss/tailwind.css'

import DefaultTheme from 'vitepress/theme'
import { inBrowser } from 'vitepress'
import googleAnalytics from 'vitepress-plugin-google-analytics'

// import 'maz-ui/css/main.css'
import 'maz-ui/package/plugins/aos/scss/index.scss'
import './main.css'

import { ToasterOptions, installToaster, installWait, AosOptions, installAos, aosInstance } from 'maz-ui/package/index'

import * as components from 'maz-ui/package/components/index'

import ColorContainer from './components/ColorContainer.vue'
import NpmBadge from './components/NpmBadge.vue'
import { watch } from 'vue'

const theme: typeof DefaultTheme = {
  ...DefaultTheme,
  enhanceApp(ctx) {
    googleAnalytics({
      id: 'G-EM35TM23ZC',
    })

    const { app, router: { route } } = ctx

    app.provide('mazIconPath', '/maz-ui-3/icons')

    app.component('ColorContainer', ColorContainer)
    app.component('NpmBadge', NpmBadge)

    Object.entries(components).forEach(([componentName, component]) => {
      app.component(componentName, component)
    })

    const toasterOptions: ToasterOptions = {
      persistent: false,
      position: 'bottom-right',
      timeout: 10000,
    }

    const aosOptions: AosOptions = {
      // router: router,
      delay: 500,
      animation: {
        duration: 400,
        once: false
      }
    }



    app.use(installToaster, toasterOptions)
    app.use(installWait)
    app.use(installAos, aosOptions)

    watch(
      () => route.path,
      () => {
        if (inBrowser) {
          aosInstance.runAnimations()
        }
      },
    )
  },
}

export default theme