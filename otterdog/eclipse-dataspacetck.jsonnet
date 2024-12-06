local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

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
    orgs.newOrgSecret('GRADLE_PUBLISH_KEY') {
      value: "pass:bots/technology.dataspacetck/plugins.gradle.org/gradle-publish-key",
    },
    orgs.newOrgSecret('GRADLE_PUBLISH_SECRET') {
      value: "pass:bots/technology.dataspacetck/plugins.gradle.org/gradle-publish-secret",
    },
  ],
  _repositories+:: [
    orgs.newRepo('dcp-tck') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Technology Compatibility Kit for the Decentralized Claims Protocol",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_wiki: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('dsp-tck') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Technology Compatibility Kit for the Dataspace Protocol",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_wiki: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tck-build') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Gradle Build customizations for the Technology Compatibility Kits",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_wiki: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
    orgs.newRepo('tck-common') {
      allow_auto_merge: true,
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Shared code for all Technology Compatibility Kits and other projects",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/",
      has_discussions: true,
      has_wiki: false,
      private_vulnerability_reporting_enabled: true,
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
}
