<template>
  <v-app>
    <v-card
      flat
      color="transparent"
      class="mx-auto"
    >
      <v-tabs
        background-color="transparent"
        class="tabs"
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
            mdi-liquor
          </v-icon>
          {{ user.name }} が飲んだビール一覧
        </v-tab>
        <v-tab-item
          class="tab-item"
        >
          <profile />
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <post />
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <follow />
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <follower />
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <memory />
        </v-tab-item>
      </v-tabs>
    </v-card>
  </v-app>
</template>

<script>
import profile from '~/components/loggedIn/mypage/profile'
import post from '~/components/loggedIn/mypage/post'
import follow from '~/components/loggedIn/mypage/follow'
import follower from '~/components/loggedIn/mypage/follower'
import memory from '~/components/loggedIn/mypage/memory'
export default {
  components: {
    profile,
    post,
    follow,
    follower,
    memory,
  },
  layout: 'loggedIn',
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>

<style>
.tabs {
  position: fixed;
  right: 0px
}

.tab-item {
  background-color: #F6F6F6
}
</style>