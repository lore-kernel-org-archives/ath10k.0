Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsCcE-00030S-MD
 for ath10k@lists.infradead.org; Sat, 22 Nov 2014 15:28:52 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 04/10] ath10k: make firmware text debug messages more
 verbose.
References: <1411507045-18973-1-git-send-email-greearb@candelatech.com>
 <1411507045-18973-4-git-send-email-greearb@candelatech.com>
Date: Sat, 22 Nov 2014 17:28:22 +0200
In-Reply-To: <1411507045-18973-4-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 23 Sep 2014 14:17:19
 -0700")
Message-ID: <878uj38dbd.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> There are not many of these messages producted by the
> firmware, but they are generally fairly useful, so print
> them at info level.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> --- a/drivers/net/wireless/ath/ath10k/debug.h
> +++ b/drivers/net/wireless/ath/ath10k/debug.h
> @@ -35,6 +35,7 @@ enum ath10k_debug_mask {
>  	ATH10K_DBG_BMI		= 0x00000400,
>  	ATH10K_DBG_REGULATORY	= 0x00000800,
>  	ATH10K_DBG_TESTMODE	= 0x00001000,
> +	ATH10K_DBG_FW_MSG	= 0x00002000,

I think FW_MSG is a bit too ambiguous, so I changed this to WMI_PRINT so
that it's closer the real event name.

Full patch: https://github.com/kvalo/ath/commit/ce4269787f4b5e538731f34cb3a7358343efaa00

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
