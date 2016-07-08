Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yw0-x242.google.com ([2607:f8b0:4002:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLUOt-0001m5-P7
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 11:56:56 +0000
Received: by mail-yw0-x242.google.com with SMTP id l125so6795953ywb.1
 for <ath10k@lists.infradead.org>; Fri, 08 Jul 2016 04:56:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467972560885.99812@qti.qualcomm.com>
References: <CABPxzYLwye1t1Ycjr3nO5C18vc7OqS9dbbQ1yJ7B-YN+Bkx_PA@mail.gmail.com>
 <CABPxzYL5DHU7ZE1X1AibygBUz0TJEnNLLTp5_hDivmBBkjnVtg@mail.gmail.com>
 <1467972560885.99812@qti.qualcomm.com>
From: Krishna Chaitanya <chaitanya.mgit@gmail.com>
Date: Fri, 8 Jul 2016 17:26:15 +0530
Message-ID: <CABPxzY+8Y-FHUFALGueN1hQwgjJHNpeyy_BRkrM4osguxJZS0Q@mail.gmail.com>
Subject: Re: ath10k + iw set bitrates is causing FW crash
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On Fri, Jul 8, 2016 at 3:39 PM, Manoharan, Rajkumar
<rmanohar@qti.qualcomm.com> wrote:
>>> I am using ath10k driver with qca988x hw2.0 and trying to limit it to use
>>> VHT MCS0-7 (iw set bitrates vht-mcs-5 2:0-7).
>>>
>>> But the command it causing a FW crash, if it disable HW_HAS_RATE_CONTROL
>>> no crash is observed but it still uses MCS9.
>>>
>>> tree: wireless-drivers-next: commit#535633a5ba4ea2504fa6c33176633becf0e59339
>>>
>>> 1) If i disable HW_RATE_CONTROL, will ath10k honor
>>> the mac80211 rates?
>>>
>>
> Thanks for reporting the issue. Could you please try with below change?
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 5e1cc8f4c43c..cfa7e01a6103 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2812,6 +2812,9 @@ static int ath10k_station_assoc(struct ath10k *ar,
>                 return ret;
>         }
>
> +       if (vif->type != NL80211_IFTYPE_ADHOC)
> +               peer_arg.peer_reassoc = reassoc;
> +
>         ret = ath10k_wmi_peer_assoc(ar, &peer_arg);
>         if (ret) {
>                 ath10k_warn(ar, "failed to run peer assoc for STA %pM vdev %i: %d\n",

Thanks Raj, with this fix the rates are 0-7, if i disable then i am
seeing 0-9, so its
working.

But i am seeing a weird issues, the moment i give bitrates command,
ath10k no longer does encryption, link is a WPA2-PSK: AES. Even after
interface up/down
it doesn't work.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
