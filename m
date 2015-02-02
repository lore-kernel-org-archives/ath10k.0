Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.11.231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIQ3k-0002Bt-V8
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 23:05:37 +0000
Message-ID: <54D0028E.6000503@codeaurora.org>
Date: Mon, 02 Feb 2015 15:04:46 -0800
From: Peter Oh <poh@codeaurora.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>	<20150127213349.GA24933@localhost>	<54C824DC.5080804@qca.qualcomm.com>	<20150128043005.GB24933@localhost>	<54C875FD.3070101@qca.qualcomm.com>	<1422430643.1973.1.camel@sipsolutions.net>	<54CC0B71.9050301@codeaurora.org>	<21708.11481.380046.994311@gargle.gargle.HOWL>	<54CC3640.2090209@codeaurora.org>	<21708.14493.458370.65799@gargle.gargle.HOWL>
 <CAJ-Vmok9X7Zu67A3xnTKkBbLYPhrxqxRkv7EzKpPAnTOw6baVQ@mail.gmail.com>
In-Reply-To: <CAJ-Vmok9X7Zu67A3xnTKkBbLYPhrxqxRkv7EzKpPAnTOw6baVQ@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>, Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Bob Copeland <me@bobcopeland.com>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org


On 02/02/2015 02:26 PM, Adrian Chadd wrote:
> On 30 January 2015 at 18:06, Sujith Manoharan <sujith@msujith.org> wrote:
>> Peter Oh wrote:
>>> Please refer the email thread that I mentioned about other architectures.
>>> (dsb is for ARM and other platforms have the equivalent instruction such
>>> as sfence, sync, mf, and dcs).
>> Ok.
>>
>>> Also the patch is updated with 2nd patch set replacing wmb to mb.
>> Would be good to test this on a MIPS platform...
>>
> The Atheros mips74k stuff I have here does /not/ flush all the writes
> out to the device and guarantee the device has seen everything with a
> memory barrier. Just saying. Various drivers ended up needing
> ioread()s in my experiments; mips sync operations weren't enough.
>
> So I'd suggest abstracting it out like the linux dri i915 code has -
> they define a "posting read" macro which they use whenever they need
> to ensure it's definitely made it all the way out to the hardware and
> through internal FIFOs so internal hardware has seen the state change.
> Then you can redefine that to your hearts content based on platform.
Thank you Adrian to head up the concern and suggestion.
The other people also concerned about other architectures like mips, so 
I was going to analysis it.
But since you've already experienced the defects, let me hold the change 
back until I find better for all.
>
>
> -adrian
Regards,
Peter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
