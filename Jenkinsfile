
pipeline {
    agent any

    stages {
        stage('Clear work dir befor') {
            steps {
                deleteDir()
            }
        }
        stage('Sync Git') {
            steps {
                dir('ansible-vector') {
                    git branch: 'main', url: 'https://github.com/InfernoFeniks/ansible-vector.git'
                }
            }
        }
        stage('Install molecule') {
            steps {
                sh "pip3 install 'molecule==3.5.2' 'molecule_docker' 'molecule_podman' 'chardet==5.0.0' 'charset_normalizer==2.0.12' 'urllib3==1.26.16'"
                sh 'pip3 install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com cryptography==36.0.2'
                sh "pip3 install 'requests'"
            }
        }
        stage('Check molecule') {
            steps {
                sh "molecule --version"
                sh "ansible --version"
                sh "python3 -V"
            }
        }
        stage('RUN-parallel-TEST') {
            parallel {
                stage('Start molecule test for docker') {
                    steps {
                        dir('ansible-vector') {
                            sh "molecule test -s docker --destroy always"
                        }
                    }
                }
                stage('Start molecule test for podman') {
                    steps {
                        dir('ansible-vector') {
                            sh "molecule test -s podman --destroy always"
                        }
                    }
                }
            }
        }
        stage('Clear work dir after') {
            steps {
                dir('ansible-vector') {
                    deleteDir()
                }
            }
        }
    }
}
