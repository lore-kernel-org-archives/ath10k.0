Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIPSN-00044j-3X
 for ath10k@lists.infradead.org; Mon, 02 Feb 2015 22:26:59 +0000
Received: by mail-ig0-f169.google.com with SMTP id hl2so20450522igb.0
 for <ath10k@lists.infradead.org>; Mon, 02 Feb 2015 14:26:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <21708.14493.458370.65799@gargle.gargle.HOWL>
References: <1422311118-11320-1-git-send-email-poh@qca.qualcomm.com>
 <20150127213349.GA24933@localhost>
 <54C824DC.5080804@qca.qualcomm.com>
 <20150128043005.GB24933@localhost>
 <54C875FD.3070101@qca.qualcomm.com>
 <1422430643.1973.1.camel@sipsolutions.net>
 <54CC0B71.9050301@codeaurora.org>
 <21708.11481.380046.994311@gargle.gargle.HOWL>
 <54CC3640.2090209@codeaurora.org>
 <21708.14493.458370.65799@gargle.gargle.HOWL>
Date: Mon, 2 Feb 2015 14:26:36 -0800
Message-ID: <CAJ-Vmok9X7Zu67A3xnTKkBbLYPhrxqxRkv7EzKpPAnTOw6baVQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Replace ioread with wmb for data sync
From: Adrian Chadd <adrian@freebsd.org>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Peter Oh <poh@codeaurora.org>, Bob Copeland <me@bobcopeland.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Peter Oh <poh@qca.qualcomm.com>, Johannes Berg <johannes@sipsolutions.net>

On 30 January 2015 at 18:06, Sujith Manoharan <sujith@msujith.org> wrote:
> Peter Oh wrote:
>> Please refer the email thread that I mentioned about other architectures.
>> (dsb is for ARM and other platforms have the equivalent instruction such
>> as sfence, sync, mf, and dcs).
>
> Ok.
>
>> Also the patch is updated with 2nd patch set replacing wmb to mb.
>
> Would be good to test this on a MIPS platform...
>

The Atheros mips74k stuff I have here does /not/ flush all the writes
out to the device and guarantee the device has seen everything with a
memory barrier. Just saying. Various drivers ended up needing
ioread()s in my experiments; mips sync operations weren't enough.

So I'd suggest abstracting it out like the linux dri i915 code has -
they define a "posting read" macro which they use whenever they need
to ensure it's definitely made it all the way out to the hardware and
through internal FIFOs so internal hardware has seen the state change.
Then you can redefine that to your hearts content based on platform.



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
