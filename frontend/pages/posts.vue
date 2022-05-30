<template>
  <v-container>
    <v-row>
      <v-col
        cols="12"
      >
        <micro-post-card
          v-for="(post, i) in posts"
          :key="i"
          :post="post"
        />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
// import { mapActions, mapGetters } from 'vuex'
import microPostCard from '~/components/posts/microPostCard'
export default {
  components: {
    microPostCard
  },
  layout: 'loggedIn',
  data () {
    return {
      posts: []
    }
  },
  async fetch () {
    const posts = await this.$axios.$get("/v1/posts")
    this.posts = posts
  },
  computed: {
    // ...mapGetters({
    //   posts: 'post/posts'
    // })
  },
  methods: {
    // ...mapActions({
    //   setPosts: 'post/setPosts'
    // })
  }
}
</script>