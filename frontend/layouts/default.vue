<template>
  <v-app>
    <top-logged-in-app-bar
      :menus="menus"
      :img-height="imgHeight"
    />
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
            飲みたいクラフトビール<br>
            旅先でのクラフトビール<br>
            探せます
          </h1>
        </v-col>
      </v-row>
    </v-img>
    <v-sheet>
      <v-container
        fluid
        :style="{ maxWidth: '1280px' }"
      >
        <v-row
          v-for="(menu, i) in menus"
          :key="`menu-${i}`"
        >
          <v-col
            :id="menu.title"
            cols="12"
          >
            <v-card
              flat
            >
              <v-card-title class="justify-center display-1">
                {{ $t(`menus.${menu.title}`) }}
              </v-card-title>
              <v-card-text class="text-center">
                {{ menu.subtitle }}
              </v-card-text>
            </v-card>
          </v-col>
          <v-col
            cols="12"
          >
            <div :is="`top-${menu.title}`" />
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
    <logged-in-footer />
  </v-app>
</template>

<script>
import topLoggedInAppBar from '~/components/top/topLoggedInAppBar'
import topAbout from '~/components/top/topAbout'
import topStyle from '~/components/top/topStyle'
import topMap from '~/components/top/topMap'
import loggedInFooter from '~/components/loggedIn/loggedInFooter'
export default {
  components: {
    topLoggedInAppBar,
    topAbout,
    topStyle,
    topMap,
    loggedInFooter
  },
  data () {
    return {
      image_src: require("@/assets/images/top/beer.jpg"),
      imgHeight: 500,
      menus: [
        { title: 'about', subtitle: 'ビールを検索することができます。感想を投稿して人とつながることができます。BEERNECTはビールと人をつなぐサービスです。' },
        { title: 'style', subtitle: '飲みたいスタイルからビールを検索できます。' },
        { title: 'map', subtitle: '旅先でのビールを検索できます' }
      ]
    }
  }
}
</script>