Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXTMm-0005RU-Jo
 for ath10k@lists.infradead.org; Fri, 26 Sep 2014 11:07:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/4] ath10k: fix/cleanup fw stats
References: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
Date: Fri, 26 Sep 2014 14:06:42 +0300
In-Reply-To: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 25 Sep 2014 12:33:46 +0200")
Message-ID: <871tqy63p9.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> Hi,
>
> This cleans up and fixes fw stats aggregation.
>
>
> Michal Kazior (4):
>   ath10k: split wmi stats parsing
>   ath10k: rename fw_stats related stuff
>   ath10k: request fw_stats once on open
>   ath10k: fix fw stats processing

I didn't review these yet but I saw new warnings:

drivers/net/wireless/ath/ath10k/debug.c: In function 'ath10k_fw_stats_fill':
drivers/net/wireless/ath/ath10k/debug.c:540:5: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' [-Wformat]

drivers/net/wireless/ath/ath10k/wmi.c:1513: WARNING: else is not generally useful after a break or return

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
