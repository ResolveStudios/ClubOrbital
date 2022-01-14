using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Okashi.PlaylistManager.Editors
{
    public class TaskManager
    {
        internal static void Run(Action action) => Task.Run(action).Wait();
        internal static void RunAsync(Action action) => Task.Run(action).ConfigureAwait(false);
        internal static void RunOnMainThread(Action action) => tasks.Add(action);


        private static List<Action> tasks = new List<Action>();
        internal static void Update()
        {
            if (tasks.Count > 0)
            {
                tasks[0]?.Invoke();
                tasks.RemoveAt(0);
            }
        }
    }
}
