{{- define "cubestore.common-env" -}}
{{- if .Values.config.logLevel }}
- name: CUBESTORE_LOG_LEVEL
  value: {{ .Values.config.logLevel | quote }}
{{- end }}
{{- if .Values.config.noUpload }}
- name: CUBESTORE_NO_UPLOAD
  value: {{ .Values.config.noUpload | quote }}
{{- end }}
- name: CUBESTORE_TELEMETRY
  value: {{ .Values.config.telemetry | quote }}
{{- if .Values.config.jobRunners }}
- name: CUBESTORE_JOB_RUNNERS
  value: {{ .Values.config.jobRunners | quote }}
{{- end }}
{{- if .Values.config.queryTimeout }}
- name: CUBESTORE_QUERY_TIMEOUT
  value: {{ .Values.config.queryTimeout | quote }}
{{- end }}
{{- if .Values.config.walSplitThreshold }}
- name: CUBESTORE_WAL_SPLIT_THRESHOLD
  value: {{ .Values.config.walSplitThreshold | quote }}
{{- end }}
{{- if .Values.cloudStorage.gcp.bucket }}
- name: CUBESTORE_GCS_BUCKET
  value: {{ .Values.cloudStorage.gcp.bucket | quote }}
{{- end }}
{{- if .Values.cloudStorage.gcp.subPath }}
- name: CUBESTORE_GCS_SUB_PATH
  value: {{ .Values.cloudStorage.gcp.subPath | quote }}
{{- end }}
{{- if .Values.cloudStorage.gcp.credentials }}
- name: CUBESTORE_GCP_CREDENTIALS
  value: {{ .Values.cloudStorage.gcp.credentials | quote }}
{{- else if .Values.cloudStorage.gcp.credentialsFromSecret }}
- name: CUBESTORE_GCP_CREDENTIALS
  valueFrom:
    secretKeyRef:
      name: {{ .Values.cloudStorage.gcp.credentialsFromSecret.name | required "cloudStorage.gcp.credentialsFromSecret.name is required" }}
      key: {{ .Values.cloudStorage.gcp.credentialsFromSecret.key | required "cloudStorage.gcp.credentialsFromSecret.key is required" }}
{{- end }}
{{- if .Values.cloudStorage.aws.accessKeyID }}
- name: CUBESTORE_AWS_ACCESS_KEY_ID
  value: {{ .Values.cloudStorage.aws.accessKeyID | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.secretKey }}
- name: CUBESTORE_AWS_SECRET_ACCESS_KEY
  value: {{ .Values.cloudStorage.aws.secretKey | quote }}
{{- else if .Values.cloudStorage.aws.secretKeyFromSecret }}
- name: CUBESTORE_AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.cloudStorage.aws.secretKeyFromSecret.name | required "cloudStorage.aws.secretKeyFromSecret.name is required" }}
      key: {{ .Values.cloudStorage.aws.secretKeyFromSecret.key | required "cloudStorage.aws.secretKeyFromSecret.key is required" }}
{{- end }}
{{- if .Values.cloudStorage.aws.bucket }}
- name: CUBESTORE_S3_BUCKET
  value: {{ .Values.cloudStorage.aws.bucket | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.region }}
- name: CUBESTORE_S3_REGION
  value: {{ .Values.cloudStorage.aws.region | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.subPath }}
- name: CUBESTORE_S3_SUB_PATH
  value: {{ .Values.cloudStorage.aws.subPath | quote }}
{{- end }}
{{- if .Values.cloudStorage.aws.refreshCredsEveryMinutes }}
- name: CUBESTORE_AWS_CREDS_REFRESH_EVERY_MINS
  value: {{ .Values.cloudStorage.aws.refreshCredsEveryMinutes | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.accessKeyID }}
- name: CUBESTORE_MINIO_ACCESS_KEY_ID
  value: {{ .Values.cloudStorage.minio.accessKeyID | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.secretKey }}
- name: CUBESTORE_MINIO_SECRET_ACCESS_KEY
  value: {{ .Values.cloudStorage.minio.secretKey | quote }}
{{- else if .Values.cloudStorage.minio.secretKeyFromSecret }}
- name: CUBESTORE_MINIO_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Values.cloudStorage.minio.secretKeyFromSecret.name | required "cloudStorage.minio.secretKeyFromSecret.name is required" }}
      key: {{ .Values.cloudStorage.minio.secretKeyFromSecret.key | required "cloudStorage.minio.secretKeyFromSecret.key is required" }}
{{- end }}
{{- if .Values.cloudStorage.minio.bucket }}
- name: CUBESTORE_MINIO_BUCKET
  value: {{ .Values.cloudStorage.minio.bucket | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.region }}
- name: CUBESTORE_MINIO_REGION
  value: {{ .Values.cloudStorage.minio.region | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.subPath }}
- name: CUBESTORE_MINIO_SUB_PATH
  value: {{ .Values.cloudStorage.minio.subPath | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.endpoint }}
- name: CUBESTORE_MINIO_SERVER_ENDPOINT
  value: {{ .Values.cloudStorage.minio.endpoint | quote }}
{{- end }}
{{- if .Values.cloudStorage.minio.credentialsRefreshEveryMinutes }}
- name: CUBESTORE_MINIO_CREDS_REFRESH_EVERY_MINS
  value: {{ .Values.cloudStorage.minio.credentialsRefreshEveryMinutes | quote }}
{{- end }}
{{- if .Values.metrics.format }}
- name: CUBESTORE_METRICS_FORMAT
  value: {{ .Values.metrics.format | quote }}
{{- end }}
{{- if .Values.metrics.address }}
- name: CUBESTORE_METRICS_ADDRESS
  value: {{ .Values.metrics.address | quote }}
{{- end }}
{{- if .Values.metrics.port }}
- name: CUBESTORE_METRICS_PORT
  value: {{ .Values.metrics.port | quote }}
{{- end }}
{{- end }}
