<template>
  <v-card
    width="600"
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
          <v-container>
            <v-card-title
              v-if="user"
            >
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
                        alt="Avatar"
                      >
                      <img
                        v-else
                        :src="icon"
                        alt="Avatar"
                      >
                    </v-avatar>
                  </v-col>
                  <v-col
                    cols="8"
                  >
                    <h4>{{ post.title }}</h4>
                    <v-divider></v-divider>
                    <h5>{{ post.username }}</h5>
                    <h5>{{ $moment(post.created_at).format('YYYY年MM月DD日 HH時mm分') }} に投稿</h5>
                  </v-col>
                </v-row>
              </v-container>
            </v-card-title>
          </v-container>
          <v-container>
            <v-card
            flat
            color="transparent"
            class="mx-auto"
            >
              <li>おすすめ度</li>
              <star-rating :rating="Number(`${post.recomend_score}`)" :read-only="true" :star-size="30"/>
            </v-card>
            <br>
            <v-card
              flat
              color="transparent"
              class="mx-auto"
            >
              <li>飲んだ感想</li>
              <h4>{{ post.content }}</h4>
            </v-card>
            <br>
            <template
              v-if="post.image.url"
            >
              <v-card
                flat
                color="transparent"
                class="mx-auto"
              >
                <v-layout
                  justify-center
                >
                  <v-avatar
                    tile
                    size="256"
                  >
                    <v-img
                      :src="`${post.image.url}`"
                    />
                  </v-avatar>
                </v-layout>
              </v-card>
            </template>
          </v-container>
          <v-row
            justify="end"
            class="pr-3"
          >
            <v-btn
              icon
              text
              color="grey darken-2"
              @click="deletePost(post)"
            >
              <v-icon>
                mdi-delete
              </v-icon>
            </v-btn>
          </v-row>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import StarRating from 'vue-star-rating'
export default {
  components: {
    StarRating
  },
  props: {
    posts: {
      type: Array,
      default: () => {}
    }
  },
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png"),
      rating: 0,
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    async deletePost(post) {
      const response = confirm("削除しますか？")
      if (response) {
        await this.$axios.delete(`/v1/posts/${post.id}`)
        const posts = this.user.posts
        const newUser = {
          ...this.user,
          posts
        }
        this.$store.dispatch('auth/setUser', newUser)
        .then(() => {
          location.reload()
        })
      }
    }
  }
}
</script>