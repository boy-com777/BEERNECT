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
            height="400"
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
                      <h4>{{ post.title }}</h4>
                      <h6>{{ post.username }} が {{ $moment(post.created_at).format('YYYY年MM月DD日 HH時mm分') }} に投稿</h6>
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
              <!-- <br>
              <v-img
                :src="`${post.image}`"
                tile
                size="80"
              /> -->
            </v-container>
            <v-container>
                <v-spacer></v-spacer>
                <template #[`item.action`]="{ item }">
                <v-icon
                  small
                  @click="deleteItem(item)"
                >
                  delete
                </v-icon>
                </template>
                <!-- <v-icon
                  color="black"
                  size="20"
                >
                  mdi-thumb-up-outline
                </v-icon>
                <v-icon
                  color="black"
                  size="20"
                >
                  mdi-message-reply-text
                </v-icon> -->
            </v-container>
          </v-card>
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
      headers: [
        {
          value: "action"
        }
      ]
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
  methods: {
    async deleteItem(item) {
      const response = confirm(" 削除しますか？")
      if (response) {
        await this.$axios.delete(`/v1/posts/${item.id}`)
        const posts = this.user.posts.filter((post) => {
          return post.id !== item.id
        })
        const newUser = {
          ...this.user,
          posts
        }
        this.$store.dispatch('auth/setUser', newUser)
      }
    }
  }
}
</script>