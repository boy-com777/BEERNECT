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
          v-for="(style, i) in styles"
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
                  {{ style.beer_name }}
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
                    <a :href="`${style.brewery_url}`" target="_blank" class="button">ご購入はこちら</a>
                    <v-icon
                      right
                    >
                      mdi-chevron-triple-right
                    </v-icon>
                  </v-btn>
                </v-card-actions>
                <v-card-actions>
                  <v-btn
                    width="300"
                    rounded
                    outlined
                    dark
                    color="success"
                    class="white--text"
                  >
                    レビューを書く
                    <v-icon
                      right
                    >
                      mdi-pencil
                    </v-icon>
                  </v-btn>
                </v-card-actions>
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
                  :src="`${style.image_url}`"
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
export default {
  props: {
    styles: {
      type: String,
      default: ''
    }
  }
}
</script>

<style>
.button {
  text-decoration: none;
  color: #44D69E;
}
</style-card>