Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9bM1-0006vZ-Qc
 for ath10k@lists.infradead.org; Mon, 29 Jun 2015 15:52:23 +0000
Message-ID: <55916984.9050904@qti.qualcomm.com>
Date: Mon, 29 Jun 2015 21:21:32 +0530
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
MIME-Version: 1.0
Subject: Re: [PATCH V2 09/10] ath10k: Add support for code swap
References: <1434610870-5505-1-git-send-email-vthiagar@qti.qualcomm.com>	<1434610870-5505-10-git-send-email-vthiagar@qti.qualcomm.com>
 <87egku3gm8.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87egku3gm8.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Monday 29 June 2015 04:51 PM, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com> writes:
>
>> Code swap is a mechanism to use host memory to store
>> some fw binary code segment. Ath10k host driver allocates
>> and loads the code swap binary into the host memory and
>> configures the target with the host allocated memory
>> information at the address taken from code swap binary.
>> This patch adds code swap support for firmware binary.
>> Code swap binary for firmware bin is available in
>> ATH10K_FW_IE_FW_CODE_SWAP_IMAGE.
>>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>
> [...]
>
>> +static struct ath10k_swap_code_seg_info *
>> +ath10k_swap_code_seg_alloc(struct ath10k *ar, size_t swap_bin_len)
>> +{
>> +	struct ath10k_swap_code_seg_info *seg_info;
>> +	void *virt_addr;
>> +	dma_addr_t paddr;
>> +
>> +	swap_bin_len = roundup(swap_bin_len, 2);
>> +	if (swap_bin_len > ATH10K_SWAP_CODE_SEG_BIN_LEN_MAX) {
>> +		ath10k_err(ar, "refusing code swap bin because it is too big %zd > %d\n",
>> +			   swap_bin_len, ATH10K_SWAP_CODE_SEG_BIN_LEN_MAX);
>
> kbuild found a bug here, I fixed it with the patch below. Please review:
>
> --- a/drivers/net/wireless/ath/ath10k/swap.c
> +++ b/drivers/net/wireless/ath/ath10k/swap.c
> @@ -106,7 +106,7 @@ ath10k_swap_code_seg_alloc(struct ath10k *ar, size_t swap_bin_len)
>
>          swap_bin_len = roundup(swap_bin_len, 2);
>          if (swap_bin_len > ATH10K_SWAP_CODE_SEG_BIN_LEN_MAX) {
> -               ath10k_err(ar, "refusing code swap bin because it is too big %zd > %d\n",
> +               ath10k_err(ar, "refusing code swap bin because it is too big %zu > %d\n",
>                             swap_bin_len, ATH10K_SWAP_CODE_SEG_BIN_LEN_MAX);
>                  return NULL;
>          }

Looks good. Thanks.


Vasanth


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
