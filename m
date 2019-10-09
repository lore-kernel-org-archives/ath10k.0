Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIBqw-0003tF-PA
 for ath10k@lists.infradead.org; Wed, 09 Oct 2019 13:18:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v2 2/2] ath10k: Enable Airtime-based Queue Limit (AQL)
References: <20191007043120.67567-1-kyan@google.com>
 <20191007043120.67567-3-kyan@google.com>
Date: Wed, 09 Oct 2019 16:17:58 +0300
In-Reply-To: <20191007043120.67567-3-kyan@google.com> (Kan Yan's message of
 "Sun, 6 Oct 2019 21:31:20 -0700")
Message-ID: <87eezmgird.fsf@tynnyri.adurom.net>
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
To: Kan Yan <kyan@google.com>
Cc: make-wifi-fast@lists.bufferbloat.net, toke@redhat.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, yiboz@codeaurora.org, johannes@sipsolutions.net, nbd@nbd.name

Kan Yan <kyan@google.com> writes:

> Calculate the estimated airtime pending in the txqs and apply AQL to
> prevent excessive amounts of packets being queued in the firmware queue.
>
> Signed-off-by: Kan Yan <kyan@google.com>

Please CC ath10k patches to ath10k list, I doubt all ath10k developers
follow linux-wireless.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
