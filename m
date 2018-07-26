Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1figbt-0008DY-6I
 for ath10k@lists.infradead.org; Thu, 26 Jul 2018 13:47:18 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Prevent active scans on potential unusable
 channels
References: <20180710094448.13201-1-sven.eckelmann@openmesh.com>
Date: Thu, 26 Jul 2018 16:47:00 +0300
In-Reply-To: <20180710094448.13201-1-sven.eckelmann@openmesh.com> (Sven
 Eckelmann's message of "Tue, 10 Jul 2018 11:44:48 +0200")
Message-ID: <87r2jqt8h7.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Marek Puzyniak <marek.puzyniak@tieto.com>, Simon Wunderlich <simon.wunderlich@openmesh.com>, ath10k@lists.infradead.org

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> The QCA4019 hw1.0 firmware 10.4-3.2.1-00050 and 10.4-3.5.3-00053 (and most
> likely all other) seem to ignore the WMI_CHAN_FLAG_DFS flag during the
> scan. This results in transmission (probe requests) on channels which are
> not "available" for transmissions.
>
> Since the firmware is closed source and nothing can be done from our side
> to fix the problem in it, the driver has to work around this problem. The
> WMI_CHAN_FLAG_PASSIVE seems to be interpreted by the firmware to not
> scan actively on a channel unless an AP was detected on it. Simple probe
> requests will then be transmitted by the STA on the channel.
>
> ath10k must therefore also use this flag when it queues a radar channel for
> scanning. This should reduce the chance of an active scan when the channel
> might be "unusable" for transmissions.
>
> Fixes: e8a50f8ba44b ("ath10k: introduce DFS implementation")
> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>

You didn't CC linux-wireless so I don't see this in patchwork. Can you
resend, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
