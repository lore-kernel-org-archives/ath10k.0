Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z3HGb-0004zL-Gj
 for ath10k@lists.infradead.org; Fri, 12 Jun 2015 05:12:34 +0000
Received: by wiga1 with SMTP id a1so5784554wig.0
 for <ath10k@lists.infradead.org>; Thu, 11 Jun 2015 22:12:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mw06bab5.fsf@kamboji.qca.qualcomm.com>
References: <1433913284-18444-1-git-send-email-janusz.dziedzic@tieto.com>
 <87mw06bab5.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 12 Jun 2015 07:12:05 +0200
Message-ID: <CALhHN=pD+ROqjhYOXsjb7Dc=XGp+YZy6w445ipC4cOGOYUEA3g@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: enable VHT for IBSS
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 11 June 2015 at 16:15, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>
>> Enable VHT support for IBSS, while mac80211/cfg80211 and
>> wpa_supplicant already support this.
>>
>> In my test env, ath10k 2x2 I get:
>> (udp) ath10k-1 >>>> ath10k-2 (server) -  speed: 419 Mbits/sec
>> (tcp) ath10k-1 >>>> ath10k-2 (server) -  speed: 404 Mbits/sec
>
> What hw and firmware version? Do you expect this to work with both
> qca988x and qca6174?
>
Results are for qca9888x.
But IBSS (VHT IBSS) works correctly also with qca6174 FW.

> Oh, we should still add ATH10K_FW_FEATURE_NO_ADHOC so that we can
> disable ad-hoc on 10.x firmwares. Anyone have some spare time to cook up
> a patch?
>
I am not sure we need this, while we add
ar->hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_ADHOC)
only for main and tlv version. Seems we already cover 10.x case correctly.


>> During tests I used wpa_supplicant (current version)
>
> Better to say "current git version" (if that's what you mean).
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
