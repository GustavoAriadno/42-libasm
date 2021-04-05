NAME	=	libasm.a

ASM		=	nasm
ASFLAGS	=	-felf64

ARFLAGS	=	rcs

CC		=	clang
CCFLAGS	=	-Wall	\
			-Wextra	\
			-Werror	\
			-I${INCLUDE}

INCLUDE	=	./include
HEADER	=	${INCLUDE}/libasm.h

RM		=	rm -rf

SRC_DIR	=	src
vpath %.s ${SRC_DIR}
SRC		=	ft_strlen.s	\
			ft_strcpy.s	\
			ft_strcmp.s	\
			ft_write.s	\
			ft_read.s	\
			ft_strdup.s

OBJ_DIR	=	build
OBJ		=	$(patsubst %.s, ${OBJ_DIR}/%.o, ${SRC})

TEST	= tester

all		:	${NAME}

$(NAME)	:	${OBJ}
			${AR} ${ARFLAGS} $@ $^

${OBJ_DIR}/%.o	:	%.s
			mkdir -p $(OBJ_DIR)
			${ASM} ${ASFLAGS} $< -o $@

${TEST}	:	tests/tests_by_victor.c ${NAME}
			${CC} ${CCFLAGS} -o $@ $^

clean	:
			${RM} ${OBJ_DIR}

fclean	:	clean
			${RM} ${NAME} ${TEST}

re		:	fclean all

.PHONY	:	all tester clean fclean re
