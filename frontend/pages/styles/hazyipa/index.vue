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
          <h1 class="display-1 mb-4">
            ヘイジーIPA（HAZY IPA）
          </h1>
        </v-col>
      </v-row>
    </v-img>
    <style-card
      :styles="beers"
    />
        <!-- <VueInfiniteLoading
          spinner="bubble"
          @infinite="infiniteHandler"
        >
          <div slot="no-more">--- No more ---</div>
          <div slot="no-results">--- No results---</div>
        </VueInfiniteLoading> -->
    </v-sheet>
  </v-app>
</template>

<script>
import styleCard from '~/components/beer/styleCard'
export default {
  components: {
    styleCard
  },
  layout ({ store }) {
    return store.state.auth.loggedIn ? 'loggedIn' : 'beforeLogin'
  },
  data () {
    return {
      image_src: require("@/assets/images/style/style.jpg"),
      imgHeight: 500,
      beers: [],
      // next: 1,
    }
  },
  async fetch () {
    const beers = await this.$axios.$get("/v1/beers/hazyipa")
    this.beers = beers
  },
  // methods: {
  //   async infiniteHandler ($state) {
  //     if (this.next === null) {
  //       $state.complete()
  //     } else {
  //       const params = {
  //         params: {
  //           page: this.next
  //         }
  //       }
  //       await this.$axios.$get('/v1/beers/pilsner', params)
  //         .then((response) => {
  //           this.next = response.data.meta.next
  //           this.pilsners.push(...response.data.beer)
  //           $state.loaded()
  //         })
  //         .catch(() => {
  //           $state.complete()
  //         })
  //     }
  //   }
  // }
}
</script>