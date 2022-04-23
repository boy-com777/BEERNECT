<template>
  <v-btn
    outlined
    dark
    color="myorange"
    class="ml-2 font-weight-bold"
    to="/auth/signin"
  >
    {{ $t('pages.signin') }}
  </v-btn>
</template>

<script>
export default {
}
</script>