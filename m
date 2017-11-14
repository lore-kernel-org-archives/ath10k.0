Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eEjWq-0000Bm-13
 for ath10k@lists.infradead.org; Tue, 14 Nov 2017 22:18:03 +0000
Subject: Re: Anyone get txbf to work on ath10k when using the linux driver?
References: <5A0A21C7.20505@candelatech.com>
 <c685ebc0-4d7a-104d-7bf1-d143227f7d48@dd-wrt.com>
 <1d1fd019-cb3e-17e5-f7d5-dfe1debf95d5@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <36cea320-85b9-ed57-6573-bf64d0376930@candelatech.com>
Date: Tue, 14 Nov 2017 14:17:33 -0800
MIME-Version: 1.0
In-Reply-To: <1d1fd019-cb3e-17e5-f7d5-dfe1debf95d5@candelatech.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>, ath10k@lists.infradead.org

On 11/13/2017 07:10 PM, Ben Greear wrote:
>
>
> On 11/13/2017 06:05 PM, Sebastian Gottschall wrote:
>> Am 13.11.2017 um 23:50 schrieb Ben Greear:
>>> From what I can tell, the 10.4 firmware will not even enable txbf unless the driver
>>> tells it too, and I don't think the driver is doing the correct call to enable this
>>> (it is a testing interface hack, it appears).
>>>
>>> But, maybe I am missing something?
>> so the firmware does not take care about the vht flags?
>
> There is a flag to enable implicit beamforming, but it is mis-defined
> in the driver as far as I can tell:
>
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index ff15c37..9522f22 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -5195,7 +5195,8 @@ enum wmi_10_4_vdev_param {
>  #define WMI_VDEV_PARAM_TXBF_MU_TX_BFER BIT(3)
>
>  #define WMI_TXBF_STS_CAP_OFFSET_LSB    4
> -#define WMI_TXBF_STS_CAP_OFFSET_MASK   0xf0
> +#define WMI_TXBF_STS_CAP_OFFSET_MASK   0x70
> +#define WMI_TXBF_CONF_IMPLICIT_BF       BIT(7)
>  #define WMI_BF_SOUND_DIM_OFFSET_LSB    8
>  #define WMI_BF_SOUND_DIM_OFFSET_MASK   0xf00
>
>
> Possibly that bit is somehow set anyway, dunno.
>
> And the other explicit-beamforming appears to need a special hack to enable
> the feature in the firmware.
>
> But, someone using my firmware gets txbf to work, so I must be missing something.
>
> I will dig into it more tomorrow.

At least much of my confusion is that there is a bunch of logic in the rate-ctrl
code about txbf probing, and I was thinking that was what caused the sounding to happen.

I now realize that is a separate feature (that cannot be enabled w/out special
driver hacks not currently supported).

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
