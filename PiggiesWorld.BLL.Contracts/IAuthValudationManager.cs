namespace PiggiesWorld.BLL.Contracts
{
    public interface IAuthValudationManager
    {
        bool IsValidLogin(string login);
        bool IsValidPassword(string login);
    }
}
