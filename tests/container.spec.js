const path = require("path");
const axios = require("axios");
const { DockerComposeEnvironment } = require("testcontainers");

describe("qBittorrent container should", () => {
    var container;
    var composeEnvironment;

    beforeAll(async () => {
        const composeFilePath = path.resolve(__dirname, "..");

        composeEnvironment = await new DockerComposeEnvironment(composeFilePath, "docker-compose.yml")
            .withBuild()
            .up();

        container = composeEnvironment.getContainer("image_1");
    });

    afterAll(async () => {
        await composeEnvironment.down();
    });

    it("Listen on configured port", async () => {
        // Arrange
        const url = `http://localhost:${container.getMappedPort(8080)}/`

        // Act
        const response = await axios.get(url);

        // Assert
        expect(response.status).toBe(200);
    });
});