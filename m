Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XlT2L-0001D6-V7
 for ath10k@lists.infradead.org; Tue, 04 Nov 2014 01:35:59 +0000
Received: by mail-wi0-f170.google.com with SMTP id q5so7527515wiv.1
 for <ath10k@lists.infradead.org>; Mon, 03 Nov 2014 17:35:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5458261C.2020700@candelatech.com>
References: <5458261C.2020700@candelatech.com>
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 3 Nov 2014 20:35:15 -0500
Message-ID: <CAHqTa-21YOPiV_UxxWh23mB7AqLhj0n+h6eA5cTUH8eh32heRw@mail.gmail.com>
Subject: Re: Slow connect times?
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

On Mon, Nov 3, 2014 at 8:04 PM, Ben Greear <greearb@candelatech.com> wrote:
> If I am reading my results right, it takes over 2 seconds to associate an
> ath10k station with WPA2 PSK on my systems.
>
> I was thinking this should be quite a bit faster than this...
>
> Has anyone done any similar measurements?

I haven't noticed any delay like this.  WPA2 PSK negotiation is on the
order of ~200ms or less. Then DHCP screws around for a few seconds,
often.

A packet trace would probably be useful for narrowing it down :)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
