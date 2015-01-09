Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9Wtl-0003zs-09
 for ath10k@lists.infradead.org; Fri, 09 Jan 2015 10:34:36 +0000
Received: by mail-wi0-f172.google.com with SMTP id n3so1338979wiv.5
 for <ath10k@lists.infradead.org>; Fri, 09 Jan 2015 02:34:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54AEF595.9030205@candelatech.com>
References: <54AEF595.9030205@candelatech.com>
Date: Fri, 9 Jan 2015 11:34:08 +0100
Message-ID: <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
Subject: Re: Anyone seeing tx-credits 'hang'?
From: Michal Kazior <michal.kazior@tieto.com>
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
Cc: ath10k <ath10k@lists.infradead.org>

On 8 January 2015 at 22:24, Ben Greear <greearb@candelatech.com> wrote:
> I am still working on tracking down tx-credits hang, where it appears
> to the driver that firmware does not return tx credits, and the driver
> then gets lots of -11 errors from htc/wmi and will not recover (well,
> once it recovered after hanging for about 45 minutes, for reasons that are totally
> beyond me.  I do not normally wait so long).
>
> I am using a hacked ath10k driver and CT firmware, but I am suspicious that the problem
> is not unique to me, though I probably hit the problem much more often
> due to the types of stress tests I am running.

I don't recall seeing it recently.


> I have implemented a keep-alive between my driver and CT firmware,
> and firmware will assert if it does not get a message within
> about 10 seconds.  This is a wmi-message, so if we hang due to credits,
> the firmware will assert and dump a nice crash log (and host can recover).

FYI the default time mgmt tx can be stuck is 10 seconds (vide the
tx-credit starvation issue due to hostapd's inactivity measures).


> One crash I looked at closely appears to show the firmware thinking it
> has returned all credits, but driver never received them.  What is more,
> it seems that the driver thought it sent one additional wmi command
> that the firmware did not receive in the wmi message handling code.

Hmm.. A couple of ideas:
 a) lost interrupt
 b) silently dropped event buffer (in fw, e.g. due to unforseen lack
of resources)
 c) memory barrier / ordering issue (delivered/submitted buffer was a
mess - I don't know if you're checking the buffer in/out count or
analyzed all the way down to copy engine)

You could try adding a few extra mb() (e.g. before copy engine ring
indexes are updated) for (c), at least in ath10k.

You could try changing _service_any() to ignore copy engine summary
mask and iterate i=0..CE_COUNT-1 and try polling htc-wmi rx pipe (or
just simply all of them :P) with ath10k_hif_send_complete_check().


Michal

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
