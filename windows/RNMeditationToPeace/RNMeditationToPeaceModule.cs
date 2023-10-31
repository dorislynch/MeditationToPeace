using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Meditation.To.Peace.RNMeditationToPeace
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNMeditationToPeaceModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNMeditationToPeaceModule"/>.
        /// </summary>
        internal RNMeditationToPeaceModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNMeditationToPeace";
            }
        }
    }
}
