<template>
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
            v-if="user"
            width="320"
            flat
            color="transparent"
            class="mx-auto"
          >
            <v-btn
              v-if="`${user.email}` === guest"
              rounded
              block
              dark
              outlined
              color="success"
              class="white--text"
            >
              ゲストユーザーのため編集不可です
            </v-btn>
            <v-btn
              v-else
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
          <br>
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
          <div
            v-if="user"
          >
            <post :posts="user.posts"/>
          </div>
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <div
            v-if="user"
          >
            <follow :following="user.following"/>
          </div>
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <div
            v-if="user"
          >
            <follower :followers="user.followers"/>
          </div>
        </v-tab-item>
        <v-tab-item
          class="tab-item"
        >
          <div
            v-if="user"
          >
            <memory @submit="addMemory"/>
            <memory-list :memories="user.memories" />
          </div>
        </v-tab-item>
      </v-tabs>
    </v-card>
</template>

<script>
import profile from '~/components/loggedIn/mypage/profile'
import post from '~/components/loggedIn/mypage/post'
import follow from '~/components/loggedIn/mypage/follow'
import follower from '~/components/loggedIn/mypage/follower'
import memory from '~/components/loggedIn/mypage/memory'
import createPostsDialog from '~/components/posts/createPostsDialog'
import memoryList from '~/components/loggedIn/mypage/memoryList'
export default {
  components: {
    profile,
    post,
    follow,
    follower,
    memory,
    createPostsDialog,
    memoryList
  },
  layout: 'loggedIn',
  data () {
    return {
      posts: [],
      following: [],
      followers: [],
      guest: process.env.GUEST_EMAIL
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
      const { data } = await this.$axios.$post('/v1/posts', formData, config)
      this.$store.dispatch('auth/setUser', {
        ...this.user,
        posts: [...this.user.posts, data]
      })
      location.reload()
    },
    async addMemory(memory) {
      const { data } = await this.$axios.$post('/v1/memories', memory)
      this.$store.dispatch('auth/setUser', {
        ...this.user,
        memories: [...this.user.memories, data]
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