using PiggiesWorld.BLL.Contracts;

namespace PiggiesWorld.BLL.Logic
{
    public class AuthValidationManager : IAuthValudationManager
    {
        public bool IsValidLogin(string login) => IsValidString(login);
        public bool IsValidPassword(string password) => IsValidString(password);

        private bool IsValidString(string inputStr)
        {
            if (inputStr is null)
                return false;

            if (inputStr.Length < 5 && inputStr.Length > 15)
                return false;

            foreach (var c in inputStr)
            {
                if (!(IsCorrectSymbol(c)))
                    return false;
            }

            return true;
        }

        private bool IsCorrectSymbol(char c)
        {
            if (c >= 'a' && c <= 'z') // eng
                return true;

            if (c >= 'A' && c <= 'Z') // eng
                return true;

            if (c >= 'а' && c <= 'я') // rus 
                return true;

            if (c >= 'А' && c <= 'Я') // rus
                return true;

            if (c >= '0' && c <= '9')
                return true;

            return false;
        }
    }
}
