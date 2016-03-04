Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ablIC-0006ly-GA
 for ath10k@lists.infradead.org; Fri, 04 Mar 2016 08:41:01 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] Peer Stats fixes for rx duration
Date: Fri, 4 Mar 2016 08:40:14 +0000
Message-ID: <87egbqzleb.fsf@kamboji.qca.qualcomm.com>
References: <1454513863-2703-1-git-send-email-mohammed@qca.qualcomm.com>
In-Reply-To: <1454513863-2703-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Wed, 3 Feb 2016 21:07:41	+0530")
Content-Language: en-US
Content-ID: <F76657FEB6C06C4481E972D07F2B7352@qualcomm.com>
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
To: "Shajakhan, Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> This is a small patchset that fixes:
>
> 1. Updating rx duration per station (part of mac80211 STA debugfs)
> irrespective user does a cat fw_stats in ath10k debugfs
>
> 2. Remove updating peer stats list (which is completely useless)
> when we recieve periodic update of peer stats for updating rx_duration
>
> Mohammed Shafi Shajakhan (2):
>   ath10k: Fix updating peer stats rx duration
>   ath10k: Fix pointless update of peer stats list

Both applied, thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
