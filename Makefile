.PHONY: help local-venv local-run docker-build kind-create kind-load kind-deploy kind-clean clean

help:
	@echo "Available targets:"
	@echo "  make local-venv    Create a Python virtual environment and install dependencies"
	@echo "  make local-run     Run the FastAPI app locally"
	@echo "  make docker-build  Build the Docker image for local or cloud deployment"
	@echo "  make kind-create   Create a kind cluster using kind-config.yaml"
	@echo "  make kind-load     Load the local Docker image into the kind cluster"
	@echo "  make kind-deploy   Deploy the Helm chart to the kind cluster"
	@echo "  make kind-clean    Remove the kind cluster and uninstall the release"
	@echo "  make clean         Remove Python build artifacts"

local-venv:
	python -m venv .venv
	@if [ -f .venv/Scripts/pip ]; then \
	  .venv/Scripts/pip install -r requirements.txt; \
	else \
	  .venv/bin/pip install -r requirements.txt; \
	fi

local-run:
	@echo "Starting FastAPI locally on port 8000"
	uvicorn src.app.main:app --reload --host 0.0.0.0 --port 8000

docker-build:
	docker build -t online-store:local .

kind-create:
	kind create cluster --name kind --config kind-config.yaml

kind-load:
	kind load docker-image online-store:local --name kind

kind-deploy:
	helm upgrade --install online-store deploy/charts/online-store --set image.repository=online-store --set image.tag=local

kind-clean:
	helm uninstall online-store || true
	kind delete cluster --name kind || true

clean:
	rm -rf .venv __pycache__
