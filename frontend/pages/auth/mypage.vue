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
          <v-icon left>
            mdi-account
          </v-icon>
          プロフィール
        </v-tab>
        <v-tab
          v-if="user"
        >
          <v-icon left>
            mdi-message-text
          </v-icon>
          {{ user.name }} の投稿
        </v-tab>
        <v-tab>
          <v-icon left>
            mdi-charity
          </v-icon>
          フォロー
        </v-tab>
        <v-tab>
          <v-icon left>
            mdi-charity
          </v-icon>
          フォロワー
        </v-tab>
        <v-tab
          v-if="user"
        >
          <v-icon left>
            mdi-liqur
          </v-icon>
          {{ user.name }} が飲んだビール一覧
        </v-tab>
        <v-tab-item
          background-color="transparent"
        >
          <v-card
            width="600"
            flat
            color="transparent"
            class="mx-auto"
          >
            <div>アカウント名
              <div v-if="user">
                {{ user.name }}
              </div>
            </div>
            <div>プロフィール
              <div v-if="user">
                {{ user.profile }}
              </div>
            </div>
            <div>お気に入りのビール
              <div v-if="user">
                {{ user.favorite_beer }}
              </div>
            </div>
            <v-card-actions>
              <v-btn>アカウント編集</v-btn>
            </v-card-actions>
          </v-card>
        </v-tab-item>
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