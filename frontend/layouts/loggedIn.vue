<template>
  <v-app>
    <logged-in-app-bar />
    <v-main>
      <nuxt />
    </v-main>
    <logged-in-footer />
  </v-app>
</template>

<script>
import loggedInAppBar from '~/components/loggedIn/loggedInAppBar'
import loggedInFooter from '~/components/loggedIn/loggedInFooter'
export default {
  components: {
    loggedInAppBar,
    loggedInFooter
  }
}
</script>