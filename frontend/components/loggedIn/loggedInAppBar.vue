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

    <posts-link />
    <mypage-link />
    <signout-link />
  </v-app-bar>
</template>

<script>
import appLogo from '~/components/ui/appLogo'
import appTitle from '~/components/ui/appTitle'
import postsLink from '~/components/loggedIn/postsLink'
import mypageLink from '~/components/loggedIn/mypageLink'
import signoutLink from '~/components/loggedIn/signoutLink'
export default {
  components: {
    appLogo,
    appTitle,
    postsLink,
    mypageLink,
    signoutLink
  },
  data ({ $store }) {
    return {
      appBarHeight: $store.state.auth.styles.isLoggedIn.appBarHeight
    }
  }
}
</script>