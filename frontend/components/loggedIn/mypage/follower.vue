<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-col
        v-for="(follower, i) in followers"
        :key="i"
        cols="12"
        xl="8"
        lg="8"
        sm="8"
      >
        <v-card
          v-if="follower"
          width="400"
          class="mx-auto"
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
                        v-if="follower.avatar.url"
                        :src="follower.avatar.url"
                      />
                      <img
                        v-else
                        :src="icon"
                      />
                    </v-avatar>
                  </v-col>
                  <v-col
                    cols="8"
                  >
                    <h4>
                      <nuxt-link
                        :to="`/users/${follower.id}`"
                      >
                        {{ follower.name }}
                      </nuxt-link>
                    </h4>
                    <h6>{{ follower.profile }}</h6>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-title>
          </v-container>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  props: {
    followers: {
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
