/*
	ft_basename.c
	my own version of the
	standard UNIX tool basename
*/

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#ifdef DEBUG
static void	 _ft_assert(const char *file, unsigned line); /* prototype */
#define ASSERT(expr) (expr) ? (void)(expr) : _ft_assert(__FILE__, __LINE__)
#else
#define ASSERT(expr) (void)(expr)
#endif

static char	*ft_strchr(const char *s, int c);
static char	*ft_putslash(void);
static char	*ft_basename(const char *path);

int	main(int argc, char **argv)
{
  char	*base;

  if (argc != 2)
    {
      fprintf(stderr, "ft_basename usage: ft_basename path.\n");
      return (1);
    }
  base = ft_basename(argv[1]);
  if (base)
    {
      printf("%s", base);
      free(base);
    }
  printf("\n");
  return (0);
}

static char	*ft_strchr(const char *s, int c)
{
  char	*ret;

  ret = (char *)(s - 1);
  while (*++ret)
    if (*ret == (char)c)
      return (ret);
  return (NULL);
}

static void	_ft_assert(const char *file, unsigned line)
{
  fprintf(stderr, "assertion failed: file: %s line: %u\n", file, line);
  exit(1);
}

static char	*ft_putslash(void)
{
  char	*out;

  out = malloc(2 * sizeof(char));
  ASSERT(out != NULL);
  out[0] = '/';
  out[1] = '\0';
  return (out);
}

static char	*ft_basename(const char *path)
{
  char		*base;
  char		*itr;
  char		*pend;

  if (!path || !*path)
    return (NULL);
  itr = path;
  itr += strlen(path) - 1;
  while (itr > path && *itr == '/')
    --itr;
  if (itr == path)
    return (ft_putslash());
  pend = itr + 1;
  while (itr > path && *itr != '/')
    --itr;
  if (*itr == '/')
    ++itr;
  base = malloc((pend - itr + 1) * sizeof(char));
  ASSERT(base != NULL);
  strlcpy(base, itr, pend - itr + 1);
  return (base);
}
