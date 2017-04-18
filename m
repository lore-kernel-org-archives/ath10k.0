Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1d0Wdx-0002Kc-HI
 for ath10k@lists.infradead.org; Tue, 18 Apr 2017 17:10:23 +0000
Subject: Re: [v2,1/3] ath9k: Support channels in licensed bands
References: <20170323133048.30062-2-sw@simonwunderlich.de>
 <20170418143654.8AC0A60FAA@smtp.codeaurora.org> <3170657.DNPqgEf8fi@prime>
 <CALLGbRK2d1wZpfLnXu_UDWxVPA9LvejFyEFpzMub56uLH0+DTw@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <d4acedac-e28c-4c1c-d112-40557d52f3a2@candelatech.com>
Date: Tue, 18 Apr 2017 10:09:59 -0700
MIME-Version: 1.0
In-Reply-To: <CALLGbRK2d1wZpfLnXu_UDWxVPA9LvejFyEFpzMub56uLH0+DTw@mail.gmail.com>
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
To: Steve deRosier <derosier@gmail.com>, Simon Wunderlich <sw@simonwunderlich.de>
Cc: Julian Calaby <julian.calaby@gmail.com>, linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com, ath10k@lists.infradead.org, Mathias Kretschmer <mathias.kretschmer@fit.fraunhofer.de>, Kalle Valo <kvalo@codeaurora.org>

On 04/18/2017 09:33 AM, Steve deRosier wrote:
> Hi,
>
> On Tue, Apr 18, 2017 at 7:50 AM, Simon Wunderlich <sw@simonwunderlich.de <mailto:sw@simonwunderlich.de>> wrote:
>
>     Hi,
>
>     On Tuesday, April 18, 2017 2:36:54 PM CEST Kalle Valo wrote:
>     > Simon Wunderlich <sw@simonwunderlich.de <mailto:sw@simonwunderlich.de>> wrote:
>     > > From: Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     > >
>     > > Many chips support channels in licensed bands. Add support for those,
>     > > along with a corresponding kernel config option to disable them by
>
> ...
>
>     > I am not sure that we should support unlicensed bands in Linux and hence
>     > hesitant to apply these. My view is that due to regulatory restrictions we
>     > should not make it too easy to use unlicensed bands. But I'm open for
>     > discussion, this is a challenging area and my knowledge here is limited.
>
> ...
>
>
>     In my personal view, we have quite a few obstacles which I consider "enough",
>     but would be interesting to hear others opinions ...
>
>
> I'll throw in my 2-cents. This patch is treading on very dangerous ground. I can't speak to other regulatory environments, but at least the FCC is cracking down
> on even the possibility that anyone can operate a WiFi device outside the regulatory bounds.

These patches make it slightly easier to use the licensed bands, but no one
can accidentally use them due to the regdb and other constaints in these
patches.

So, I don't think these patches offer any fundamental new vulnerability
that should concern the FCC.

After all, someone who really wants to do evil can find and apply the patches
without undue effort, and it could easily be that those applying the patches would
then make it even easier to abuse the new channels due to laziness or poor coding
choices.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
