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
        <v-card>
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
                        v-if="otherUser.avatar_url"
                        :src="otherUser"
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
                  v-if="myselfCheck"
                  cols="12"
                >
                  <v-row
                    justify="center"
                  >
                    <v-btn
                      v-if="!otherUser.isFollowed"
                      color="success"
                      rounded
                      outlined
                      class="white--text"
                      @click="follow"
                    >
                      フォローする
                    </v-btn>
                    <v-btn
                      v-else
                      color="red"
                      rounded
                      outlined
                      class="white--text"
                      @click="unfollow"
                    >
                      フォロー解除する
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
    user() {
      return this.$store.state.auth.currentUser
    },
    ...mapGetters({
      otherUser: 'otherUser/data'
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
  methods: {
    ...mapActions({
      setData: 'otherUser/setData'
    }),
    async follow() {
      await this.$axios.$post('/v1/relationships', {
        user_id: this.user.id,
        follow_id: this.otherUser.id
      })
      await this.$axios.$get(`/v1/users/${this.$route.params.id}`)
        .then(response => {
          this.setData(response)
        })
    },
    async unfollow() {
      await this.$axios.$delete('/v1/relationships', {
        params: {
          user_id: this.user.id,
          follow_id: this.otherUser.id
        }
      })
      await this.$axios.$get(`/v1/users/${this.$route.params.id}`)
        .then(response => {
          this.setData(response)
        })
    }
  }
}
</script>