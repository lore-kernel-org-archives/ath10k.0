Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFNrU-0006Cz-4U
 for ath10k@lists.infradead.org; Tue, 21 Jun 2016 15:45:12 +0000
Date: Tue, 21 Jun 2016 21:11:08 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: Bug with: ath10k: enable parsing per station rx duration for 10.4?
Message-ID: <20160621154107.GA21954@atheros-ThinkPad-T61>
References: <5768770C.5050305@candelatech.com>
 <20160621051829.GA20604@atheros-ThinkPad-T61>
 <57694AD4.3020101@candelatech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57694AD4.3020101@candelatech.com>
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
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>

On Tue, Jun 21, 2016 at 07:10:28AM -0700, Ben Greear wrote:
> 
> 
> On 06/20/2016 10:18 PM, Mohammed Shafi Shajakhan wrote:
> >Hi Ben,
> >
> >thanks for reporting ...
> >
> >On Mon, Jun 20, 2016 at 04:06:52PM -0700, Ben Greear wrote:
> >>I'm working on bringing up my hacked up version of 4.7 ath10k and 10.4 firmware, and I think
> >>I may have found a regression.
> >
> >[shafi] let me know what is the issue.. some steps to recreate the issue.
> 
> ethtool -S wlan0
> or similar should reproduce it.
> 
> You would see stats timeout messages in dmesg, and with a bit more debugging,
> you notice that the driver is basically busy-spinning trying to get stats over
> WMI and/or it is giving errors because skb pull fails because there actually is
> not extd stats struct.

https://patchwork.kernel.org/patch/9149357/
 should help (Kalle had a cleaned up version in his pending branch
> 
> >>
> >>My 10.4.3-ish firmware source has a bunch of:
> >>
> >>if (stats_id == WMI_REQUEST_PEER_STAT)
> >>logic in it.  In other words, it is not using that id as a bitfield.
> >
> >[shafi] will check this.
> 
> I fixed my firmware to treat it as a bitfield, and to specifically un-set the EXTD stats
> bit, and now it works with my 4.7.  Firmware fix should be backwards compatible.
> 
> 
> >>Now, I can fix the firmware, but I am guessing that at least some stock
> >>10.4 firmware has this same issue, and of course any older firmware
> >>that does not have this change will still be broken.
> >>
> >>So, do you want to back out this patch below, at least the part where it sends
> >>in 0x9 as the stats_id?
> >
> >[shafi] request if you can check this please, there was some misunderstanding
> >in the design when this feature got enabled in 10.4, we fixed it in
> >https://patchwork.kernel.org/patch/9149357/
> 
> That might have fixed it, but it is not in 4.7, so I didn't have it
> in my tree when testing yesterday.
> 
> Thanks,
> Ben
> 
> -- 
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
