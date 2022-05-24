<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-col
        v-for="(follow, i) in following"
        :key="i"
        cols="12"
        xl="4"
        lg="4"
        sm="8"
      >
        <v-card
          v-if="follow"
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
                        v-if="follow.avatar.url"
                        :src="follow.avatar.url"
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
                        :to="`/users/${follow.id}`"
                      >
                        {{ follow.name }}
                      </nuxt-link>
                    </h4>
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
    following: {
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
