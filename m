Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x235.google.com ([2a00:1450:400c:c00::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VVkfA-0003lz-4g
 for ath10k@lists.infradead.org; Mon, 14 Oct 2013 16:06:33 +0000
Received: by mail-wg0-f53.google.com with SMTP id y10so4923031wgg.32
 for <ath10k@lists.infradead.org>; Mon, 14 Oct 2013 09:06:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fvs3etz6.fsf@kamboji.qca.qualcomm.com>
References: <1381749381-15459-1-git-send-email-bartosz.markowski@tieto.com>
 <87fvs3etz6.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 14 Oct 2013 18:06:06 +0200
Message-ID: <CACKGw+HC1goQ_BdAqHkQSFhtSbZuqCLFRZTEJjgUSLQRgQ436A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: do not warn about unsupported vdev param
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

On 14 October 2013 17:46, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> 10.X firmware does not support WMI_VDEV_PARAM_TX_ENCAP_TYPE.
>> It's a known limitation and we should not warn about this.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 049eca2..9c800f8 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -2085,7 +2085,9 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
>>       vdev_param = ar->wmi.vdev_param->tx_encap_type;
>>       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, vdev_param,
>>                                       ATH10K_HW_TXRX_NATIVE_WIFI);
>> -     if (ret)
>> +
>> +     /* 10.X firmware does not support this VDEV parameter. Do not warn */
>> +     if (ret && !test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>>               ath10k_warn("Failed to set TX encap: %d\n", ret);
>
> But why call ath10k_wmi_vdev_set_param() even if we know it won't work?
> IMHO it's cleaner not to call it at all when ATH10K_FW_FEATURE_WMI_10X
> is set.

I tend to agree. Intention was to keep things generic and just hide the warning.

> Or if we want to avoid using ATH10K_FW_FEATURE_WMI_10X we could also
> change ath10k_wmi_pdev_set_param() to return -EOPNOTSUPP and check for
> that.

I like the second idea. I will send a v2 patch.

-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
