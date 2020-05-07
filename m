Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWnXt-0000Z5-6Z
 for ath10k@lists.infradead.org; Thu, 07 May 2020 20:55:09 +0000
MIME-Version: 1.0
Date: Thu, 07 May 2020 13:54:56 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v2] ath10k: Replace zero-length array with flexible-array
In-Reply-To: <20200507041127.GA31587@embeddedor>
References: <20200507041127.GA31587@embeddedor>
Message-ID: <bbb33f11e8aaf6d482f923aee22aca39@codeaurora.org>
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
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-wireless-owner@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>

On 2020-05-06 21:11, Gustavo A. R. Silva wrote:
[...]
>  static inline struct htt_stats_conf_item *htt_stats_conf_next_item(
> @@ -1674,7 +1674,7 @@ struct htt_tx_fetch_ind {
>  	__le16 num_resp_ids;
>  	__le16 num_records;
>  	struct htt_tx_fetch_record records[0];
> -	__le32 resp_ids[0]; /* ath10k_htt_get_tx_fetch_ind_resp_ids() */
> +	__le32 resp_ids[]; /* ath10k_htt_get_tx_fetch_ind_resp_ids() */
>  } __packed;
> 
Missed to handle records[0].

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
