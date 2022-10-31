
using API.Helpers.Utilities;
using API.Models;

namespace API._Repositories.Interfaces
{
    public interface IDatingRepository
    {
        void Add<T>(T entity) where T : class;
        void Delete<T>(T entity) where T : class;
        Task<bool> SaveAll();
        Task<PaginationUtilities<User>> GetUsers(PaginationParams paginationParams);
        Task<User> GetUser(int id);
        Task<Photo> GetPhoto(int id);
        Task<Photo> GetMainPhotoForUser(int userid);
    }
}