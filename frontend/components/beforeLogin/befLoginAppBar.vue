<template>
  <v-app-bar
    app
    :height="appBarHeight"
    color="white"
  >
    <nuxt-link
      to="/"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>

    <app-title
      class="hidden-sm-and-down"
    />

    <v-spacer />

    <signup-link />
    <signin-link />
    <guest-link />
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
  data ({ $store }) {
    return {
      appBarHeight: $store.state.auth.styles.beforeLogin.appBarHeight
    }
  }
}
</script>