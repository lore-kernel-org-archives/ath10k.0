Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <c9f21f91-992d-604f-91ac-4784e8258c3e@gmail.com>
References: <edc163f6-a49c-21f3-9cf1-74df6e262fdb@gmail.com>
 <CAJ-Vmo=4-wKKV_4pXTSgVqdPOyR+zOrHbtVP4Mv9vxaueyrh=A@mail.gmail.com>
 <c9f21f91-992d-604f-91ac-4784e8258c3e@gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Fri, 2 Jun 2017 23:16:40 -0700
Message-ID: <CAJ-Vmo=RnRGCEOTs6VHzTVZeex0n7OnTEiJq8jZR2cDhbnTXwA@mail.gmail.com>
Subject: Re: [wpa_supplicant] Is there a way to limit peers (to about 12) for
 IBSS/adhoc?
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
To: Xuebing Wang <xbing6@gmail.com>
Cc: hostap@lists.infradead.org, simon Wunderlich <sw@simonwunderlich.de>, b.a.t.m.a.n@lists.open-mesh.org, Jason Toschlog <jason.toschlog@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sven Eckelmann <sven@narfation.org>

Hi,

Well, it sounds like something you need a 40 node test network for :)

I was wondering whether it was some kind of MAC bug that was being
triggered because of so many units say, overflowing the keycache or
something. But if it's software encryption then maybe not. I wish I
could help more, but setting up a 40 node network to test is a big
challenge. :)

Is it a gradual thing?  Ie, do you know when it starts to hang? Does
it hang at 40? or gradually as you approach 40?

As for association limits - I thought there was a maximum station
parameter somewhere...


-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
