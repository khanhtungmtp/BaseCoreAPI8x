
namespace API.Dtos.User
{
    public class UserFilter
    {
        public int UserId { get; set; }
        public string Gender { get; set; }
        public int MinAge { get; set; } = 18;
        public int MaxAge { get; set; } = 99;
        public string OrderBy { get; set; }
    }

    public class UserLikes
    {
        public int UserId { get; set; }
        public bool Likers { get; set; } = false;
        public bool Likees { get; set; } = false;
    }
}