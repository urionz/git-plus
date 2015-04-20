git = require '../git'
StatusView = require '../views/status-view'
GitCommit = require './git-commit'

gitCommitAmend = (repo) ->
  git.cmd
    args: ['log', '-1', '--format=%B']
    cwd: repo.getWorkingDirectory()
    stdout: (amend) ->
      git.cmd
        args: ['reset', '--soft', 'HEAD^']
        exit: -> new GitCommit(repo, amend: "#{amend?.trim()}\n")

module.exports = gitCommitAmend
