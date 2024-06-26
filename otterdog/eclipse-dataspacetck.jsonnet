local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local newRepo(repoName) = orgs.newRepo(repoName) {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
};

orgs.newOrg('eclipse-dataspacetck') {
  settings+: {
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  secrets+: [
    orgs.newOrgSecret('DOCKER_HUB_TOKEN') {
      value: "pass:bots/technology.dataspacetck/docker.com/api-token",
    },
    orgs.newOrgSecret('DOCKER_HUB_USER') {
      value: "pass:bots/technology.dataspacetck/docker.com/username",
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/technology.dataspacetck/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/technology.dataspacetck/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('OSSRH_PASSWORD') {
      value: "pass:bots/technology.dataspacetck/oss.sonatype.org/gh-token-password",
    },
    orgs.newOrgSecret('OSSRH_USERNAME') {
      value: "pass:bots/technology.dataspacetck/oss.sonatype.org/gh-token-username",
    },
  ],
  _repositories+:: [
    newRepo('cvf') {
      description: "Compliance Verification Framework",
    },
  ],
}
