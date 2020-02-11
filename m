Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1S7h-0008My-NV
 for ath10k@lists.infradead.org; Tue, 11 Feb 2020 09:46:33 +0000
MIME-Version: 1.0
Date: Tue, 11 Feb 2020 17:46:25 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v8 1/4] ath10k: disable TX complete indication of htt for
 sdio
In-Reply-To: <76bce8e3-e05b-ace6-3edd-54f522be3fe6@chromium.org>
References: <20191128103030.6429-1-wgong@codeaurora.org>
 <0101016eb1903db0-ef7063b4-0f42-4a01-8886-327541e6c1a4-000000@us-west-2.amazonses.com>
 <76bce8e3-e05b-ace6-3edd-54f522be3fe6@chromium.org>
Message-ID: <25fd4f59b39c56b2fee208713c7cbc57@codeaurora.org>
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
To: Pi-Hsun Shih <pihsun@chromium.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-02-11 15:03, Pi-Hsun Shih wrote:
> Hi,
> 
> On 11/28/19 6:30 PM, Wen Gong wrote:
>> ...
>> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c 
>> b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> index a182c0944cc7..c6c4b2a4d20f 100644
>> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
>> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
>> @@ -543,7 +543,35 @@ void ath10k_htt_tx_free(struct ath10k_htt *htt)
>>     void ath10k_htt_htc_tx_complete(struct ath10k *ar, struct sk_buff 
>> *skb)
>>   {
>> +	struct ath10k_htt *htt = &ar->htt;
>> +	struct htt_tx_done tx_done = {0};
>> +	struct htt_cmd_hdr *htt_hdr;
>> +	struct htt_data_tx_desc *desc_hdr;
>> +	u16 flags1;
>> +
>>   	dev_kfree_skb_any(skb);
>> +
>> +	if (!htt->disable_tx_comp)
>> +		return;
>> +
>> +	htt_hdr = (struct htt_cmd_hdr *)skb->data;
> 
> skb is already freed on the above line (dev_kfree_skb_any) but is
> still used here, should the dev_kfree_skb_any be moved to the end of
> this function?
> 
skb will not freed on the above line, please see this patch
https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers/net/wireless/ath/ath10k?h=ath-next&id=30382dd1cf3a141bfaa568ee183c1892090fa79a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
