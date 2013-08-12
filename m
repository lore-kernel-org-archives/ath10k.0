Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8tXo-0003bN-C0
 for ath10k@lists.infradead.org; Mon, 12 Aug 2013 14:56:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/4] ath10k: implement 802.3 SNAP rx decap type A-MSDU
 handling
References: <1375949813-10969-1-git-send-email-michal.kazior@tieto.com>
 <1375949813-10969-4-git-send-email-michal.kazior@tieto.com>
Date: Mon, 12 Aug 2013 17:55:42 +0300
In-Reply-To: <1375949813-10969-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 10:16:52 +0200")
Message-ID: <878v07t0up.fsf@kamboji.qca.qualcomm.com>
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

> This enables driver to rx another decapped a-msdu
> frames. It should possibly help with throughputs
> in some cases and reduce (or eliminate) number of
> messages like this:
>
>   ath10k: error processing msdus -524
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -659,6 +658,15 @@ static int ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
>  			decap_hdr += roundup(crypto_len, 4);
>  		}
>  
> +		if (fmt == RX_MSDU_DECAP_8023_SNAP_LLC) {
> +			/* SNAP 802.3 consists of:
> +			 * [dst:6][src:6][len:2][dsap:1][ssap:1][ctl:1][snap:5]
> +			 * [data][fcs:4].
> +			 *
> +			 * Since this overlaps with A-MSDU header (da, sa, len)
> +			 * there's nothing extra to do. */
> +		}

This block doesn't have any code, is that on purpose? Most likely a
static checker finds this later and we need to remove it.

If your idea is to document the LLC case (which is very good!) it's
better to do everything inside a comment, for example like this:

	/* When fmt == RX_MSDU_DECAP_8023_SNAP_LLC:
         *
         * SNAP 802.3 consists of:
	 * [dst:6][src:6][len:2][dsap:1][ssap:1][ctl:1][snap:5]
	 * [data][fcs:4].
	 *
	 * Since this overlaps with A-MSDU header (da, sa, len)
	 * there's nothing extra to do. */

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
