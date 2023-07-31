echo "Building Docker Image..."
docker build -t wjojf/test-app:latest .

echo "Pushing Docker Image..."
docker push wjojf/test-app:latest

echo "Starting k8s..."

kubectl apply -f api.yaml
kubectl port-forward service/test-app-service 8080
kubectl apply -f autoscale.yaml