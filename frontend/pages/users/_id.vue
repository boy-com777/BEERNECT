<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-col
        cols="12"
        xl="4"
        lg="4"
        sm="8"
      >
        <v-card
          v-if="otherUser"
        >
          <v-toolbar
            color="myorange lighten-1"
            dark
            flat
          >
            <v-toolbar-title>
              {{ otherUser.name }} さんのプロフィール
            </v-toolbar-title>
          </v-toolbar>
          <v-card-text>
            <v-container>
              <v-row>
                <v-col
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <v-avatar
                      size="62"
                    >
                      <img
                        v-if="otherUser.avatar.url"
                        :src="otherUser.avatar.url"
                      >
                      <img
                        v-else
                        :src="icon"
                      >
                    </v-avatar>
                  </v-row>
                </v-col>
                <v-col
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <h3>{{ otherUser.name }} さん</h3>
                  </v-row>
                </v-col>
                <v-col
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <p>{{ otherUser.profile }}</p>
                  </v-row>
                </v-col>
                <v-col
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <p>{{ otherUser.favorite_beer }}が好きです！！</p>
                  </v-row>
                </v-col>
                <v-col
                  cols="12"
                >
                  <v-row>
                    <v-col>
                      <p>フォロー</p>
                      <p>{{ otherUser.following.length }}人</p>
                    </v-col>
                    <v-col>
                      <p>フォロワー</p>
                      <p>{{ otherUser.followers.length }}人</p>
                    </v-col>
                  </v-row>
                </v-col>
                <v-col
                  v-if="currentUser && currentUser.id !== user.id"
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <v-btn
                      v-if="follow"
                      :color="color"
                      rounded
                      outlined
                      @click="unfollowUser"
                      @mouseover="mouseover"
                      @mouseleave="mouseleave"
                    >
                      {{ message }}
                    </v-btn>
                    <v-btn
                      v-else
                      color="success"
                      rounded
                      outlined
                      class="white--text"
                      @click="followUser"
                    >
                      フォローする
                      <v-icon
                        right
                      >
                        mdi-account-plus
                      </v-icon>
                    </v-btn>
                  </v-row>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'
export default {
  layout: 'loggedIn',
  data () {
    return {
      follow: false,
      message: 'フォロー中',
      color: 'success white--text',
      icon: require("@/assets/images/other/default-user.png")
    }
  },
  async fetch({ $axios, params, store }) {
    await $axios.$get(`/v1/users/${params.id}`)
    .then(response => {
      store.dispatch('otherUser/setData', response)
    })
  },
  computed: {
    userData() {
      return this.$store.state.auth.currentUser
    },
    otherUser() {
      return this.$store.state.otherUser.otherUser
    },
    ...mapGetters({
      otherUser: 'otherUser/data',
      currentUser: 'auth/currentUser',
      user: 'user/user'
    }),
    myselfCheck () {
      if (this.$store.getters['auth/data'] === undefined) {
        return false
      } else if (this.$store.getters['auth/data'].id === this.$store.getters['otherUser/data'].id) {
          return false
        } else {
          return true
        }
    }
  },
  created() {
    this.$axios.get(`/v1/users/${this.$route.params.id}`).then((response) => {
      this.$store.commit('user/setUser', response.data, { root: true })
      if (this.currentUser) {
        this.follow = false
        this.user.followers.forEach(f => {
          if (f.id === this.currentUser.id) {
            this.follow = true
          }
        })
      }
    })
  },
  methods: {
    ...mapActions({
      setData: 'otherUser/setData'
    }),
    mouseover() {
      this.color = 'red white--text'
      this.message = 'フォローを解除する'
    },
    mouseleave() {
      this.color = 'success white--text'
      this.message = 'フォロー中'
    },
    async followUser() {
      await this.$axios.$post('/v1/relationships', {
        user_id: this.userData.id,
        follow_id: this.otherUser.id
      })
      await this.$axios.$get(`/v1/users/${this.$route.params.id}`)
        .then(response => {
          this.setData(response)
          location.reload()
        })
    },
    async unfollowUser() {
      await this.$axios.$delete('/v1/relationships/delete', {
        params: {
          user_id: this.userData.id,
          follow_id: this.otherUser.id
        }
      })
      await this.$axios.$get(`/v1/users/${this.$route.params.id}`)
        .then(response => {
          this.setData(response)
          location.reload()
        })
    }
  }
}
</script>