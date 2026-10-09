# CloudFoxable

[CloudFoxable](https://github.com/BishopFox/cloudfoxable) by Seth Art and Bishop Fox: a gamified
cloud hacking sandbox, its challenges scored at [cloudfoxable.bishopfox.com](https://cloudfoxable.bishopfox.com).
This repository runs its AWS challenges with [Isoloom](https://www.isoloom.com) in your own AWS
account: [`isoloom.yml`](isoloom.yml) describes the cloud services, and CloudFoxable sits
unchanged in [`app/`](app) (the Terraform root is `app/aws/`).

| Challenges (on) | Services |
| --- | --- |
| It's a secret, It's another secret, Backwards | SSM parameters, Secrets Manager, IAM roles |
| Furls 1, Furls 2 | Lambda function URLs |
| The topic is exposure, The topic is execution, Middle | SNS, SQS, Lambda, EventBridge Scheduler |
| Root, Needles, Pain, Segue | IAM roles and trusts, CloudFormation, S3 |

The costly challenges (Bastion, Variable, Wyatt, Double Tap, White Rabbit, Search 1 and 2) and the
GitHub one (Trust me) stay off, as in upstream's example configuration; switch one on with
`-s cloud.vars.<name>_enabled=true` (see `app/aws/variables.tf` and upstream's cost table).

Cost while it runs: well under $0.01 an hour (a few Secrets Manager secrets; the rest is billed per
request).

## Run it

Use an AWS account with nothing else in it, signed in with the AWS CLI (`aws login`, the
`default` profile), and Terraform installed.

```bash
isoloom run cloud-services     # about 3 minutes; prints your starting credentials
isoloom test cloud-services
isoloom down cloud-services
```

The challenges, their hints and the scoreboard are at
[cloudfoxable.bishopfox.com](https://cloudfoxable.bishopfox.com). A Lambda's own log group
(`/aws/lambda/executioner`) isn't Terraform's: delete it after `down`.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as CloudFoxable ([LICENSE](LICENSE)). This lab is deliberately vulnerable: deploy it only in
an account you use for nothing else, and destroy it when you are done.
