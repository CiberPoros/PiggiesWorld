namespace PiggiesWorld.BLL.Contracts
{
    public interface IValudationManager
    {
        bool IsValidLogin(string login);
        bool IsValidPassword(string login);

        bool IsValidPhoneNumber(string phone);
    }
}
