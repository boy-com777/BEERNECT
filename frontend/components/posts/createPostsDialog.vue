<template>
  <v-row
    justify="center"
  >
    <v-dialog
      v-model="createPostsDialog"
      width="1000"
    >
      <v-card>
        <v-card-title
          class="text-h6 success font-weight-bold"
        >
          飲んだビールについて感想を書く
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
                おすすめ度
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
                投稿内容
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
              width="800"
              flat
              color="transparent"
              class="mx-auto"
            >
              <v-file-input
                v-model="setImage"
                label="投稿する画像"
                prepend-icon="mdi-image"
                placeholder="画像を選択してください"
                accept="image/*"
              />
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
                @click="createPost"
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
    setImage: '',
    input_Image: null,
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
    createPost() {
      const formData = new FormData()
      formData.append('post[title]', this.title)
      formData.append('post[recomend_score]', this.rating)
      formData.append('post[content]', this.content)
      formData.append('post[user_id]', this.user.id)
      formData.append('post[image]', this.setImage)
      const config = {
        headers: {
          'content-type': 'multipart/form-data'
        }
      }
      this.$emit('submit', formData, config)
    }
  }
}
</script>