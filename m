Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB2id-0005OR-PU
 for ath10k@lists.infradead.org; Tue, 13 Jan 2015 14:45:22 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: Make HTT fill size configurable
References: <1420432796-10765-1-git-send-email-sujith@msujith.org>
 <CA+BoTQ=HqF0vBj4chXfoY9GKcFBP8Xh37HXo5etDDZ1XCg6O4w@mail.gmail.com>
 <21677.3195.451116.244389@gargle.gargle.HOWL>
Date: Tue, 13 Jan 2015 16:44:42 +0200
In-Reply-To: <21677.3195.451116.244389@gargle.gargle.HOWL> (Sujith Manoharan's
 message of "Wed, 7 Jan 2015 16:07:47 +0530")
Message-ID: <87zj9m4u5h.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sujith Manoharan <sujith@msujith.org> writes:

>> I have a patch internally which removes the replenishment tasklet and
>> I wonder how will it behave with rx batching then, hmm..
>
> I tried that earlier and could see only marginal improvement. The biggest
> increase came when I replaced netif_receive_skb() with netif_rx()
> in mac80211/rx.c.

Any ideas why that increases throughput?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
