<template>
  <v-app>
    <v-card
      width="1280"
      flat
      color="transparent"
      class="mx-auto"
    >
      <v-tabs
        background-color="transparent"
        grow
      >
        <v-tab>
          プロフィール
        </v-tab>
        <v-tab
          v-if="user"
        >
          {{ user.name }} の投稿
        </v-tab>
        <v-tab>
          フォロー
        </v-tab>
        <v-tab>
          フォロワー
        </v-tab>
        <v-tab
          v-if="user"
        >
          {{ user.name }} が飲んだビール一覧
        </v-tab>
      </v-tabs>
    </v-card>
  </v-app>
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