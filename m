Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d8UJL-0005TZ-EO
 for ath10k@lists.infradead.org; Wed, 10 May 2017 16:18:01 +0000
Subject: Re: [v2,1/3] ath9k: Support channels in licensed bands
References: <20170323133048.30062-2-sw@simonwunderlich.de>
 <1811221.G4Vz0DPyQ8@prime>
 <12133a0e-b030-5b21-8de1-3bf7334d47df@fit.fraunhofer.de>
 <1863250.VEhGCjvYY0@prime>
 <CAJ-Vmonxt8BmpL+mM07f4-TLU+LKW+eg1Ri3twcrFOKWp9NXLw@mail.gmail.com>
 <CAKR_QV+0cPXbiScO3cS52R97o=wGh4+zgmqaRM7QbotmEJD51Q@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <a45f00f8-0a6f-5e8d-f6f3-1c9a898410e2@candelatech.com>
Date: Wed, 10 May 2017 09:17:37 -0700
MIME-Version: 1.0
In-Reply-To: <CAKR_QV+0cPXbiScO3cS52R97o=wGh4+zgmqaRM7QbotmEJD51Q@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tom Psyborg <pozega.tomislav@gmail.com>, Adrian Chadd <adrian@freebsd.org>
Cc: Simon Wunderlich <sw@simonwunderlich.de>, Julian Calaby <julian.calaby@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath9k-devel <ath9k-devel@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Steve deRosier <derosier@gmail.com>, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Kalle Valo <kvalo@codeaurora.org>

On 05/10/2017 03:30 AM, Tom Psyborg wrote:
>
>
> On 9 May 2017 at 19:50, Adrian Chadd <adrian@freebsd.org <mailto:adrian@freebsd.org>> wrote:
>
>
>     (Note note: some of those channels have non-megahertz boundaries,
>     which means ... yeah, hello inter-operability boundaries. Hilarious.)
>
>
>
>     -adrian
>
>
>
> From what I can tell, it seems like as long as your both points are configured with identical settings, you can use any channel/frequency/bandwidth combination
> that hardware supports. Possibly even 802.11ac at 2.4 GHz if we got more than 100MHz of bandwidth from 2.4 to 2.5 GHz. The solution i've made myself doesn't
> include all available channels but can serve as an example: https://forum.openwrt.org/viewtopic.php?pid=353870#p353870 primary/sec HT channel option should also
> be further extended.
>
> Cheers, Tom

I've successfully used 802.11ac VHT-40 on 2.4Ghz band with ath10k...it just requires a few small changes
in the mac80211 stack to allow it to be configured....just FYI.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
