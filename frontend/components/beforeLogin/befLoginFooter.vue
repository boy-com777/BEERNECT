<template>
  <div :style="{ marginTop: `${height}px`}">
    <v-footer
      absolute
      dark
      color="black"
      :height="height"
    >
      <v-row
        justify="center"
        no-gutters
      >
        <info-privacy />
      </v-row>
      <v-row
        justify="center"
        no-gutters
      >
        <info-terms />
      </v-row>
      <v-col
        cols="12"
        class="py-0"
      >
        <div class="text-center text-body-2">
          &copy;2022
          <strong>{{ appName }}</strong>
        </div>
      </v-col>
    </v-footer>
  </div>
</template>

<script>
import infoPrivacy from '~/components/information/infoPrivacy'
import infoTerms from '~/components/information/infoTerms'
export default {
  components: {
    infoPrivacy,
    infoTerms
  },
  data ({ $config: { appName } }) {
    return {
      appName,
      height: 80,
      infos: [
        { title: 'privacy' },
        { terms: 'terms' }
      ]
    }
  },
}
</script>