Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x230.google.com ([2a00:1450:4010:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmptJ-0000CG-1k
 for ath10k@lists.infradead.org; Tue, 20 May 2014 19:40:01 +0000
Received: by mail-la0-f48.google.com with SMTP id mc6so812904lab.35
 for <ath10k@lists.infradead.org>; Tue, 20 May 2014 12:39:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU3jF_GAEVETh1utpYgNGQ6_k=JwYZrsjvVoXDPpuhJdsA@mail.gmail.com>
References: <CAJ+vNU3jF_GAEVETh1utpYgNGQ6_k=JwYZrsjvVoXDPpuhJdsA@mail.gmail.com>
Date: Tue, 20 May 2014 21:39:37 +0200
Message-ID: <CALhHN=r1w9Bfeqc1jH2644yVM3S0cxjdUnvavHgq56APX+9uOQ@mail.gmail.com>
Subject: Re: ath10k rate control and stats
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Tim Harvey <tharvey@gateworks.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 20 May 2014 21:07, Tim Harvey <tharvey@gateworks.com> wrote:
> Greetings,
>
> I can't figure out how to get rate control stats to show me what MCS
> rate my ath10k links are at. Is rate control implemented by the
> firmware or part of the mac80211 rate control? Is there any way to get
> stats akin to the per-station rc_stats I'm used to seeing with ath9k?
>

ath10k rate control is implemented in the firmware. There is debugfs
fw_stats command - check tx_rate, rx_rate.
Also iw wlanX station dump will report correct RX rate (tx is not set
while we don't get this info  from firmware yet).

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
