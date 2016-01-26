Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO59F-0000QL-GT
 for ath10k@lists.infradead.org; Tue, 26 Jan 2016 15:03:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/7] Add support for Per STA Rx duration
References: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
Date: Tue, 26 Jan 2016 17:02:35 +0200
In-Reply-To: <1452699994-5078-1-git-send-email-mohammed@qca.qualcomm.com>
 (Mohammed Shafi Shajakhan's message of "Wed, 13 Jan 2016 21:16:27
 +0530")
Message-ID: <87powopeno.fsf@kamboji.qca.qualcomm.com>
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com> writes:

> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> From: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
>
> *Enable parsing of rx_duration as part of peer stats support
>  by the new 10.2.4 firmware
> *Add support to dump per STA rx_duration  (usecs)
> *Pre-requisite cleanups
> *For calculating total rx-duration in host, enable provision to
>  support periodic peer stats update.
> *Also enable mac80211 debugfs entry to track per STA rx duration(usecs)
>
> Mohammed Shafi Shajakhan (7):
>   ath10k: Add support for parsing per STA rx_duration for 10.2.4
>   ath10k: Fix naming Peer stats rssi_changed field in 10.2.4
>   ath10k: Cleanup setting pdev paramaters
>   ath10k: Rename few function names of firmware stats
>   ath10k: Provision to support periodic peer stats update
>   ath10k: Enable periodic peer stats update
>   ath10k: Add debugfs support for Per STA total rx duration

Applied, thanks.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
