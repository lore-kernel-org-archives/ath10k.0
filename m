Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrrep-0003hr-N2
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 17:06:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC] ath10k: Fix shared WEP
References: <1416492382-18058-1-git-send-email-sujith@msujith.org>
Date: Fri, 21 Nov 2014 19:05:41 +0200
In-Reply-To: <1416492382-18058-1-git-send-email-sujith@msujith.org> (Sujith
 Manoharan's message of "Thu, 20 Nov 2014 19:36:22 +0530")
Message-ID: <87k32obi1m.fsf@kamboji.qca.qualcomm.com>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sujith Manoharan <sujith@msujith.org> writes:

> From: Sujith Manoharan <c_manoha@qca.qualcomm.com>
>
> When static keys are used in shared WEP, when a
> station is associated, message 3 is sent with an
> encrypted payload. But, for subsequent
> authentications that are triggered without a
> deauth, the auth frame is decrypted by the HW. To
> handle this, check if the WEP keys have already
> been set for the peer and if so, mark the
> frame as decrypted.
>
> Signed-off-by: Sujith Manoharan <c_manoha@qca.qualcomm.com>

[...]

> +		if (peer_key) {
> +			ath10k_dbg(ar, ATH10K_DBG_MAC,
> +				   "wep key present for peer: %pM\n", addr);
> +			status->flag |= RX_FLAG_DECRYPTED;
> +		}
> +	}
> +
> +}

A checkpatch warning:

drivers/net/wireless/ath/ath10k/wmi.c:1141: CHECK: Blank lines aren't necessary before a close brace '}'

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
