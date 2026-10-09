# Upstream

| | |
| --- | --- |
| Project | CloudFoxable |
| Repository | https://github.com/BishopFox/cloudfoxable |
| Version | main (no releases) |
| Commit | fc49b7f637268031515ced9fee4b643d3e68db67 |
| Licence | MIT |

`app/` is that commit, unchanged, without its Git history, except three files left out because
GitHub's push protection refuses the example and planted credentials they hold (an AWS key pair, a
Slack token); none is read by the Terraform this lab applies:
`aws/challenges/Search 1/cheatsheet.md` (a walkthrough; read it upstream),
`aws/challenges/white_rabbit/data/templates/test/testfile` (an unused test file) and
`aws/modules/disabled/challenge-apprunner-.tf` (a module upstream doesn't load). Isoloom applies its AWS root module
`app/aws/` directly, with the variables of upstream's `terraform.tfvars.example` in `isoloom.yml`:
the "low or no cost" challenges on, the costly and GitHub ones off, region us-east-1. A run writes
Lambda archives (`lambda_function.zip`) under `app/aws/challenges/*/data/`: they are ignored. To
update, replace `app/` with a newer commit and change this table.
