<template>
  <v-btn
    outlined
    dark
    color="myorange"
    class="ml-2 font-weight-bold"
    @click="signOut"
  >
    {{ $t('pages.signout') }}
  </v-btn>
</template>

<script>
import firebase from '~/plugins/firebase'
export default {
  methods: {
    async signOut() {
      await firebase.auth().signOut()
      this.$store.dispatch('auth/setUser', null)
      this.$store.dispatch('auth/setLoginState', false)
      this.$router.push('/')
    }
  }
}
</script>