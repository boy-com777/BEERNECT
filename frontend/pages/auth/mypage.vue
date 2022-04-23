<template>
  <div>
    マイページ
    <div v-if="user">
      <p>Email: {{ user.email }}</p>
      <p>名前: {{ user.name }}</p>
    </div>
  </div>
</template>

<script>
export default {
  layout: 'loggedIn',
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>