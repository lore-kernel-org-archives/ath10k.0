Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJwJb-0003tI-EJ
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 09:06:58 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH v4 0/2] Implement Airtime-based Queue Limit (AQL)
References: <20191011022413.176208-1-kyan@google.com>
Date: Mon, 14 Oct 2019 12:06:45 +0300
In-Reply-To: <20191011022413.176208-1-kyan@google.com> (Kan Yan's message of
 "Thu, 10 Oct 2019 19:24:11 -0700")
Message-ID: <87wod7y9ui.fsf@kamboji.qca.qualcomm.com>
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

> This patch series implements Airtime-based Queue Limit (AQL) in the mac80211 and Ath10k driver. It is based on an earlier version from the ChromiumOS tree[0].
>
> This version has been tested with QCA9884 platform with 4.14 kernel. Tests show AQL is able to reduce latency by an order of magnitude in a congested environment without negative impact on the throughput.
>
> [0] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1703105/7
>
> Kan Yan (2):
>   mac80211: Implement Airtime-based Queue Limit (AQL)
>   ath10k: Enable Airtime-based Queue Limit (AQL)

Please always include a change log so that people know what has changed
since the previous version:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#changelog_missing

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
