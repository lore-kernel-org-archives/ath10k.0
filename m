Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLgO1-0000Uh-UZ
 for ath10k@lists.infradead.org; Mon, 16 Sep 2013 21:31:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 3/4] ath10k: cleanup RX decap handling
References: <1379335757-15180-1-git-send-email-michal.kazior@tieto.com>
 <1379335757-15180-4-git-send-email-michal.kazior@tieto.com>
Date: Tue, 17 Sep 2013 00:30:50 +0300
In-Reply-To: <1379335757-15180-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 16 Sep 2013 14:49:16 +0200")
Message-ID: <8738p4laid.fsf@qca.qualcomm.com>
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

> Native Wifi frames are always decapped as non-QoS
> data frames meaning mac80211 couldn't set sk_buff
> priority properly. The patch fixes this by using
> the original 802.11 header.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

The patch title doesn't seem to match with the content. Unless I'm
mistaken it looks like you are adding native wifi frame format support
and doing some cleanup at the same time. They should be in separate
patches.

> @@ -652,6 +652,19 @@ static void ath10k_htt_rx_amsdu(struct ath10k_htt *htt,
>  			skb_trim(skb, skb->len - FCS_LEN);
>  			break;
>  		case RX_MSDU_DECAP_NATIVE_WIFI:
> +			hdr = (struct ieee80211_hdr *)skb->data;
> +			hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +			memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
> +			skb_pull(skb, hdr_len);
> +
> +			hdr = (struct ieee80211_hdr *)hdr_buf;
> +			hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +			memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
> +
> +			hdr = (struct ieee80211_hdr *)skb->data;
> +			qos = ieee80211_get_qos_ctl(hdr);
> +			qos[0] &= ~IEEE80211_QOS_CTL_A_MSDU_PRESENT;
> +			memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
>  			break;

It would be good to have small comments what each part is doing("remove
the native wifi header", "copy the real 802.11 header", "copy correct
destination address" etc), makes it a lot faster to skim the code. Also
document why IEEE80211_QOS_CTL_A_MSDU_PRESENT needs to be cleared.

>  	case RX_MSDU_DECAP_RAW:
> -		/* remove trailing FCS */
> -		skb_trim(skb, skb->len - 4);
> +		skb_trim(skb, skb->len - FCS_LEN);
>  		break;

Please keep the comment still

>  	case RX_MSDU_DECAP_NATIVE_WIFI:
> -		/* nothing to do here */
> +		hdr = (struct ieee80211_hdr *)skb->data;
> +		hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +		memcpy(addr, ieee80211_get_DA(hdr), ETH_ALEN);
> +		skb_pull(skb, hdr_len);
> +
> +		hdr = (struct ieee80211_hdr *)rxd->rx_hdr_status;
> +		hdr_len = ieee80211_hdrlen(hdr->frame_control);
> +		memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
> +
> +		hdr = (struct ieee80211_hdr *)skb->data;
> +		memcpy(ieee80211_get_DA(hdr), addr, ETH_ALEN);
>  		break;

Again add small comments describing how we are modifying the headers.

>  	case RX_MSDU_DECAP_ETHERNET2_DIX:
> -		/* macaddr[6] + macaddr[6] + ethertype[2] */
> -		skb_pull(skb, 6 + 6 + 2);
> +		rfc1042 = hdr;
> +		rfc1042 += roundup(hdr_len, 4);
> +		rfc1042 += roundup(ath10k_htt_rx_crypto_param_len(enctype), 4);
> +
> +		skb_pull(skb, sizeof(struct ethhdr));
> +		memcpy(skb_push(skb, sizeof(struct rfc1042_hdr)),
> +		       rfc1042, sizeof(struct rfc1042_hdr));
> +		memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
>  		break;

Ditto.

>  	case RX_MSDU_DECAP_8023_SNAP_LLC:
> -		/* macaddr[6] + macaddr[6] + len[2] */
> -		/* we don't need this for non-A-MSDU */
> -		skb_pull(skb, 6 + 6 + 2);
> +		skb_pull(skb, sizeof(struct amsdu_subframe_hdr));
> +		memcpy(skb_push(skb, hdr_len), hdr, hdr_len);
>  		break;

And here.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
