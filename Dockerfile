FROM ubuntu:latest as base

RUN apt update && apt upgrade -y

RUN apt install curl -y

RUN curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/aws-cloudformation/cloudformation-guard/main/install-guard.sh | sh

RUN cp -v ~/.guard/?/cfn-guard-v?-*-ubuntu-latest/cfn-guard /cfn-guard

ENTRYPOINT ["/cfn-guard"]

CMD ["--help"]