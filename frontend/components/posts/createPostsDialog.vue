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
            <!-- <v-card
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
                @upload="uploadImage"
              />
            </v-card>
          <br> -->
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
      v => v.length <= 1000 || '1000文字以内で入力してください'
    ]
  }),
  computed: {
    user () {
      return this.$store.state.auth.currentUser
    },
    params() {
      return {
        post: {
          title: this.title,
          recomend_score: this.rating,
          content: this.content
        }
      }
    }
  },
  methods: {
    // uploadImage(file) {
    //   this.setImage = file
    //   if (file !== undefined && file !== null){
    //     if (file.name.lastIndexOf(".") <= 0) {
    //       return
    //     }
    //     const fr = new FileReader()
    //     fr.readAsDataURL(file)
    //     fr.addEventListener("load", () => {
    //       this.input_Image = fr.result
    //     })
    //   } else {
    //     this.input_Image = null
    //   }
    // },
    createPost() {
      const post = {
        title: this.title,
        recomend_score: this.rating,
        content: this.content,
        user_id: this.user.id
      }
      // const formData = new FormData()
      // formData.append('image', this.setImage)
      // const config = {
      //   headers: {
      //     'content-type': 'multipart/form-data'
      //   }
      // }
      // this.$emit('submit', post, formData, config)
      this.$emit('submit', post)
    }
  }
}
</script>