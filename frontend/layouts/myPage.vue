<template>
  <v-app>
    <my-page-app-bar />
    <v-main>
      <nuxt />
    </v-main>
    <logged-in-footer />
  </v-app>
</template>

<script>
import myPageAppBar from '~/components/loggedIn/myPageAppBar'
import loggedInFooter from '~/components/loggedIn/loggedInFooter'
export default {
  components: {
    myPageAppBar,
    loggedInFooter
  }
}
</script>