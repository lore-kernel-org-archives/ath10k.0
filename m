Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr20042.outbound.protection.outlook.com ([40.107.2.42]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fIfYD-0008Uy-74
 for ath10k@lists.infradead.org; Tue, 15 May 2018 19:23:58 +0000
Subject: Re: [PATCHv2 2/2] ath10k: DFS Host Confirmation
References: <1526375272-7056-1-git-send-email-srirrama@codeaurora.org>
 <1526375272-7056-3-git-send-email-srirrama@codeaurora.org>
From: Peter Oh <peter.oh@bowerswilkins.com>
Message-ID: <72826487-2af6-3c16-e7f8-3b2592416f9d@bowerswilkins.com>
Date: Tue, 15 May 2018 12:23:30 -0700
MIME-Version: 1.0
In-Reply-To: <1526375272-7056-3-git-send-email-srirrama@codeaurora.org>
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
To: Sriram R <srirrama@codeaurora.org>, kvalo@codeaurora.org, ath10k@lists.infradead.org
Cc: linux-wirelss@vger.kernel.org


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
