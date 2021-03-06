# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmondell <mmondell@student.42quebec.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/08/31 08:51:26 by mmondell          #+#    #+#              #
#    Updated: 2022/05/27 09:40:40 by mmondell         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#*#######################################################
##*          ERASE COMMENTS FOR BONUS PARTS            ##
#*#######################################################

## -----  NAME OF THE PROGRAMM ----- ##
NAME 			= 

## ----- NAME OF THE BONUS PART ----- ##
B_NAME			= 

## ----- CHOOSE COMPILER AND FLAGS ----- ##
CC				= gcc
CFLAGS			= -Wall -Wextra -Werror

## ----- PATH TO FOLDERS ----- ##
SRCS_DIR		= srcs/
#*B_SRCS_DIR		= 

OBJ_DIR			= obj/

INCLUDE_DIR		= includes/

LIBFT_DIR		= libft/

## ----- SOURCE FILES ----- ##
SRCS_FILES		= 
## ----- BONUS SOURCE FILES ----- ##
#*B_SRCS_FILES	= 

## ----- .C TO .O CONVERT ----- ##
OBJ_FILES		= $(SRCS_FILES:.c=.o)
#*B_OBJ_FILES		= $(B_SRCS_FILES:.c=.o)

## ----- ADDPREFIX TO FILES ----- ##
# MAIN PROGRAMM #
SRCS			= $(addprefix $(SRCS_DIR), $(SRCS_FILES))
OBJS			= $(addprefix $(OBJ_DIR), $(OBJ_FILES))
VPATH			= $(SRCS_DIR) #$(B_SRCS_DIR)

# BONUS PART #
#*B_SRCS			= $(addprefix $(B_SRCS_DIR), $(B_SRCS_FILES))
#*B_OBJS			= $(addprefix $(OBJ_DIR), $(B_OBJ_FILES))

#--------------------------------------------------------------#

## ----- TOOLS AND COLORS ----- ##
RM				= rm -Rf
NO_PRINT		= --no-print-directory
RED 			= \033[31m
GREEN 			= \033[32m
YELLOW 			= \033[33m
BLUE 			= \033[34m
PINK 			= \033[35m
AQUA 			= \033[36m
GREY 			= \033[37m
UNDERLINE 		= \033[4m
NORMAL 			= \033[0m

LIBFT			= $(MAKE) bonus -C $(LIBFT_DIR)

## ----- ALL ACTION DEPENDENCIES AND RECIPE FOR MAIN PROGRAM ----- ##
all: obj $(NAME)
	@echo "$(GREEN)Compilation Completed Successfully$(NORMAL)"

$(OBJ_DIR)%.o:%.c
	$(CC) $(CFLAGS) -I$(LIBFT_DIR) -I$(INCLUDE_DIR) -o $@ -c $<
	@printf "\033[93m▓▓▓\033[0m"

$(NAME): $(OBJS)
	$(LIBFT)
	$(CC) $(OBJS) -L$(LIBFT_DIR) -lft -o $(NAME)
	@echo "\\n\033[32;1m\nProgram is Ready\033[0m\\n"

debug: CFLAGS += -g -fstandalone-debug -fno-limit-debug-info
debug: all

redebug : fclean debug

# Optimization flag for a small performance boost to your programm
# If you have errors compiling with this flag reduce to -O1 or just compile using make
release: CFLAGS += -O2
release: all

obj:
	@mkdir -p $(OBJ_DIR)
	@echo "\033[34;1mCreating Object Directory\n\033[0m"
	@printf "\033[32;1m\nCompiling with: \033[38;5;208m$(CFLAGS)\033[0m\\n\\n"

## ----- ACTIONS FOR THE BONUS PART ----- ##
#*bonus: $(B_NAME)
#*	@echo "$(GREEN)Bonus Files Compiled!$(NORMAL)"
#*
#*$(B_NAME): $(B_OBJS)
#*	$(LIBFT)
#*	$(CC) $(B_OBJS) -L$(LIBFT_DIR) -lft -o $(B_NAME)
	
## ----- CLEAN COMMANDS ----- ##
clean:
	$(RM) $(OBJS) $(B_OBJS)
	@make -C $(LIBFT_DIR) clean

fclean: clean
	@rm -f $(NAME)
#*	$(RM) $(B_NAME) $(OBJ_DIR)
	@make -C $(LIBFT_DIR) fclean

re: fclean all bonus

.PHONY: all clean fclean re
