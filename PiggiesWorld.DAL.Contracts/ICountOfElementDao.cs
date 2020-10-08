namespace PiggiesWorld.DAL.Contracts
{
    public interface ICountOfElementDao
    {
        int GetCount(bool submitedOnly);
    }
}
