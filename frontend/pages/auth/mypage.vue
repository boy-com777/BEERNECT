<template>
  <div>
    <div v-if="user">
      <p>Email: {{ user.email }}</p>
      <p>名前: {{ user.name }}</p>
    </div>
    <v-btn @click="logOut">ログアウト</v-btn>
  </div>
</template>

<script>
import firebase from '~/plugins/firebase'
export default {
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    async logOut() {
      await firebase.auth().signOut()
      this.$store.dispatch('auth/setUser', null)
      this.$store.dispatch('auth/setLoginState', false)
      this.$router.push('/auth/signin')
    }
  }
}
</script>