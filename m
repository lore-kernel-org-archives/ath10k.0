Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adXIj-0004aQ-FY
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 06:08:54 +0000
MIME-Version: 1.0
Date: Wed, 09 Mar 2016 11:38:31 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v4] ath10k: move mgmt descriptor limit handle under mgmt_tx
In-Reply-To: <CA+BoTQmxg7vK6KBENrx+P3vK_nYV4-h_yiavEBQi1oFTAANR=w@mail.gmail.com>
References: <1457457934-8563-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CA+BoTQmxg7vK6KBENrx+P3vK_nYV4-h_yiavEBQi1oFTAANR=w@mail.gmail.com>
Message-ID: <8a472460d3b4aa7ce614bdfe73b29844@codeaurora.org>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org

On , Michal Kazior wrote:
> On 8 March 2016 at 18:25, Rajkumar Manoharan 
> <rmanohar@qti.qualcomm.com> wrote:
> [...]
>> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
>> @@ -2326,7 +2326,12 @@ void ath10k_htt_t2h_msg_handler(struct ath10k 
>> *ar, struct sk_buff *skb)
>>                         break;
>>                 }
>> 
>> -               ath10k_txrx_tx_unref(htt, &tx_done);
>> +               status = ath10k_txrx_tx_unref(htt, &tx_done);
>> +               if (!status) {
>> +                       spin_lock_bh(&htt->tx_lock);
>> +                       ath10k_htt_tx_mgmt_dec_pending(htt);
>> +                       spin_unlock_bh(&htt->tx_lock);
>> +               }
> [...]
>> @@ -3978,14 +3976,13 @@ static void ath10k_mac_op_tx(struct 
>> ieee80211_hw *hw,
>>         txpath = ath10k_mac_tx_h_get_txpath(ar, skb, txmode);
>>         is_htt = (txpath == ATH10K_MAC_TX_HTT ||
>>                   txpath == ATH10K_MAC_TX_HTT_MGMT);
>> +       is_mgmt = (txpath == ATH10K_MAC_TX_HTT_MGMT);
> 
> Are you sure you want to be counting nullfuncs here in as well (and
> possibly other frames that end up, for whatever reason, on htt-mgmt
> tx-path?)
> 

frames that are transmitted via MGMT_TX are using reserved descriptor 
slots in firmware. So irrespective of frame type, num_pending_mgmt_tx 
should count all to limit probe resp. Here mgmt_tx does not mean frame 
type but HTT txmode (HTT_H2T_MSG_TYPE_MGMT_TX).

So ATH10K_SKB_F_MGMT check in tx-compl is not needed. is_mgmt = (txpath 
== ATH10K_MAC_TX_HTT_MGMT);

Do you see any issues if nullfunc/other data via MGMT_TX are counted.

-Rajkumar


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
