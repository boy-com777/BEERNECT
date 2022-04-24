<template>
  <v-btn
    outlined
    dark
    color="myorange"
    class="ml-2 font-weight-bold"
    @click="guestSignIn"
  >
    {{ $t('pages.guest') }}
  </v-btn>
</template>

<script>
import firebase from '~/plugins/firebase'
export default {
  data () {
    return {
      email: process.env.GUEST_EMAIL,
      password: process.env.GUEST_PASSWORD
    }
  },
  methods: {
    async guestSignIn() {
      await firebase.auth().signInWithEmailAndPassword(this.email, this.password)
      this.$router.push('/auth/mypage')
    }
  }
}
</script>