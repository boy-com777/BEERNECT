<template>
  <v-app-bar
    app
    :height="appBarHeight"
    color="white"
  >
    <nuxt-link
      to="/"
      class="text-decoration-none"
    >
      <app-logo />
    </nuxt-link>

    <app-title
      class="hidden-sm-and-down"
    />

    <v-spacer></v-spacer>

    <posts-link />
    <mypage-link />
    <signout-link />

    <!-- <v-card
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
          <br>
          <v-card
            width="320"
            flat
            color="transparent"
            class="mx-auto"
          >
            <v-btn
              rounded
              block
              dark
              outlined
              color="success"
              class="white--text"
              to="/auth/edit"
            >
              <v-icon left>
                mdi-pencil
              </v-icon>
              アカウント編集
            </v-btn>
          </v-card>
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <v-toolbar
            flat
            color="transparent"
            class="toolbar"
          >
            <v-card
              width="320"
              flat
              color="transparent"
              class="mx-auto"
            >
              <v-card-actions>
                <v-btn
                  rounded
                  outlined
                  block
                  color="success"
                  class="white--text"
                  @click="openDisplay"
                >
                  <v-icon left>
                    mdi-lead-pencil
                  </v-icon>
                  飲んだビールについて感想を書く
                </v-btn>
                <create-posts-dialog ref="dlg" @submit="addPost"/>
              </v-card-actions>
            </v-card>
          </v-toolbar>
          <post :posts="user.posts"/>
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
    </v-card> -->
  </v-app-bar>
</template>

<script>
import appLogo from '~/components/ui/appLogo'
import appTitle from '~/components/ui/appTitle'
import postsLink from '~/components/loggedIn/postsLink'
import mypageLink from '~/components/loggedIn/mypageLink'
import signoutLink from '~/components/loggedIn/signoutLink'
// import profile from '~/components/loggedIn/mypage/profile'
// import post from '~/components/loggedIn/mypage/post'
// import follow from '~/components/loggedIn/mypage/follow'
// import follower from '~/components/loggedIn/mypage/follower'
// import memory from '~/components/loggedIn/mypage/memory'
// import createPostsDialog from '~/components/posts/createPostsDialog'
export default {
  components: {
    appLogo,
    appTitle,
    postsLink,
    mypageLink,
    signoutLink,
    // profile,
    // post,
    // follow,
    // follower,
    // memory,
    // createPostsDialog
  },
  data ({ $store }) {
    return {
      appBarHeight: $store.state.auth.styles.myPage.appBarHeight
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>