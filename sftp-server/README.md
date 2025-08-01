# SFTP Server

A simple SFTP server setup using Docker Compose.

## Quick Start

1. **Start the server:**
   ```bash
   docker-compose up -d
   ```

2. **Connect to SFTP:**
   - Host: `localhost`
   - Port: `2222`
   - Username: `sftpuser`
   - Password: `password`

## Configuration

### Default User
- Username: `sftpuser`
- Password: `password`
- UID/GID: `1000:1000`

### Custom Users
To add more users, modify the `SFTP_USERS` environment variable in `docker-compose.yaml`:

```yaml
environment:
  - SFTP_USERS=user1:pass1:1001:1001,user2:pass2:1002:1002
```

### File Structure
```
sftp-server/
├── docker-compose.yaml
├── sftp-data/          # Shared files (created automatically)
└── README.md
```

## Usage Examples

### Using SFTP Client
```bash
# Connect using sftp command
sftp -P 2222 sftpuser@localhost

# Or using FileZilla
# Host: localhost
# Port: 2222
# Username: sftpuser
# Password: password
```

### Using rsync
```bash
rsync -avz -e "ssh -p 2222" /local/path/ sftpuser@localhost:/remote/path/
```

## Security Notes

- Change default passwords in production
- Consider using SSH keys instead of passwords
- Restrict access to specific directories if needed
- Use a reverse proxy for additional security

## Stopping the Server
```bash
docker-compose down
```

To remove all data:
```bash
docker-compose down -v
``` 