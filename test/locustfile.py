from locust import HttpUser, task


class LoadTesting(HttpUser):
    @task
    def hello_world(self):
        self.client.post("/", json={})