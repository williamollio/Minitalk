CC = GCC

NAME = minitalk

CFLAGS = -Wall -Wextra -Werror

INCLUDES = minitalk.h

SERVER = server

CLIENT = client

SERVER_SRC = server.c

CLIENT_SRC = client.c

SERVER_OBJ = $(SERVER_SRC:.c=.o)

CLIENT_OBJ = $(CLIENT_SRC:.c=.o)

LIBFT_PATH = ./libft/

LIBFT  = libft.a

# Bonus part

SERVER_SRC_BONUS = server_bonus.c

CLIENT_SRC_BONUS = client_bonus.c

SERVER_OBJ_BONUS = $(SERVER_SRC_BONUS:.c=.o)

CLIENT_OBJ_BONUS = $(CLIENT_SRC_BONUS:.c=.o)

$(NAME) : $(SERVER) $(CLIENT)

all: subsystem $(SERVER) $(CLIENT)

subsystem :
	make -C ./libft
	cp ./libft/libft.a libft.a

server: subsystem $(SERVER_OBJ)
	$(CC) $(CFLAGS) $(SERVER_OBJ) $(LIBFT) -o $(SERVER)

client: subsystem $(CLIENT_OBJ)
	$(CC) $(CFLAGS) $(CLIENT_OBJ) $(LIBFT) -o $(CLIENT)

bonus: subsystem $(SERVER_OBJ_BONUS) $(CLIENT_OBJ_BONUS)
	$(CC) $(CFLAGS) $(SERVER_OBJ_BONUS) $(LIBFT) -o $(SERVER)
	$(CC) $(CFLAGS) $(CLIENT_OBJ_BONUS) $(LIBFT) -o $(CLIENT)

clean:
	rm -f $(SERVER_OBJ) $(SERVER_OBJ_BONUS)
	rm -f $(CLIENT_OBJ) $(CLIENT_OBJ_BONUS)

fclean: clean
	rm -f $(LIBFT_PATH)*.o
	rm -f $(LIBFT_PATH)libft.a
	rm -f $(LIBFT)
	rm -f $(SERVER)
	rm -f $(CLIENT)

re: fclean all
