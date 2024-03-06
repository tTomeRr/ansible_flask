apiVersion: apps/v1
kind: Deployment
metadata:
  name: postgresql
  namespace: artifactory
spec:
  replicas: 1
  selector:
    matchLabels:
      app: postgresql
  template:
    metadata:
      labels:
        app: postgresql
    spec:
      containers:
        - name: postgresql
          image: postgres:14
          ports:
            - containerPort: 5432
          env:
            - name: POSTGRES_DB
              value: artifactory
            - name: POSTGRES_USER
              value: artifactory
            - name: POSTGRES_PASSWORD
              value: passw0rd
          volumeMounts:
            - name: postgresql-data
              mountPath: /var/lib/postgresql/data
      volumes:
        - name: postgresql-data
          persistentVolumeClaim:
            claimName: postgresql
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: postgresql
  namespace: artifactory
spec:
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
