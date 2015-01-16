Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x22e.google.com ([2a00:1450:4010:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YCA77-0002bT-Iw
 for ath10k@lists.infradead.org; Fri, 16 Jan 2015 16:51:14 +0000
Received: by mail-la0-f46.google.com with SMTP id ge10so10132325lab.5
 for <ath10k@lists.infradead.org>; Fri, 16 Jan 2015 08:50:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CABhs+6kTguLdmgrqQ7UUYwQyM=0iTwWU0Msxg1+_tLNhd0dFRA@mail.gmail.com>
References: <CABhs+6kTguLdmgrqQ7UUYwQyM=0iTwWU0Msxg1+_tLNhd0dFRA@mail.gmail.com>
Date: Fri, 16 Jan 2015 18:50:49 +0200
Message-ID: <CABhs+6nt8n04T5FcZHyQ4r79jnxYeKD7ibvTPttUARn_TX66kg@mail.gmail.com>
Subject: Re: TX statistics
From: Ilias Syrigos <ilias013@gmail.com>
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
To: ath10k@lists.infradead.org

Hello again,

I'm still trying to calculate the Packet Delivery Ratio statistic.

By considering the tx_packets variable which represents the packets
passed to ath10k driver for transmission, I thought I should be able
to calculate the probability of successful transmission by disabling
retransmissions.

However iw set retry does not seem to work and I have neither found a
way to do it through a hack in ath10k source code.

Can you please provide me with a direction on how to do that?

Thank you in advance,
Ilias

2014-12-27 21:44 GMT+02:00 Ilias Syrigos <ilias013@gmail.com>:
> Hello,
>
> I am trying to calculate the PDR (Packet Delivery Ratio) statistic
> while operating with ac wifi cards supported by ath10k driver, but
> without success.
>
> With ath9k driver I was able to calculate PDR through mac80211 debugFS
> stats and specifically through tx_packets counter and tx_retry_count.
>
> However, with ath10k, firmware doesn't seem to update retry counter
> and I couldn't get relevant statistics through fw_stats.
>
> Can you suggest any other way to get tx attempts and retries in ath10k?
>
> Thank you in advance,
> Ilias

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
