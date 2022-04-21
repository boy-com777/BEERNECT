<template>
  <v-app-bar
    app
    dark
  >
    <app-logo />
    <v-toolbar-title>
      {{ appName }}
    </v-toolbar-title>
    <v-spacer />
    <v-toolbar-items clas="ml-2">
      <v-btn
        v-for="(menu, i) in menus"
        :key="`menu-btn-${i}`"
        text
      >
        {{ $t(`menus.${menu.title}`) }}
      </v-btn>
    </v-toolbar-items>
  </v-app-bar>
</template>

<script>
import appLogo from '~/components/ui/appLogo'
export default {
  components: {
    appLogo
  },
  props: {
    menus: {
      type: Array,
      default: () => []
    }
  },
  data ({ $config: { appName } }) {
    return {
      appName
    }
  }
}
</script>