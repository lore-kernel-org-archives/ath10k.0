Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-by2nam05on0613.outbound.protection.outlook.com
 ([2a01:111:f400:fe52::613]
 helo=NAM05-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJysH-0004Af-0y
 for ath10k@lists.infradead.org; Tue, 06 Nov 2018 10:46:22 +0000
From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Subject: Re: [PATCH 0/4] cfg80211/mac80211: Add support for TID specific
 configuration
Date: Tue, 6 Nov 2018 10:45:53 +0000
Message-ID: <20181106104547.5mnbymn4peuhgng3@bars>
References: <1540230918-27712-1-git-send-email-tamizhr@codeaurora.org>
 <b833d8c0987e838759dbf00d97d4989a267a10fb.camel@sipsolutions.net>
In-Reply-To: <b833d8c0987e838759dbf00d97d4989a267a10fb.camel@sipsolutions.net>
Content-Language: en-US
Content-ID: <2BBCEC7EFDE58F40AE39EAAFAFA0B3B8@namprd05.prod.outlook.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Igor Mitsyanko <igor.mitsyanko.os@quantenna.com>, Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Tamizh chelvam <tamizhr@codeaurora.org>

> On Mon, 2018-10-22 at 23:25 +0530, Tamizh chelvam wrote:
> > Add infrastructure for per TID aggregation/retry count configurations
> > such as retry count and AMPDU aggregation control(disable/enable).
> > In some scenario reducing the number of retry count for a specific data
> > traffic can reduce the latency by proceeding with the next packet
> > instead of retrying the same packet more time. This will be useful
> > where the next packet can resume the operation without an issue.
> 
> Not sure I understand this, how can you expect to control something on a
> per-packet basis using this?
> 
> Sergey, looks like your A-MPDU control is already in here per RA/TID,
> and A-MSDU could be added easily?

Hello Johannes,

Thanks for pointing me at this patch series. Indeed, it looks like an
exact match for proper RA/TID aware implementation of AMPDU control.
AMSDU can be added following the same approach.

Regards,
Sergey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
