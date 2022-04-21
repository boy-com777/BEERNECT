<template>
  <v-avatar
    size="36"
    class="my-app-log"
  >
    <v-img
      :src="image_src"
    />
  </v-avatar>
</template>

<script>
  export default {
    data () {
      return {
        image_src: require("@/assets/images/top/logo.png")
      }
    }
  }
</script>

<style lang="scss" scoped>
.my-app-log {
  margin-right: 8px;
  cursor: pointer;
}
</style>