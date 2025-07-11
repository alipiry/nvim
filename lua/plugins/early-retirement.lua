return {
  "chrisgrieser/nvim-early-retirement",
  event = "VeryLazy",
  opts = {
    retirementAgeMins = 20,
    ignoredFiletypes = {},
    ignoreUnsavedChangesBufs = true,
    ignoreSpecialBuftypes = true,
    minimumBufferNum = 4,
    ignoreAltFile = true,
    notificationOnAutoClose = true,
  },
}
