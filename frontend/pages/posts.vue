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
            width="600"
            flat
            outlined
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
                          v-if="post.user.avatar.url"
                          :src="post.user.avatar.url"
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
                      <h4>{{ post.title }}</h4>
                      <nuxt-link
                        v-if="`${post.user_id}`!==`${user.id}`"
                        :to="`users/${post.user_id}`"
                      >
                        <h6>{{ post.username }} が {{ $moment(post.created_at).format('YYYY年MM月DD日 HH時mm分') }} に投稿</h6>
                      </nuxt-link>
                      <nuxt-link
                        v-else
                        to="/auth/mypage"
                      >
                        <h6>{{ post.username }} が {{ $moment(post.created_at).format('YYYY年MM月DD日 HH時mm分') }} に投稿</h6>
                      </nuxt-link>
                    </v-col>
                  </v-row>
                </v-container>
              </v-card-title>
            </v-container>
            <v-divider></v-divider>
            <v-container>
              <v-card
                flat
                color="transparent"
                class="mx-auto"
              >
                <li>おすすめ度</li>
                  <star-rating :rating="`${post.recomend_score}`" :read-only="true" :star-size="30"/>
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
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-card>
</template>

<script>
import StarRating from 'vue-star-rating'
export default{
  components: {
    StarRating
  },
  layout: 'loggedIn',
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png"),
      posts: []
    }
  },
  async fetch () {
    const posts = await this.$axios.$get('/v1/posts')
    this.posts = posts
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>