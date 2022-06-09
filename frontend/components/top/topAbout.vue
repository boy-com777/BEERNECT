<template>
  <v-container>
    <v-row
      no-gutters
    >
      <v-col
        cols="12"
        sm="6"
        md="6"
        lg="6"
        mx-auto
      >
        <v-card
          flat
          class="pa-2"
        >
          <v-img
            :src="search_image"
            :aspect-ratio="16/9"
          />
        </v-card>
        <v-card
          class="pa-2 text-center"
          elevation="0"
        >
          ビール検索
        </v-card>
        <v-card-text
          class="mydarkolive--text text-center"
        >
          飲みたいビールのスタイルや旅先で飲みたいビールを検索できます。
        </v-card-text>
      </v-col>
      <v-col
        cols="12"
        sm="6"
        md="6"
        lg="6"
        mx-auto
      >
        <v-card
          flat
          class="pa-2"
        >
          <v-img
            :src="post_image"
            :aspect-ratio="16/9"
          />
        </v-card>
        <v-card
          class="pa-2 text-center"
          elevation="0"
        >
          感想投稿
        </v-card>
        <v-card-text
          class="mydarkolive--text text-center"
        >
          飲んだビールの感想を投稿しましょう。
        </v-card-text>
      </v-col>
      <v-col
        cols="12"
        sm="6"
        md="6"
        lg="6"
        mx-auto
      >
        <v-card
          flat
          class="pa-2"
        >
          <v-img
            :src="share_image"
            :aspect-ratio="16/9"
          />
        </v-card>
        <v-card
          class="pa-2 text-center"
          elevation="0"
        >
          投稿シェア
        </v-card>
        <v-card-text
          class="mydarkolive--text text-center"
        >
          投稿された感想にいいねしてみましょう。
        </v-card-text>
      </v-col>
      <v-col
        cols="12"
        sm="6"
        md="6"
        lg="6"
        mx-auto
      >
        <v-card
          flat
          class="pa-2"
        >
          <v-img
            :src="memory_image"
            :aspect-ratio="16/9"
          />
        </v-card>
        <v-card
          class="pa-2 text-center"
          elevation="0"
        >
          ビール記録
        </v-card>
        <v-card-text
          class="mydarkolive--text text-center"
        >
          ビールをたくさん飲んでたくさん記録していきましょう。
        </v-card-text>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    data () {
      return {
        search_image: require("@/assets/images/top/search.jpg"),
        post_image: require("@/assets/images/top/post.jpg"),
        share_image: require("@/assets/images/top/share.jpg"),
        memory_image: require("@/assets/images/top/memory.jpg")
      }
    }
  }
</script>