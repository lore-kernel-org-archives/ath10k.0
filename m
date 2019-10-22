Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMoms-0001GK-7k
 for ath10k@lists.infradead.org; Tue, 22 Oct 2019 07:41:03 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] ath10k: Enable Airtime-based Queue Limit (AQL)
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191011022413.176208-3-kyan@google.com>
References: <20191011022413.176208-3-kyan@google.com>
Message-Id: <20191022074101.5EDA9607C3@smtp.codeaurora.org>
Date: Tue, 22 Oct 2019 07:41:01 +0000 (UTC)
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

Kan Yan <kyan@google.com> wrote:

> Calculate the estimated airtime pending in the txqs and apply AQL to
> prevent excessive amounts of packets being queued in the firmware queue.
> 
> Signed-off-by: Kan Yan <kyan@google.com>

Dropped per Kan's and Toke's comment:

https://lkml.kernel.org/r/878speqh75.fsf@toke.dk

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/11184783/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
