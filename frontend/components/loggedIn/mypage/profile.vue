<template>
  <v-container>
    <v-card
      v-if="user"
      flat
      width="600"
      color="transparent"
      class="mx-auto"
    >
      <v-layout
        justify-center
      >
        <div>
          <template v-if="user.avatar.url">
            <v-avatar
              size="250"
            >
              <v-img
                :src="user.avatar.url"
              />
            </v-avatar>
          </template>
          <template v-else>
            <v-avatar
              size="250"
            >
              <v-img
                :src="icon"
              />
            </v-avatar>
          </template>
        </div>
      </v-layout>
      <br>
      <li class="text-h5">アカウント名</li>
      <h3 class="text-decoration-underline">{{ user.name }}</h3>
      <br>
      <div>
        <template v-if="user.favorite_beer">
          <li class="text-h5">お気に入りのビール</li>
          <h3 class="text-decoration-underline">{{ user.favorite_beer }}</h3>
        </template>
        <template v-else>
          <li class="text-h5">お気に入りのビール</li>
          <h3 class="text-decoration-underline">お気に入りのビールを登録しよう!!</h3>
        </template>
      </div>
      <br>
      <div>
        <template v-if="user.profile">
          <li class="text-h5">自己紹介</li>
          <h3 class="text-decoration-underline">{{ user.profile }}</h3>
        </template>
        <template v-else>
          <li class="text-h5">自己紹介</li>
          <h3 class="text-decoration-underline">自己紹介文を登録しよう!!</h3>
        </template>
      </div>
    </v-card>
  </v-container>
</template>

<script>
export default {
  data () {
    return {
      icon: require("@/assets/images/other/default-user.png")
    }
  },
  computed: {
    user() {
      return this.$store.state.auth.currentUser
    }
  },
}
</script>