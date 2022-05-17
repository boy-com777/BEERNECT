<template>
  <v-card
    flat
    color="transparent"
    class="mx-auto"
  >
    <v-container>
      <v-row
        dense
      >
        <v-col
          v-for="(beer, i) in beers"
          :key="i"
          cols="12"
          xs="6"
        >
          <v-card
            width="800"
            height="300"
            flat
            color="transparent"
            class="mx-auto"
          >
            <div class="d-flex flex-no-wrap justify-space-between">
              <div>
                <v-card-title
                  class="text-h5"
                >
                  {{ beer.beer_name }}
                </v-card-title>
                <v-divider></v-divider>
                <div>レビュー点数</div>
                <v-card-actions>
                  <v-btn
                    width="300"
                    rounded
                    outlined
                    dark
                    color="success"
                    class="white--text"
                    target="_blank"
                  >
                    <a :href="`${beer.brewery_url}`" target="_blank" class="button">ご購入はこちら</a>
                    <v-icon
                      right
                    >
                      mdi-chevron-triple-right
                    </v-icon>
                  </v-btn>
                </v-card-actions>
                <br>
                <v-row
                  justify="center"
                >
                  <v-dialog
                    v-model="reviewDialog"
                    width="1000"
                  >
                    <template #activator="{ on, attrs }">
                      <v-btn
                        width="300"
                        rounded
                        outlined
                        dark
                        color="success"
                        class="white--text"
                        v-bind="attrs"
                        v-on="on"
                      >
                        レビューを書く
                        <v-icon
                          right
                        >
                          mdi-lead-pencil
                        </v-icon>
                      </v-btn>
                    </template>
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
                            >
                              投稿する
                              <v-icon
                                right
                              >
                                mdi-lead-pencil
                              </v-icon>
                            </v-btn>
                          </v-card-actions>
                        </v-card>
                      </v-form>
                    </v-card>
                  </v-dialog>
                </v-row>
                <br>
                <v-card-actions>
                  <v-btn
                    width="300"
                    rounded
                    outlined
                    dark
                    color="success"
                    class="white--text"
                  >
                    レビューを見る
                    <v-icon
                      right
                    >
                      mdi-message-text
                    </v-icon>
                  </v-btn>
                </v-card-actions>
              </div>
              <v-avatar
                class="ma-3"
                size="250"
                tile
              >
                <v-img
                  :src="`${beer.image_url}`"
                />
              </v-avatar>
            </div>
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
    beers: {
      type: Array,
      default: () => {}
    }
  },
  data () {
    return {
      reviewDialog: false,
      isValid: false,
      title: '',
      rating: 0,
      content: '',
      titleRules: [
        v => !!v || '',
        v => v.length <= 30 || '30文字以内で入力してください'
      ],
      contentRules: [
        v => !!v || '',
        v => v.length <= 200 || '200文字以内で入力してください'
      ]
    }
  },
  methods: {
  }
}
</script>

<style>
.button {
  text-decoration: none;
  color: #44D69E;
}
</style-card>