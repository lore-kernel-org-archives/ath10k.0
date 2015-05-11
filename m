Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yrma5-0005Y3-Mo
 for ath10k@lists.infradead.org; Mon, 11 May 2015 12:13:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k/mac80211: add rawtxrx,
 nohwcrypt module param for raw tx injection, sw crypto support.
References: <CAG5N3qG7090vB6XoUaQSHvQw7GpE+gXvJAbKrv7def3nV0OFJw@mail.gmail.com>
 <873837qo6l.fsf@kamboji.qca.qualcomm.com>
 <554CE438.5000208@candelatech.com>
 <CAG5N3qFB=yZJYSokUqF2=eNcS5SoCOntOyan6_OuahtFF5r=Bw@mail.gmail.com>
Date: Mon, 11 May 2015 15:12:37 +0300
In-Reply-To: <CAG5N3qFB=yZJYSokUqF2=eNcS5SoCOntOyan6_OuahtFF5r=Bw@mail.gmail.com>
 (Liu CF's message of "Fri, 8 May 2015 10:35:19 -0700")
Message-ID: <871tinjosq.fsf@kamboji.qca.qualcomm.com>
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
To: Liu CF/TW <cfliu.tw@gmail.com>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

"Liu CF/TW" <cfliu.tw@gmail.com> writes:

>>> I wonder does it make any sense to have nohwcrypt parameter? Especially
>>> if ath10k doesn't support case rawtxrx=0 and nohwcrypt=1. One
>>> possibility I came up is to have multiple values for rawtxrx, for
>>> example is rawtxrx=1 means HW crypt enabled and rawtxrx=2 HW crypt
>>> disabled. Ideas welcome.
>
> Indeed. I picked nohwcrypt because it seems to be the convention in
> previous Atheros drivers for this feature.

Yeah, but I don't think we need to follow that in ath10k. Especially not
until we get SW encryption working in all cases.

> In this case, I will drop nohwcrypt and do as you suggested.
>
> rawmode = 0: Raw mode disabled. Use the default native WiFi mode. In
> this mode, only HW crypto is supported.
> rawmode = 1: Use Raw rx decap + raw tx encap mode. Supports both SW
> and HW crypto.
> rawmode = 2: Same as 1, but with HW crypto engine globally disabled.

I would guess that HW crypto globally disabled (value 2 above) will be
more popular, right? So would it make sense to reverse the values and
use value 1 for that?

> When rawmode = 1, I want a further per BSS control to make some BSS
> use HW crypto and some BSS bypass HW crypto.
> For those BSS that have HW crypto bypassed, their data frames may come
> from either the normal wlan interfaces (therefore mac80211 sw crypto
> used), or from monitor interfaces (therefore Tx injected frames
> already encrypted + Rx frames still encrypted)

Ok, we need to think how to configure this. Maybe a debugfs interface?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
