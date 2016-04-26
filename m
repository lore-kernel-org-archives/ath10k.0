Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1av1zZ-0005Oq-8b
 for ath10k@lists.infradead.org; Tue, 26 Apr 2016 12:21:26 +0000
Received: by mail-wm0-x22c.google.com with SMTP id u206so4589541wme.1
 for <ath10k@lists.infradead.org>; Tue, 26 Apr 2016 05:21:04 -0700 (PDT)
Date: Tue, 26 Apr 2016 05:21:01 -0700 (PDT)
From: Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [OpenWrt-Devel] How to initialize multiple phy radios
Message-ID: <2910322.5mKxx5TJEB@debian64>
In-Reply-To: <8760v425vl.fsf@kamboji.qca.qualcomm.com>
References: <CA+i30h-5GCJ0h9REAJE8TCdxNQDe8Sa=Fs=gbxpHEW3fOY-hMw@mail.gmail.com>
 <112436203.W4fT509tru@debian64> <8760v425vl.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: David Hutchison <dhutchison@bluemesh.net>, OpenWrt Development List <openwrt-devel@lists.openwrt.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Tuesday, April 26, 2016 07:20:32 AM Valo, Kalle wrote:
> Christian Lamparter <chunkeey@googlemail.com> writes:
> > On Monday, April 25, 2016 10:53:41 AM David Hutchison wrote:
> >> So with some modifications to pci.c, hw.h and core.c I was able to get
> >> the radio initialized! :)
> >
> > Hey, that's nice! Can you make and post a patch for that? 
> > I'm sure if it's just a matter of adding the new pci and chip
> > ids to the tables. You could just go ahead and post it, so it
> > will be picked up.
> > [...] Editing...
> > Does the device work? Can you scan for networks, connect to networks
> > and create networks? That would be good to know.
        ^^^^

> But remember that the basic functionality should somewhat work before we
> add the ids to ath10k. The hardware support doesn't need to be perfect
> but we should not enable something which is brokend and would just waste
> users time.
Don't worry about that, I did include the highlighted sentence in the previous
mail as well (seems like it was lost during editing - readded it). 

Anyway, I think David will figure out what's working and what isn't and will
let ath10k-devel know about it. 
it.

Regards,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
