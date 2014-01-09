Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1Bd4-00063U-Kf
 for ath10k@lists.infradead.org; Thu, 09 Jan 2014 09:10:19 +0000
Received: by mail-bk0-f46.google.com with SMTP id u15so1039219bkz.33
 for <ath10k@lists.infradead.org>; Thu, 09 Jan 2014 01:09:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CADnKcViXui6jCsBxgbYh5A2R4ra+p3YxBP-Om1cT5GaYjjAFPw@mail.gmail.com>
References: <1388390871-3932-1-git-send-email-marek.puzyniak@tieto.com>
 <CAEFj987Rxv9azS4EmW47a5guhVT-JijXsxSOgcGfvgwLkB9tEg@mail.gmail.com>
 <CADnKcViXui6jCsBxgbYh5A2R4ra+p3YxBP-Om1cT5GaYjjAFPw@mail.gmail.com>
Date: Thu, 9 Jan 2014 17:09:52 +0800
Message-ID: <CAEFj985kz+5DWx=hvDu=w=BEud0fJGbYMpUT939xVPbvFbXFPw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable STA KICKOUT in FW
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Marek Puzyniak <marek.puzyniak@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Hi, Marek

Do you mind to share which firmware that you are using?

I have tried your patch and this is set accordingly in an the AP (set
param 13). But once the associated STA is leaving,
WMI_PEER_STA_KICKOUT_EVENTID is still received.

[  145.060000] ath10k: wmi pdev set param 13 value 0
.......
[  148.560000] ath10k: wmi vdev id 0x0 set param 8 value 1
[  148.560000] ath10k: wmi peer create vdev_id 0 peer_addr 04:f0:21:0c:a5:44
[  148.560000] ath10k: wmi peer assoc vdev 0 addr 04:f0:21:0c:a5:44
[  149.040000] ath10k: wmi event debug mesg len 44
[  209.090000] ath10k: WMI_PEER_STA_KICKOUT_EVENTID
[  210.090000] ath10k: WMI_PEER_STA_KICKOUT_EVENTID

FYI, I am using firmware version 999.999.0.636

ethtool -i wlan0
driver: ath10k_pci
firmware-version: 999.999.0.636

Thanks

Regards,
Chun-Yeow


On Wed, Jan 8, 2014 at 6:40 PM, Marek Puzyniak <marek.puzyniak@tieto.com> wrote:
> On 2 January 2014 13:41, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>
>> On Dec 30, 2013 4:08 PM, "Marek Puzyniak" <marek.puzyniak@tieto.com> wrote:
>>>
>>> Currently ath10k is not using STA KICKOUT firmware functionality.
>>> In order to avoid unwanted FW events this functionality should be
>>> disabled when not used.
>>
>> What are unwanted FW events?
>
> WMI_PEER_STA_KICKOUT_EVENT which indicates lack of activity from
> associated STA for specified period of time.
>
>>
>> ----
>> Chun-Yeow
> Marek
>>
>>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>>> ---
>>>  drivers/net/wireless/ath/ath10k/mac.c | 9 +++++++++
>>>  1 file changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>>> b/drivers/net/wireless/ath/ath10k/mac.c
>>> index 5b45f3a..93416ab 100644
>>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>> @@ -2292,11 +2292,20 @@ static int ath10k_add_interface(struct
>>> ieee80211_hw *hw,
>>>         }
>>>
>>>         if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
>>> +               u32 param_id;
>>> +
>>>                 ret = ath10k_peer_create(ar, arvif->vdev_id, vif->addr);
>>>                 if (ret) {
>>>                         ath10k_warn("Failed to create peer for AP: %d\n",
>>> ret);
>>>                         goto err_vdev_delete;
>>>                 }
>>> +
>>> +               param_id = ar->wmi.pdev_param->sta_kickout_th;
>>> +
>>> +               /* Disable STA KICKOUT functionality in FW */
>>> +               ret = ath10k_wmi_pdev_set_param(ar, param_id, 0);
>>> +               if (ret)
>>> +                       ath10k_warn("Failed to disable STA KICKOUT\n");
>>>         }
>>>
>>>         if (arvif->vdev_type == WMI_VDEV_TYPE_STA) {
>>> --
>>> 1.8.1.2
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
