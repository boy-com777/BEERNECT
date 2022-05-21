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
            color="cyan darken-1"
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
                      coloer="success"
                      @click="follow"
                    >
                      フォローする
                    </v-btn>
                    <v-btn
                      v-else
                      collor="white--text red"
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
export default {
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png")
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>