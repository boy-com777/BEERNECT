<template>
  <v-row
    justify="center"
  >
    <v-dialog
      v-model="createReviewsDialog"
      width="1000"
    >
      <v-card>
        <v-card-title
          class="text-h6 success font-weight-bold"
        >
          レビューを書く
        </v-card-title>
          <v-form
            v-model="isValid"
          >
            <v-card
              width="900"
              flat
              color="transparent"
              class="mx-auto"
            >
              <div
                class="text-h6 font-weight-bold"
              >
                タイトル
                <v-card
                  width="800"
                  flat
                  color="transparent"
                  class="mx-auto"
                >
                  <v-text-field
                    v-model="title"
                    :rules="titleRules"
                    :counter="30"
                    outlined
                    required
                  />
                </v-card>
              </div>
            </v-card>
            <v-card
              width="900"
              flat
              color="transparent"
              class="mx-auto"
            >
              <div
                class="text-h6 font-weight-bold"
              >
                評価
                <v-card
                  width="800"
                  flat
                  color="transparent"
                  class="mx-auto"
                >
                  <star-rating v-model="rating"/>
                </v-card>
              </div>
            </v-card>
            <br>
            <v-card
              width="900"
              flat
              color="transparent"
              class="mx-auto"
            >
              <div
                class="text-h6 font-weight-bold"
              >
                レビュー内容
                <v-card
                  width="800"
                  flat
                  color="transparent"
                  class="mx-auto"
                >
                  <v-textarea
                    v-model="content"
                    :rules="contentRules"
                    :counter="200"
                    outlined
                    required
                  />
                </v-card>
              </div>
            </v-card>
            <br>
          <v-card
            width="320"
            flat
            color="transparent"
            class="mx-auto"
          >
            <v-card-actions>
              <v-btn
                :disabled="!isValid"
                rounded
                outlined
                block
                color="success"
                class="white--text"
                @click="createReview"
              >
                <v-icon left>
                  mdi-lead-pencil
                </v-icon>
                投稿する
              </v-btn>
            </v-card-actions>
          </v-card>
        </v-form>
      </v-card>
    </v-dialog>
  </v-row>
</template>

<script>
import StarRating from 'vue-star-rating'
export default {
  components: {
    StarRating
  },
  data: () => ({
    isValid: false,
    createPostsDialog: false,
    title: '',
    content: '',
    rating: 0,
    titleRules: [
      v => !!v || '',
      v => v.length <= 30 || '30文字以内で入力してください'
    ],
    contentRules: [
      v => !!v || '',
      v => v.length <= 200 || '200文字以内で入力してください'
    ]
  }),
  computed: {
    user () {
      return this.$store.state.auth.currentUser
    },
  },
  methods: {
    createReview() {
      const review = {
        title: this.title,
        review_score: this.rating,
        content: this.content,
        user_id: this.user.id,
      }
      this.$emit('submit', review)
    }
  }
}
</script>