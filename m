Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7MAU-0003wH-JI
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 09:06:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 3/3] ath10k: add support for HTT 3.0
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1375949298-7159-4-git-send-email-michal.kazior@tieto.com>
Date: Thu, 8 Aug 2013 12:05:32 +0300
In-Reply-To: <1375949298-7159-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 10:08:18 +0200")
Message-ID: <87eha4363n.fsf@kamboji.qca.qualcomm.com>
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

> New firmware comes with new HTT protocol version.
> In 3.0 the separate mgmt tx command has been
> removed. All traffic is to be pushed through data
> tx (tx_frm) command with a twist - FW seems to not
> be able (yet?) to access tx fragment table so for
> manamgement frames frame pointer is passed
> directly.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  static int ath10k_htt_verify_version(struct ath10k_htt *htt)
>  {
> -	ath10k_dbg(ATH10K_DBG_HTT,
> -		   "htt target version %d.%d; host version %d.%d\n",
> -		    htt->target_version_major,
> -		    htt->target_version_minor,
> -		    HTT_CURRENT_VERSION_MAJOR,
> -		    HTT_CURRENT_VERSION_MINOR);
> -
> -	if (htt->target_version_major != HTT_CURRENT_VERSION_MAJOR) {
> +	ath10k_dbg(ATH10K_DBG_HTT, "htt target version %d.%d\n",
> +		   htt->target_version_major, htt->target_version_minor);

This debug print is good to have, but with the new htt version it would
be good to print it always using the info level. For example, can we add
it to the same line with "firmware %s booted" string?

(Please take into account that the info messages still need to be
compact, by default they should not be longer than five lines or so.)

> +	if (htt->target_version_major != 2 &&
> +	    htt->target_version_major != 3) {
>  		ath10k_err("htt major versions are incompatible!\n");
>  		return -ENOTSUPP;
>  	}

Print the htt version in the error message as well?

> @@ -401,10 +401,15 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
>  		goto err;
>  	}
>  
> -	txfrag = dev_alloc_skb(frag_len);
> -	if (!txfrag) {
> -		res = -ENOMEM;
> -		goto err;
> +	/* Since HTT 3.0 there is no separate mgmt tx command. However in case
> +	 * of mgmt tx using TX_FRM there is not tx fragment list. Instead of tx
> +	 * fragment list host driver specifies directly frame pointer. */
> +	if (!(htt->target_version_major >= 3 && ieee80211_is_mgmt(hdr->frame_control))) {

I think using "< 3" is more readable:

if (htt->target_version_major < 3 &&
   !ieee80211_is_mgmt(hdr->frame_control)) {
        ...
}

And is the single line too long? Didn't count it, though.

> @@ -427,23 +432,30 @@ int ath10k_htt_tx(struct ath10k_htt *htt, struct sk_buff *msdu)
>  	if (res)
>  		goto err;
>  
> -	/* tx fragment list must be terminated with zero-entry */
> -	skb_put(txfrag, frag_len);
> -	tx_frags = (struct htt_data_tx_desc_frag *)txfrag->data;
> -	tx_frags[0].paddr = __cpu_to_le32(ATH10K_SKB_CB(msdu)->paddr);
> -	tx_frags[0].len   = __cpu_to_le32(msdu->len);
> -	tx_frags[1].paddr = __cpu_to_le32(0);
> -	tx_frags[1].len   = __cpu_to_le32(0);
> -
> -	res = ath10k_skb_map(dev, txfrag);
> -	if (res)
> -		goto err;
> +	/* Since HTT 3.0 there is no separate mgmt tx command. However in case
> +	 * of mgmt tx using TX_FRM there is not tx fragment list. Instead of tx
> +	 * fragment list host driver specifies directly frame pointer. */
> +	if (!(htt->target_version_major >= 3 && ieee80211_is_mgmt(hdr->frame_control))) {

Ditto.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
