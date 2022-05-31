<template>
  <v-card
    width="600"
    flat
    class="mx-auto"
  >
    <v-container>
      <v-row
        dense
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
                  <nuxt-link
                    v-if="`${post.user_id}`!==`${user.id}`"
                    :to="`users/${post.user_id}`"
                  >
                    <h5>{{ post.user.name }}</h5>
                  </nuxt-link>
                  <nuxt-link
                    v-else
                    to="/auth/mypage"
                  >
                    <h5>{{ post.user.name }}</h5>
                  </nuxt-link>
                  <h5>{{ $moment(post.created_at).format('YYYY年MM月DD日 HH時mm分') }} に投稿</h5>
                </v-col>
              </v-row>
            </v-container>
          </v-card-title>
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
            <div
              v-if="post.user_id === user.id"
            >
              <v-btn
                icon
                text
                color="grey darken-2"
              >
                <v-icon>
                  mdi-delete
                </v-icon>
              </v-btn>
            </div>
            <v-btn
              v-if="like"
              icon
              text
              color="red"
              @click="disLikedPost(post)"
            >
              <v-icon>
                mdi-heart
              </v-icon>
            </v-btn>
            <v-btn
              v-else
              icon
              text
              color="grey darken-2"
              @click="likedPost(post)"
            >
              <v-icon>
                mdi-heart-outline
              </v-icon>
            </v-btn>
            <p>{{ post.liked_users.length }}</p>
          </v-row>
        </v-container>
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
    post: {
      type: Object,
      default: () => ({})
    }
  },
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png"),
      postId: '',
      like: false,
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    },
    login() {
      return this.$store.state.auth.loggedIn
    }
  },
  created() {
    this.$axios.$get('/v1/posts')
      .then(() => {
        if (this.login === true) {
          this.post.liked_users.forEach((f) => {
            if (f.id === this.user.id) {
              this.like = true
            }
          })
        }
      })
  },
  methods: {
    likedPost () {
      this.$axios.$post('/v1/likes', {
        like: {
          user_id: this.user.id,
          post_id: this.post.id
        }
      })
    },
    disLikedPost () {
      this.$axios.$delete('/v1/likes/delete', {
        params: {
          user_id: this.user.id,
          post_id: this.post.id
        }
      })
    }
  }
}
</script>