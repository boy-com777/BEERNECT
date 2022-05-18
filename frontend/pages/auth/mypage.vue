<template>
  <!-- <v-app> -->
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
              アカウント編集
              <v-icon right>
                mdi-lead-pencil
              </v-icon>
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
                  飲んだビールについて感想を書く
                  <v-icon right>
                    mdi-lead-pencil
                  </v-icon>
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
    </v-card>
  <!-- </v-app> -->
</template>

<script>
import profile from '~/components/loggedIn/mypage/profile'
import post from '~/components/loggedIn/mypage/post'
import follow from '~/components/loggedIn/mypage/follow'
import follower from '~/components/loggedIn/mypage/follower'
import memory from '~/components/loggedIn/mypage/memory'
import createPostsDialog from '~/components/posts/createPostsDialog'
export default {
  components: {
    profile,
    post,
    follow,
    follower,
    memory,
    createPostsDialog
  },
  layout: 'loggedIn',
  data () {
    return {
      posts: []
    }
  },
  fetch({
    store,
    redirect
  }) {
    store.watch(
      state => state.auth.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect('/auth/signin')
        }
      }
    )
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    openDisplay() {
      this.$refs.dlg.createPostsDialog = true
    },
    async addPost(formData, config) {
    // async addPost(post) {
      const { data } = await this.$axios.$post('/v1/posts', formData, config)
      // const { data } = await this.$axios.$post('/v1/posts', { post })
      this.$store.dispatch('auth/setUser', {
        ...this.user,
        posts: [...this.user.posts, data]
      })
      location.reload()
    }
  }
}
</script>

<style>
/* .tabs {
  position: fixed;
  right: 0px
} */

.tab-item {
  background-color: #F6F6F6
}
</style>