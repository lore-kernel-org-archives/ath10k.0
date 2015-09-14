Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x22b.google.com ([2607:f8b0:4001:c05::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbOOs-0004uW-5b
 for ath10k@lists.infradead.org; Mon, 14 Sep 2015 07:42:06 +0000
Received: by igxx6 with SMTP id x6so75941326igx.1
 for <ath10k@lists.infradead.org>; Mon, 14 Sep 2015 00:41:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55F6540D.9080300@candelatech.com>
References: <55F6540D.9080300@candelatech.com>
Date: Mon, 14 Sep 2015 00:41:44 -0700
Message-ID: <CAJ-Vmo=X-6ht1vqJOtJYZWBFr9hMpc3tPYRLrw0tv2GZLiOSKA@mail.gmail.com>
Subject: Re: Need to re-associate firmware peer when SMPS_CHANGED is set?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Hm! Well, iirc what we did in the rate control code for 11n chips was
just to limit the transmit rate control selection to MCS0-7 even
though we were in 2- or 3- stream modes.

What else is it causing to change?


-a


On 13 September 2015 at 21:58, Ben Greear <greearb@candelatech.com> wrote:
> While digging in 10.1 firmware, I notice that setting WMI_PEER_SMPS_STATE
> can cause
> the chainmask to change.  And, that in turn can change all sorts of things
> related to
> available rates and such.
>
> Maybe we should do a re-assoc when we notice SMPS_CHANGED, similar to how it
> is done for NSS_CHANGED?
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
