Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bpwIH-0004jG-84
 for ath10k@lists.infradead.org; Fri, 30 Sep 2016 11:47:58 +0000
Message-ID: <1475236046.17481.46.camel@sipsolutions.net>
Subject: Re: [PATCH 0/4] ath10k: fix mesh sync operation
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 30 Sep 2016 13:47:26 +0200
In-Reply-To: <20160928235631.9197-1-twp@qca.qualcomm.com>
 (sfid-20160929_015935_293622_5DEFFE7A)
References: <20160928235631.9197-1-twp@qca.qualcomm.com>
 (sfid-20160929_015935_293622_5DEFFE7A)
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
To: Thomas Pedersen <twp@qca.qualcomm.com>, ath10k <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>

On Wed, 2016-09-28 at 16:56 -0700, Thomas Pedersen wrote:
> This patchset introduces a new ieee80211_op offset_tsf(), which gives
> the driver a s64 TSF offset for TSF adjustment. This is more accurate
> than programming absolute TSF since programming delay is avoided.
> 

You were lucky we have patchwork, otherwise I would've missed the
mac80211 patches in this series :)

Applied both now - no reason to apply them in the order you sent them.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
