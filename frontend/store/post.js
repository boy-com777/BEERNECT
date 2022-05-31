export const state = () => ({
  data: {},
  posts: {},
})

export const getters = {
  data(state) {
    return state.data
  },
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
  setData({ context, rootState }, payload) {
    // ログイン中の場合は、いいね総数・いいね未・済のプロパティを追加
    payload.likedUsersCounts = payload.liked_users.length
    let isLikedPost = false
    if (rootState.modules.user.data) {
      payload.liked_users.forEach((user) => {
        if (user.id === rootState.modules.user.data.id) {
          isLikedPost = true
        }
      })
    }
    payload.isLikedPost = isLikedPost
    context.commit('setData', payload)
  },

  setPosts({ context, rootState }, posts) {
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
    context.commit('setPosts', likeData)
  },
}
