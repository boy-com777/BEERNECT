<template>
  <v-card
    width="800"
    flat
    color="transparent"
    class="mx-auto"
  >
    <v-container>
      <v-row
        dense
      >
        <v-col
          v-for="(post, i) in posts"
          :key="i"
          cols="12"
        >
          <v-card
            width="800"
            height="400"
            flat
            outlined
          >
            <v-container>
              <v-card-title>
                <v-container>
                  <v-row>
                    <v-col
                      cols="4"
                    >
                      <v-avatar
                        size="64"
                      >
                        <img
                          v-if="user.avatar.url"
                          :src="user.avatar.url"
                        >
                        <img
                          v-else
                          :src="icon"
                        >
                      </v-avatar>
                    </v-col>
                    <v-col
                      cols="8"
                    >
                      <h5>投稿時間を表示</h5>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-title>
            </v-container>
            <v-container>
              <v-card-title>
                {{ posts }}
              </v-card-title>
            </v-container>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  <!-- <v-col
    v-for="(post, i) in posts"
    :key="i"
    cols="12"
  >
    <v-container>
      <v-card
        flat
        class="mx-auto"
      >
        <v-card-title>
          <v-container>
            <v-row>
              <v-col
                cols="4"
              >
                <v-avatar
                  size="64"
                >
                  <img
                    v-if="user.avatar.url"
                    :src="user.avatar.url"
                  >
                  <img
                    v-else
                    :src="icon"
                  >
                </v-avatar>
              </v-col>
              <v-col
                cols="8"
              >
                <v-card
                  flat
                >
                  <h6>投稿時間表示</h6>
                </v-card>
              </v-col>
            </v-row>
          </v-container>
        </v-card-title>
      </v-card>
    </v-container>
  </v-col> -->
  </v-card>
</template>

<script>
export default {
  props: {
    posts: {
      type: Array,
      default: () => {}
    }
  },
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