Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDy5x-0002NN-Vu
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 15:20:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix SMPS support
References: <1391673591-8907-1-git-send-email-michal.kazior@tieto.com>
 <87eh379jcm.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnC3uVQguO8U+nP9Q7mLypZ77hVBaiS-tqxSMBh6Ph4xQ@mail.gmail.com>
Date: Thu, 13 Feb 2014 17:20:31 +0200
In-Reply-To: <CA+BoTQnC3uVQguO8U+nP9Q7mLypZ77hVBaiS-tqxSMBh6Ph4xQ@mail.gmail.com>
 (Michal Kazior's message of "Thu, 13 Feb 2014 15:47:21 +0100")
Message-ID: <87lhxf82f4.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 13 February 2014 15:29, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> +static const u32 ath10k_smps_map[] = {
>>> +     [WLAN_HT_CAP_SM_PS_STATIC] = WMI_PEER_SMPS_STATIC,
>>> +     [WLAN_HT_CAP_SM_PS_DYNAMIC] = WMI_PEER_SMPS_DYNAMIC,
>>> +     [WLAN_HT_CAP_SM_PS_INVALID] = WMI_PEER_SMPS_PS_NONE,
>>> +     [WLAN_HT_CAP_SM_PS_DISABLED] = WMI_PEER_SMPS_PS_NONE,
>>> +};
>>> +
>>> +static int ath10k_setup_peer_smps(struct ath10k *ar, struct ath10k_vif *arvif,
>>> +                               const u8 *addr,
>>> +                               const struct ieee80211_sta_ht_cap *ht_cap)
>>> +{
>>> +     int smps;
>>> +
>>> +     if (!ht_cap->ht_supported)
>>> +             return 0;
>>> +
>>> +     smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
>>> +     smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
>>> +
>>> +     if (smps >= ARRAY_SIZE(ath10k_smps_map))
>>> +             return -EINVAL;
>>> +
>>> +     return ath10k_wmi_peer_set_param(ar, arvif->vdev_id, addr,
>>> +                                      WMI_PEER_SMPS_STATE,
>>> +                                      ath10k_smps_map[smps]);
>>> +}
>>
>> ath10k_smps_map looks overkill (and fragile), wouldn't a switch
>> statement be simpler?
>
> The map shouldn't really ever change since it depends on the 11n spec.
> I just prefer it this way as it's shorter and easier to grasp. I can
> change it to a switch() if you insist.

No, I do not insist. I guess this is ok in this case.

But I just think that with a switch it's almost impossible to get this
wrong, but with a table you have to be very careful not to break
anything (reading out of bounds, missing enums etc). And with switch you
automatically get compiler to check that all enums values are checked. I
would just prefer to have safe code over clever hacks, even if it means
few lines longer code.

>>> @@ -1370,6 +1385,7 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
>>>  {
>>>       struct ath10k *ar = hw->priv;
>>>       struct ath10k_vif *arvif = ath10k_vif_to_arvif(vif);
>>> +     struct ieee80211_sta_ht_cap ht_cap;
>>>       struct wmi_peer_assoc_complete_arg peer_arg;
>>>       struct ieee80211_sta *ap_sta;
>>>       int ret;
>>> @@ -1386,6 +1402,8 @@ static void ath10k_bss_assoc(struct ieee80211_hw *hw,
>>>               return;
>>>       }
>>>
>>> +     ht_cap = ap_sta->ht_cap;
>>
>> Why do you copy ht_cap? I can't figure out the reason.
>
> It is used by ath10k_setup_peer_smps() which might sleep as it sends
> wmi command. This means we have to leave rcu section and must not
> touch ap_sta pointer anymore.

Can you add a comment for that, please?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
