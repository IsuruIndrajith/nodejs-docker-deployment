# 🚀 Node.js Application Dockerization

This project demonstrates how to **containerize a Node.js application** using Docker.
It covers everything from building a simple Node.js server to creating a Docker image, running it as a container, and viewing logs.

---

## 🧠 Project Overview

This Node.js app creates a simple HTTP server that reads a text file (`message.txt`) and serves its contents on port **3000**.

When you visit [http://localhost:3000](http://localhost:3000), you’ll see the contents of the file served by the containerized Node.js app.

---

## 📂 Project Structure

```
nodejs-docker-app/
│
├── Dockerfile
├── package.json
├── index.js
├── message.txt
└── README.md
```

---

## 🧰 Step 1: Create a Simple Node.js Server

**index.js**

```js
const http = require("http");
const fs = require("fs");
const path = require("path");

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, "message.txt");

  fs.readFile(filePath, "utf8", (err, data) => {
    if (err) {
      res.writeHead(500, { "Content-Type": "text/plain" });
      res.end("Error reading file");
    } else {
      res.writeHead(200, { "Content-Type": "text/plain" });
      res.end(data);
    }
  });
});

server.listen(3000, () => {
  console.log("Server is running on port 3000");
});
```

**message.txt**

```
Hello from your Node.js Docker container!
```

---

## 🧾 Step 2: Create a `package.json`

```bash
npm init -y
```

This generates a default `package.json`.
(You can edit fields like `name`, `version`, and `description` later.)

---

## 🐳 Step 3: Create a Dockerfile

**Dockerfile**

```dockerfile
# Use official Node.js image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the app
COPY . .

# Expose the app port
EXPOSE 3000

# Start the Node.js server
CMD ["node", "index.js"]
```

---

## 🧱 Step 4: Build the Docker Image

Run this in the project folder:

```bash
docker build -t nodejs-docker-app .
```


<img width="1407" height="498" alt="Screenshot 2025-10-18 122342" src="https://github.com/user-attachments/assets/680d5049-4d2f-45cf-b0cc-71f9ad2d6988" />

---

## 🚢 Step 5: Verify the Built Image

```bash
docker images
```
<img width="748" height="123" alt="image" src="https://github.com/user-attachments/assets/33c0b7a5-dce5-4505-9b1b-015886721854" />

<img width="723" height="155" alt="Screenshot 2025-10-18 122352" src="https://github.com/user-attachments/assets/57bd38e0-c42d-4d3c-8fc8-260915fc3fcf" />

<img width="1610" height="587" alt="Screenshot 2025-10-18 122600" src="https://github.com/user-attachments/assets/7b31f0a7-0384-4fa3-ac67-6ad96a2cea0e" />

---

## 🏃 Step 6: Run the Docker Container

```bash
docker run -d -p 3000:3000 --name node-container nodejs-docker-app
```
*the container running in Docker Desktop or CLI.*
<img width="675" height="52" alt="image" src="https://github.com/user-attachments/assets/30e6853a-ee75-4c8d-8073-b8d47b67b01d" />

---

## 🔍 Step 7: Check Running Containers

```bash
docker ps
```

*Shows the running container list.*
<img width="1617" height="890" alt="Screenshot 2025-10-18 122617" src="https://github.com/user-attachments/assets/55558200-81c9-4f31-9b51-fc9383504807" />
*CLI*
<img width="1531" height="109" alt="image" src="https://github.com/user-attachments/assets/71372476-7f3c-4e92-8e0f-e70ebdd8901e" />

---

## 📜 Step 8: View Application Logs

```bash
docker logs node-container
```

*shows the logs.*
<img width="1149" height="116" alt="image" src="https://github.com/user-attachments/assets/4446c95a-fb6a-4dce-a6e2-3b63c2029995" />

---

## 🌐 Step 9: Test the Application

Visit:
👉 [http://localhost:3000](http://localhost:3000)

You should see:

```
Hello from your Node.js Docker container!
```

## 🧹 Step 10: Stop and Remove Containers

```bash
docker stop node-container
docker rm node-container
```

To remove the image:

```bash
docker rmi nodejs-docker-app
```

---

## ⚡ Commands Summary

| Action                  | Command                                                              |
| ----------------------- | -------------------------------------------------------------------- |
| Build Image             | `docker build -t nodejs-docker-app .`                                |
| List Images             | `docker images`                                                      |
| Run Container           | `docker run -d -p 3000:3000 --name node-container nodejs-docker-app` |
| View Running Containers | `docker ps`                                                          |
| View Logs               | `docker logs node-container`                                         |
| Stop Container          | `docker stop node-container`                                         |
| Remove Container        | `docker rm node-container`                                           |
| Remove Image            | `docker rmi nodejs-docker-app`                                       |

---

## 🧠 Key Takeaways

* The `Dockerfile` defines how to package your Node.js app into a container.
* The `EXPOSE 3000` tells Docker which port your app listens on.
* Using `docker build`, you convert your code into a **Docker image**.
* Running that image creates a **container**, a lightweight isolated runtime environment.

---

## 🏁 Conclusion

This project demonstrates the full process of taking a simple Node.js app and packaging it into a portable Docker container.
You can now deploy this same image anywhere — AWS, Azure, Railway, or even on another developer’s machine — and it’ll behave **exactly the same**.

> 💬 Feel free to fork this repo, add your screenshots, and extend it with features like environment variables, volume mounts, or multi-stage builds.

---

**Author:** [Isuru](https://github.com/)
**Project:** Node.js Docker App
**License:** MIT
