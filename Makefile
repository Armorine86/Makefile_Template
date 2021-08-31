## ---- NAME IS HOW THE GENERATED FILE WILL BE CALLED ---- ##
NAME 		= 

## ---- ALL PATHS TO NEEDED DIRECTORIES ---- ##
LIBFT		= ft
LIBFTDIR	= ./libft
MAKELIBFT	= @$(MAKE) -C $(LIBFTDIR)

SRC			= ./srcs
INC			= ./includes
OBJ			= ./obj

## ---- ALL THE FILES NEEDED FOR COMPILATION ---- ##
CFILES		=
HFILES		= 
OBJ_FILES	= $(CFILES:.c=.o) # takes all .c files and makes them objects files.

## ---- SHORTCUT VARIABLES FOR SRC FILES AND OBJ FILES ---- ##
SRCS		= $(addprefix $(SRC)/, $(CFILES))  # addprefix append $(SRC) or ./srcs before all CFILES
OBJS		= $(addprefix $(OBJ)/, $(OBJ_FILES))
HEADERS		= $(addprefix $(INC)/, $(HFILES))

## ---- SPECIFY THE COMPILER TO USE AND THE FLAGS ---- ##
CC			= gcc # or clang
CFLAGS		= -Wall -Wextra -Werror -g

## ---- TOOLS ---- ##
RM			= rm -rf
NAME		= norminette

## ---- COLORS ---- ##
RED			= \033[31m
GREEN		= \033[32m
BLUE		= \033[34m

## ---- TARGET  :  DEPENDENCIES ---- ##
$(OBJ)/%.o: $(SRC)/%.c  # .o files in OBJ directory are dependent or .c files in SRC directory
			$(CC) $(CFLAGS) -I$(LIBFTDIR) -I$(INC) -c $< -o $@

$(NAME):	$(OBJ) $(OBJS)  # Depends on .o files in the obj folder
			$(MAKELIBFT)
			$(CC) $(OBJS) -L$(LIBFTDIR) -l$(LIBFT) -o $(NAME)

$(OBJ):
			@mkdir -p $(OBJ)

## ---- ACTIONS WITH MAKE IN THE TERMINAL ---- ##
all:		$(NAME)    # Typing make in terminal compiles the programm using the recipe

clean:
			$(MAKELIBFT) fclean
			@$(RM) $(OBJS)

fclean:		clean
			@$(RM) $(NAME)

re:			fclean all

norme:

			$(MAKELIBFT) norme
			$(NM) $(SRCS) $(HEADERS)

.PHONY:		all clean fclean re norme