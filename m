Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDXoA-0007NP-Th
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 13:58:11 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k:  Fix mgmt tx status for 10.4.3 firmware.
Date: Thu, 16 Jun 2016 13:57:43 +0000
Message-ID: <87shwdw815.fsf@kamboji.qca.qualcomm.com>
References: <1456782654-24723-1-git-send-email-greearb@candelatech.com>
In-Reply-To: <1456782654-24723-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Mon, 29 Feb 2016 13:50:54	-0800")
Content-Language: en-US
Content-ID: <C5B36E9484E0B64088D1183998027540@qualcomm.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> When testing a 10.4.3 firmware in station mode, I notice that
> when the AP is powered down, the ath10k does not notice AP is gone
> because mgt frames get tx status of 3, which is not handled.
>
> It appears that status 3 means something similar to failed-retry.
>
> Treating it thus lets the station disconnect properly.
>
> Tested against a non-stock 10.4.3 firmware, but likely upstream
> firmware acts similarly in this case.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>
> ---
>
> This patch is against a heavily patched tree based on 4.4, hopefully
> it can be applied to upstream code w/out too much trouble.
>
> Someone should verify this on stock 10.4-ish firmware before applying.

Has anyone tested this with stock driver and stock firmware?

Full patch here:

https://patchwork.kernel.org/patch/8460831/

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
