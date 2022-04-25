<template>
  <v-app>
    <v-img
      id="scroll-top"
      dark
      :src="image_src"
      :height="imgHeight"
    >
      <v-row
        align="center"
        justify="center"
        :style="{ height: `${imgHeight}px` }"
      >
        <v-col
          cols="12"
          class="text-center"
        >
          <h1 class="display-1 mb-4">
            ピルスナー（PILSNER）
          </h1>
        </v-col>
      </v-row>
    </v-img>
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
            v-for="(pilsner, i) in pilsners"
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
                    {{ pilsner.beer_name }}
                  </v-card-title>
                  <v-divider></v-divider>
                  <v-card-actions>
                    <v-btn
                      width="300"
                      rounded
                      outlined
                      dark
                      color="success"
                      class="white--text"
                      target="_blank"
                      :href="`${pilsner.brewery_url}`"
                    >
                      ご購入はこちら
                      <v-icon>
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
                      <v-icon>
                        mdi-pencil
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
                    :src="`${pilsner.image_url}`"
                  />
                </v-avatar>
              </div>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-card>
  </v-app>
</template>

<script>
export default {
  components: {
  },
  layout ({ store }) {
    return store.state.auth.loggedIn ? 'loggedIn' : 'beforeLogin'
  },
  data () {
    return {
      image_src: require("@/assets/images/style/style.jpg"),
      imgHeight: 500,
      pilsners: []
    }
  },
  async fetch () {
    const pilsners = await this.$axios.$get("/v1/beers/pilsner")
    this.pilsners = pilsners
  }
}
</script>