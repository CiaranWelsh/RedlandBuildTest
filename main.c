#include <redland.h>


/* one prototype needed */
int main(int argc, char *argv[]);


int main(int argc, char *argv[]) {
    librdf_world *world;
    world = librdf_new_world();
    librdf_free_world(world);

    return (0);
}