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
      environments: [
        orgs.newEnvironment('github-pages') {
            branch_policies+: [
                "gh-pages"
            ],
            deployment_branch_policy: "selected"
        }
      ],
};

orgs.newOrg('technology.dataspacetck', 'eclipse-dataspacetck') {
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
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/technology.dataspacetck/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/technology.dataspacetck/central.sonatype.org/token-username",
    },
    orgs.newOrgSecret('GRADLE_PUBLISH_KEY') {
      value: "pass:bots/technology.dataspacetck/plugins.gradle.org/gradle-publish-key",
    },
    orgs.newOrgSecret('GRADLE_PUBLISH_SECRET') {
      value: "pass:bots/technology.dataspacetck/plugins.gradle.org/gradle-publish-secret",
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
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}