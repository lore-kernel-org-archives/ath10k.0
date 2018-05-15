Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-db5eur01on0081.outbound.protection.outlook.com
 ([104.47.2.81] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIfbA-0004Y6-Qh
 for ath10k@lists.infradead.org; Tue, 15 May 2018 19:27:02 +0000
Subject: Fwd: Re: [PATCHv2 2/2] ath10k: DFS Host Confirmation
References: <72826487-2af6-3c16-e7f8-3b2592416f9d@bowerswilkins.com>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <cf2b6989-cd97-68c5-8e6a-1e0c80cb9c7d@bowerswilkins.com>
Date: Tue, 15 May 2018 12:26:34 -0700
MIME-Version: 1.0
In-Reply-To: <72826487-2af6-3c16-e7f8-3b2592416f9d@bowerswilkins.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sriram R <srirrama@codeaurora.org>, Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

> +	/* Even in case of radar detection failure we follow the same
> +	 * behaviour as if radar is detected i.e to switch to a different
> +	 * channel.
> +	 */
> +	if (status_arg.status == WMI_HW_RADAR_DETECTED ||
> +	    status_arg.status == WMI_RADAR_DETECTION_FAIL)
> +		ath10k_radar_detected(ar);
>
This behavior is different from what Kalle explained.
Failing verification of radar type by FW does not enforce stop DFS
channels from using.
Kalle?


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
