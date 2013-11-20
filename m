Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from vs19.mail.saunalahti.fi ([62.142.117.200])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjFU0-00085a-5P
 for ath10k@lists.infradead.org; Wed, 20 Nov 2013 21:38:49 +0000
Received: from vams (localhost [127.0.0.1])
 by vs19.mail.saunalahti.fi (Postfix) with SMTP id 84F50280058
 for <ath10k@lists.infradead.org>; Wed, 20 Nov 2013 23:38:16 +0200 (EET)
Received: from gw02.mail.saunalahti.fi (gw02.mail.saunalahti.fi
 [195.197.172.116])
 by vs19.mail.saunalahti.fi (Postfix) with ESMTP id 66C1E280058
 for <ath10k@lists.infradead.org>; Wed, 20 Nov 2013 23:38:16 +0200 (EET)
Received: from [192.168.1.230] (ip-109-91-185-129.unitymediagroup.de
 [109.91.185.129])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by gw02.mail.saunalahti.fi (Postfix) with ESMTP id 68D9F139801
 for <ath10k@lists.infradead.org>; Wed, 20 Nov 2013 23:38:15 +0200 (EET)
Message-ID: <528D2BC5.7050902@elisanet.fi>
Date: Wed, 20 Nov 2013 22:38:13 +0100
From: Matti Laakso <malaakso@elisanet.fi>
MIME-Version: 1.0
Subject: Re: Re: [PATCH] ath10k: clear tx status before submitting to mac80211
References: <87eh6i3ufk.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87eh6i3ufk.fsf@kamboji.qca.qualcomm.com>
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

> Michal Kazior <michal.kazior at tieto.com <http://lists.infradead.org/mailman/listinfo/ath10k>> writes:
>
> >/ Garbage was reported in ieee80211_tx_info. This
> />/ led to a WARN_ON in cfg80211_calculate_bitrate().
> />/
> />/ This also fixes some random tx bitrate values
> />/ reported through `iw` command.
> />/
> />/ Reported-By: Kalle Valo <kvalo at qca.qualcomm.com <http://lists.infradead.org/mailman/listinfo/ath10k>>
> />/ Signed-off-by: Michal Kazior <michal.kazior at tieto.com <http://lists.infradead.org/mailman/listinfo/ath10k>>
> /
> Thanks, applied.
>
> -- 
> Kalle Valo

I'm running ath10k on a router, and cherry-picking this to current
OpenWrt (3.10.18 with backports from linux-next and some
OpenWrt-specific patches) prevents all stations from associating to the
access point. As far as I can see this patch doesn't depend on anything
else pushed in between?

Matti Laakso

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
