Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJljX-0004QX-Vj
 for ath10k@lists.infradead.org; Mon, 05 Nov 2018 20:44:29 +0000
Message-ID: <b833d8c0987e838759dbf00d97d4989a267a10fb.camel@sipsolutions.net>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 05 Nov 2018 21:43:48 +0100
In-Reply-To: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
Mime-Version: 1.0
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, ath10k@lists.infradead.org
Cc: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>, linux-wireless@vger.kernel.org

On Mon, 2018-10-22 at 23:25 +0530, Tamizh chelvam wrote:
> Add infrastructure for per TID aggregation/retry count configurations
> such as retry count and AMPDU aggregation control(disable/enable).
> In some scenario reducing the number of retry count for a specific data
> traffic can reduce the latency by proceeding with the next packet
> instead of retrying the same packet more time. This will be useful
> where the next packet can resume the operation without an issue.

Not sure I understand this, how can you expect to control something on a
per-packet basis using this?

Sergey, looks like your A-MPDU control is already in here per RA/TID,
and A-MSDU could be added easily?

johannes


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
