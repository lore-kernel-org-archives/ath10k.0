Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x231.google.com ([2607:f8b0:400e:c01::231])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fn6AS-0004ws-Jz
 for ath10k@lists.infradead.org; Tue, 07 Aug 2018 17:53:14 +0000
Received: by mail-pl0-x231.google.com with SMTP id e11-v6so7435188plb.3
 for <ath10k@lists.infradead.org>; Tue, 07 Aug 2018 10:53:01 -0700 (PDT)
Date: Tue, 7 Aug 2018 10:52:57 -0700
From: Brian Norris <briannorris@chromium.org>
Subject: Re: ath10k: antenna bitmask support?
Message-ID: <20180807175255.GA163107@ban.mtv.corp.google.com>
References: <20180807020813.GA185137@ban.mtv.corp.google.com>
 <6dbb4086-f5bd-2ece-e3f3-9ac7cd5b4d9c@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dbb4086-f5bd-2ece-e3f3-9ac7cd5b4d9c@candelatech.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Hi Ben,

On Tue, Aug 07, 2018 at 06:19:22AM -0700, Ben Greear wrote:
> On 08/06/2018 07:08 PM, Brian Norris wrote:
> > Hi all,
> > 
> > I'm looking at ancient changes like this:
> > 
> > commit 5572a95b4b5768187652a346356e39e7542ca6e0
> > Author: Ben Greear <greearb@candelatech.com>
> > Date:   Mon Nov 24 16:22:10 2014 +0200
> > 
> >     ath10k: apply chainmask settings to vdev on creation
> > 
> > since I see that some firmwares seem to crash a lot if you apply certain
> > chainmask settings (e.g., 0x2).
> > 
> > Is it really expected that you can set gaps in the chainmask or not? I
> > ask because I've been trying to use this for doing some antenna
> > configuration verification (e.g., disable all but one antenna and see
> > what happens), and this works as expected on APs I have running IPQ8064
> > (QCA988X?), but it crashes the firmware on IPQ4019.
> 
> I don't think you can even directly set the chainmask in the firmware,

Well, I guess the WMI interface is a bit strange then: it appears to
take a raw mask -- e.g.:

        ret = ath10k_wmi_pdev_set_param(ar, ar->wmi.pdev_param->tx_chain_mask,
                                        tx_ant);

but I guess that doesn't mean it *really* accepts a mask? You have to
presuppose what values it will accept?

> and from my previous looking at the firmware, it is not designed to support
> gaps.

OK, thanks for the info.

> If you want to determine if an antenna is working, you can look at the per-chain
> RSSI stats when receiving frames using all available antenna (ie, 3x3 rates for a 3x3 NIC).

That's not quite the same as verifying each antenna separately, but it
might be good enough. I suppose this wasn't really considered when some
of the test frameworks I'm using were written, seeing as per-chain
signal reports weren't even available in ath10k until relatively
recently:

commit 8241253d03fe9098e98315a4d66027ae31ab65c5
Author: Norik Dzhandzhapanyan <norikd@gmail.com>
Date:   Mon Jun 12 18:03:34 2017 +0300

    ath10k: add per chain RSSI reporting

Thanks,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
