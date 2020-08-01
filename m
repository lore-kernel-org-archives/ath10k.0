Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1jmk-0002ZN-82
 for ath10k@lists.infradead.org; Sat, 01 Aug 2020 05:10:20 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1596220042-2778-1-git-send-email-pillair@codeaurora.org>
 <c6c5b3c5-f862-9cee-6863-24f666cc28f5@gmail.com>
In-Reply-To: <c6c5b3c5-f862-9cee-6863-24f666cc28f5@gmail.com>
Subject: RE: [PATCH v2 0/3]
Date: Sat, 1 Aug 2020 10:40:03 +0530
Message-ID: <000701d667c2$0782fe70$1688fb50$@codeaurora.org>
MIME-Version: 1.0
Content-Language: en-us
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: 'Florian Fainelli' <f.fainelli@gmail.com>, ath10k@lists.infradead.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org, davem@davemloft.net, kvalo@codeaurora.org



> -----Original Message-----
> From: Florian Fainelli <f.fainelli@gmail.com>
> Sent: Saturday, August 1, 2020 12:17 AM
> To: Rakesh Pillai <pillair@codeaurora.org>; ath10k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> kvalo@codeaurora.org; davem@davemloft.net; kuba@kernel.org;
> netdev@vger.kernel.org
> Subject: Re: [PATCH v2 0/3]
> 
> On 7/31/20 11:27 AM, Rakesh Pillai wrote:
> > The history recording will be compiled only if
> > ATH10K_DEBUG is enabled, and also enabled via
> > the module parameter. Once the history recording
> > is enabled via module parameter, it can be enabled
> > or disabled runtime via debugfs.
> 
> Why not use trace prints and retrieving them via the function tracer?
> This seems very ad-hoc.

Tracing needs to be enabled to capture the events.
But these events can be turned on in some kind of a debug build and capture the history to help us debug in case there is a crash.
It wont even allocate memory if not enabled via module parameter.

> 
> >
> > ---
> > Changes from v1:
> > - Add module param and debugfs to enable/disable history recording.
> >
> > Rakesh Pillai (3):
> >   ath10k: Add history for tracking certain events
> >   ath10k: Add module param to enable history
> >   ath10k: Add debugfs support to enable event history
> >
> >  drivers/net/wireless/ath/ath10k/ce.c      |   1 +
> >  drivers/net/wireless/ath/ath10k/core.c    |   3 +
> >  drivers/net/wireless/ath/ath10k/core.h    |  82 ++++++++++++
> >  drivers/net/wireless/ath/ath10k/debug.c   | 207
> ++++++++++++++++++++++++++++++
> >  drivers/net/wireless/ath/ath10k/debug.h   |  75 +++++++++++
> >  drivers/net/wireless/ath/ath10k/snoc.c    |  15 ++-
> >  drivers/net/wireless/ath/ath10k/wmi-tlv.c |   1 +
> >  drivers/net/wireless/ath/ath10k/wmi.c     |  10 ++
> >  8 files changed, 393 insertions(+), 1 deletion(-)
> >
> 
> 
> --
> Florian


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
