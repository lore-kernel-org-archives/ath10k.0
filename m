Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bn3nam04on0620.outbound.protection.outlook.com
 ([2a01:111:f400:fe4e::620]
 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK0IZ-0007dQ-D4
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 12:17:37 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Tue, 6 Nov 2018 12:17:21 +0000
Message-ID: <20181106121713.33h7npfrbbpolwao@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <b833d8c0987e838759dbf00d97d4989a267a10fb.camel@sipsolutions.net>
 <20181106104547.5mnbymn4peuhgng3@bars>
 <50876f6067d109116a841399006aee950d9a2117.camel@sipsolutions.net>
In-Reply-To: <50876f6067d109116a841399006aee950d9a2117.camel@sipsolutions.net>
Content-Language: en-US
Content-ID: <71C2188D84C52843AE85414F23568674@namprd05.prod.outlook.com>
MIME-Version: 1.0
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Tamizh chelvam <tamizhr@codeaurora.org>

On Tue, Nov 06, 2018 at 12:28:11PM +0100, Johannes Berg wrote:
> 
> WARNING: External email to Quantenna Communications. Please exercise caution!
> 
> 
> Hi,
> 
> On Tue, 2018-11-06 at 10:45 +0000, Sergey Matyukevich wrote:
> > > On Mon, 2018-10-22 at 23:25 +0530, Tamizh chelvam wrote:
> > > > Add infrastructure for per TID aggregation/retry count configurations
> > > > such as retry count and AMPDU aggregation control(disable/enable).
> > > > In some scenario reducing the number of retry count for a specific data
> > > > traffic can reduce the latency by proceeding with the next packet
> > > > instead of retrying the same packet more time. This will be useful
> > > > where the next packet can resume the operation without an issue.
> > >
> > > Not sure I understand this, how can you expect to control something on a
> > > per-packet basis using this?
> > >
> > > Sergey, looks like your A-MPDU control is already in here per RA/TID,
> > > and A-MSDU could be added easily?
> 
> > Thanks for pointing me at this patch series. Indeed, it looks like an
> > exact match for proper RA/TID aware implementation of AMPDU control.
> > AMSDU can be added following the same approach.
> >
> 
> Great. I guess if you could take a look that'd be nice, and perhaps also
> see if you could actually implement it? Your driver patch seemed to
> imply the firmware only has global control, rather than per RA/TID.
> 
> Also, do you think A-MPDU length control would be something useful?
> Perhaps that should be instead of enable/disable (since setting length
> to 0 or 1 could easily mean "no A-MPDU")

Hello Johannes,

I will send a follow-up A-MSDU patch after this patch set lands in your tree.
And then qtnfmac driver patches for both A-MPDU/A-MSDU changes.

As for A-MPDU chain length control, I don't think we have any practical
use-case for this feature at the moment. However Ben Greear suggested
one possible use-case: to decrease A-MPDU chain length for voice TID
in order to decrease latency. Anyways, current A-MPDU patches can be
easily adapted to support it if needed.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
