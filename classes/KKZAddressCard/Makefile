# AddressCard and AddressBook Makefile

CC := gcc
CFLAGS := -Wall -Werror -Wextra -framework Foundation -I./includes

HDRS := KKZAddressCard.h KKZAddressBook.h KKZAddressInfo.h
SRCS := KKZAddressCard.m KKZAddressBook.m KKZAddressInfo.m main.m
OBJS := KKZAddressCard.o KKZAddressBook.o KKZAddressInfo.o main.o
NAME := a.out

#vpath %.h ./includes
vpath %.m ./srcs

all : $(NAME)

$(NAME) : $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

$(OBJS) : $(SRCS)
	$(CC) -framework Foundation -I./includes -c $^

.PHONY : clean fclean re

clean :
	rm -f *.o

fclean : clean
	rm -f $(NAME)

re : fclean all