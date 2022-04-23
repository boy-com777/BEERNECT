<template>
  <v-app-bar
    app
    :dark="!isScrollPoint"
    :height="appBarHeight"
    :color="toolbarStyle.color"
    :elevation="toolbarStyle.elevation"
  >
    <app-logo
      @click.native="goTo('scroll-top')"
    />
    <app-title
      class="ml-2 hidden-sm-and-down"
    />
    <v-spacer />
    <v-toolbar-items class="ml-2 hidden-sm-and-down">
      <v-btn
        v-for="(menu, i) in menus"
        :key="`menu-btn-${i}`"
        text
        :class="{ 'hidden-sm-and-down': (menu.title === 'about') }"
        @click="goTo(menu.title)"
      >
        {{ $t(`menus.${menu.title}`) }}
      </v-btn>
    </v-toolbar-items>
    <signup-link />
    <signin-link />
    <guest-link />
    <v-menu
      bottom
      nudge-left="110"
      nudge-width="100"
    >
      <template #activator="{ on }">
        <v-app-bar-nav-icon
          class="hidden-md-and-up"
          v-on="on"
        />
      </template>
      <v-list
        dense
        class="hidden-md-and-up"
      >
        <v-list-item
          v-for="(menu, i) in menus"
          :key="`menu-list-${i}`"
          exact
          @click="goTo(menu.title)"
        >
          <v-list-item-title>
            {{ $t(`menus.${menu.title}`) }}
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-menu>
  </v-app-bar>
</template>

<script>
import appLogo from '~/components/ui/appLogo'
import appTitle from '~/components/ui/appTitle'
import signupLink from '~/components/beforeLogin/signupLink'
import signinLink from '~/components/beforeLogin/signinLink'
import guestLink from '~/components/beforeLogin/guestLink'
export default {
  components: {
    appLogo,
    appTitle,
    signupLink,
    signinLink,
    guestLink
  },
  props: {
    menus: {
      type: Array,
      default: () => []
    },
    imgHeight: {
      type: Number,
      default: 0
    }
  },
  data ({ $store }) {
    return {
      scrollY: 0,
      appBarHeight: $store.state.auth.styles.beforeLogin.appBarHeight
    }
  },
  computed: {
    isScrollPoint () {
      return this.scrollY > (this.imgHeight - this.appBarHeight)
    },
    toolbarStyle () {
      const color = this.isScrollPoint ? 'white' : 'transparent'
      const elevation = this.isScrollPoint ? 4 : 0
      return { color, elevation }
    }
  },
  mounted () {
    window.addEventListener('scroll', this.onScroll)
  },
  beforeDestroy () {
    window.addEventListener('scroll', this.onScroll)
  },
  methods: {
    onScroll () {
      this.scrollY = window.scrollY
    },
    goTo (id) {
      this.$vuetify.goTo(`#${id}`)
    }
  }
}
</script>