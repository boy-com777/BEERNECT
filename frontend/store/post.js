export const state = () => ({
  posts: [],
})

export const getters = {
  posts(state) {
    return state.posts
  },
}

export const mutations = {
  setPosts(state, posts) {
    state.posts = posts.data
  },
}

export const actions = {
  async getPosts({ commit }) {
    const posts = {
      data: '',
    }
    await this.$axios.get('/v1/posts').then((response) => {
      posts.data = response.data
      commit('setPosts', posts)
    })
  },

  setPosts({ commit, rootState }, posts) {
    const likeData = []
    posts.forEach((post) => {
      post.likedUsersCounts = posts.liked_users.length
      let isLikedPost = false
      if (rootState.auth.data) {
        post.liked_users.forEach((auth) => {
          if (auth.id === rootState.auth.data.id) {
            isLikedPost = true
          }
        })
      }
      post.isLikedPost = isLikedPost
      likeData.push(post)
    })
  },
}
