local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

local newRepo(repoName) = orgs.newRepo(repoName) {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_alerts_enabled: true,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      has_discussions: true,
      has_wiki: false,
      allow_auto_merge: true,
      dependabot_security_updates_enabled: true,
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      squash_merge_commit_message: "PR_TITLE",
      environments: [
        orgs.newEnvironment('github-pages') {
            branch_policies+: [
                "gh-pages"
            ],
            deployment_branch_policy: "selected"
        }
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          requires_pull_request: false, //sometimes maintainers need to push to main
          allows_force_pushes: true,
          dismisses_stale_reviews: false,
          required_approving_review_count: 0,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
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
    newRepo('dsp-tck') {
      aliases: ['cvf'],
      description: "Technology Compatibility Kit for the Dataspace Protocol",
    },
    newRepo('dcp-tck'){
      description: "Technology Compatibility Kit for the Decentralized Claims Protocol"
    },
    newRepo('tck-common'){
      description: "Shared code for all Technology Compatibility Kits and other projects"
    },
    newRepo('tck-build'){
      description: "Gradle Build customizations for the Technology Compatibility Kits"
    }
  ],
}
