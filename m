Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3P5n-0004tr-Hx
 for ath10k@lists.infradead.org; Fri, 12 Jun 2015 13:33:55 +0000
Message-ID: <557ADFAD.5080004@candelatech.com>
Date: Fri, 12 Jun 2015 06:33:33 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: enable VHT for IBSS
References: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
 <87mw06bab5.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=pD+ROqjhYOXsjb7Dc=XGp+YZy6w445ipC4cOGOYUEA3g@mail.gmail.com>
In-Reply-To: <CALhHN=pD+ROqjhYOXsjb7Dc=XGp+YZy6w445ipC4cOGOYUEA3g@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 06/11/2015 10:12 PM, Janusz Dziedzic wrote:
> On 11 June 2015 at 16:15, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>
>>> Enable VHT support for IBSS, while mac80211/cfg80211 and
>>> wpa_supplicant already support this.
>>>
>>> In my test env, ath10k 2x2 I get:
>>> (udp) ath10k-1 >>>> ath10k-2 (server) -  speed: 419 Mbits/sec
>>> (tcp) ath10k-1 >>>> ath10k-2 (server) -  speed: 404 Mbits/sec
>>
>> What hw and firmware version? Do you expect this to work with both
>> qca988x and qca6174?
>>
> Results are for qca9888x.
> But IBSS (VHT IBSS) works correctly also with qca6174 FW.
>
>> Oh, we should still add ATH10K_FW_FEATURE_NO_ADHOC so that we can
>> disable ad-hoc on 10.x firmwares. Anyone have some spare time to cook up
>> a patch?
>>
> I am not sure we need this, while we add
> ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC)
> only for main and tlv version. Seems we already cover 10.x case correctly.

If you give me some way to advertise my CT 10.1 firmware supports ADHOC
mode in the upstream driver then there will be one more firmware
variant that works with IBSS in stock kernels....

Maybe a feature flag 'ATH10K_FW_FEATURE_SUPPORTS_ADHOC' ?  You can special case
older firmware that is known to support ADHOC but has no feature
flag for it.  And new firmware could add the feature flag as needed.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
