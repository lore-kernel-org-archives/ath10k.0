Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W0qYs-0000XR-8c
 for ath10k@lists.infradead.org; Wed, 08 Jan 2014 10:40:35 +0000
Received: by mail-lb0-f170.google.com with SMTP id c11so1161636lbj.15
 for <ath10k@lists.infradead.org>; Wed, 08 Jan 2014 02:40:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEFj987Rxv9azS4EmW47a5guhVT-JijXsxSOgcGfvgwLkB9tEg@mail.gmail.com>
References: <1388390871-3932-1-git-send-email-marek.puzyniak@tieto.com>
 <CAEFj987Rxv9azS4EmW47a5guhVT-JijXsxSOgcGfvgwLkB9tEg@mail.gmail.com>
Date: Wed, 8 Jan 2014 11:40:09 +0100
Message-ID: <CADnKcViXui6jCsBxgbYh5A2R4ra+p3YxBP-Om1cT5GaYjjAFPw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable STA KICKOUT in FW
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2 January 2014 13:41, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>
> On Dec 30, 2013 4:08 PM, "Marek Puzyniak" <marek.puzyniak@tieto.com> wrote:
>>
>> Currently ath10k is not using STA KICKOUT firmware functionality.
>> In order to avoid unwanted FW events this functionality should be
>> disabled when not used.
>
> What are unwanted FW events?

WMI_PEER_STA_KICKOUT_EVENT which indicates lack of activity from
associated STA for specified period of time.

>
> ----
> Chun-Yeow
Marek
>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>> b/drivers/net/wireless/ath/ath10k/mac.c
>> index 5b45f3a..93416ab 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -2292,11 +2292,20 @@ static int ath10k_add_interface(struct
>> ieee80211_hw *hw,
>>         }
>>
>>         if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
>> +               u32 param_id;
>> +
>>                 ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr);
>>                 if (ret) {
>>                         ath10k_warn("Failed to create peer for AP: %d\n",
>> ret);
>>                         goto err_vdev_delete;
>>                 }
>> +
>> +               param_id = ar->wmi.pdev_param->sta_kickout_th;
>> +
>> +               /* Disable STA KICKOUT functionality in FW */
>> +               ret = ath10k_wmi_pdev_set_param(ar, param_id, 0);
>> +               if (ret)
>> +                       ath10k_warn("Failed to disable STA KICKOUT\n");
>>         }
>>
>>         if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
>> --
>> 1.8.1.2
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
