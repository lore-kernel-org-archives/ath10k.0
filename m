Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adKjK-0001HA-KT
 for ath10k@lists.infradead.org; Tue, 08 Mar 2016 16:43:31 +0000
MIME-Version: 1.0
Date: Tue, 08 Mar 2016 22:13:09 +0530
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: move mgmt descriptor limit handle under mgmt_tx
In-Reply-To: <CA+BoTQk3i9QjF-W_1AZpMcwyceO-KDx8=R-swP0J-thqdxRcMg@mail.gmail.com>
References: <1457438096-20071-1-git-send-email-rmanohar@qti.qualcomm.com>
 <CA+BoTQ=Huzf7WoXMXcyj8yrykrJOd5BMc1EnmccqZgt7M1M_uA@mail.gmail.com>
 <aa44bd32c9f94d8d1a90840189ac0602@codeaurora.org>
 <CA+BoTQk3i9QjF-W_1AZpMcwyceO-KDx8=R-swP0J-thqdxRcMg@mail.gmail.com>
Message-ID: <3f8bfeb73178ec267d088f91a2f0350a@codeaurora.org>
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
> On 8 March 2016 at 13:54, Rajkumar Manoharan <rmanohar@codeaurora.org> 
> wrote:
>> On , Michal Kazior wrote:
>>> 
>>> On 8 March 2016 at 12:54, Rajkumar Manoharan 
>>> <rmanohar@qti.qualcomm.com>
>>> wrote:
...]
>>>> 
>>>>         skb_cb = ATH10K_SKB_CB(msdu);
>>>>         txq = skb_cb->txq;
>>>>         artxq = (void *)txq->drv_priv;
>>>> 
>>>> -       if (unlikely(skb_cb->flags & ATH10K_SKB_F_MGMT) &&
>>>> -           ar->hw_params.max_probe_resp_desc_thres)
>>>> -               limit_mgmt_desc = true;
>>>> -
>>> 
>>> 
>>> Oh wait.. I didn't pay attention before, but this looks rather ugly.
>>> With this you will actually make the num_pending_mgmt_tx spin
>>> endlessly upwards on firmware with HTT 3.0 (and uses TX_FRM for mgmt
>>> tx and TX_COMPL_IND for completions), no?
>>> 
>> Oops.. num_pending_mgmt_tx should be incremented only for MGMT_TX. 
>> Thats
>> why it is moved out of txrx_tx_unref.
> 
> Hmm.. in that case I think you should change is_htt in mac_op_tx() to
> compare only against TX_HTT_MGMT (instead of both TX_HTT and
> TX_HTT_MGMT).
> 
> Note, the is_mgmt should stay as it is possible for the TX_HTT_MGMT to
> be used for non-mgmt frames in some cases. This also implies you need
> to check for ATH10K_SKB_F_MGMT on the mgmt-tx-completion event as well
> (you might get to handle NullFunc there).
> 
If a frame is transmitted via MGMT_TX, the reserved descriptor slots 
will be
used in firmware. So irrespective of type,  num_pending_mgmt_tx should 
count
all frames that are transmitted via MGMT_TX to control probe resp. Here 
mgmt_tx
does not mean frame type but HTT tx type (HTT_H2T_MSG_TYPE_MGMT_TX).

So ATH10K_SKB_F_MGMT check in tx-compl is not needed. As you pointed 
out,
since nullfunc also uses MGMT_TX, is_mgmt should be as below. (not frame 
type)

is_mgmt = (txpath == ATH10K_MAC_TX_HTT_MGMT);

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
