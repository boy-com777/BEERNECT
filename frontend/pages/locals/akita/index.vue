<template>
  <v-app>
    <v-sheet>
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
            <h1 class="myorange--text display-1 mb-4">
              秋田のクラフトビール
            </h1>
          </v-col>
        </v-row>
      </v-img>
      <beer-card
        :beers="beers"
      />
    </v-sheet>
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
      image_src: require("@/assets/images/locals/Akita.jpg"),
      imgHeight: 500,
      beers: []
    }
  },
  async fetch () {
    const beers = await this.$axios.$get("/v1/beers/akita")
    this.beers = beers
  }
}
</script>