<template>
  <div>
    index.vue
  </div>
</template>

<script>
export default {
  layout ({ store }) {
    return store.state.auth.loggedIn ? 'default' : 'top'
  }
}
</script>