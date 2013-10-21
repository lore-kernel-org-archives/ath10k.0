Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VY9Mb-0002yD-OD
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 06:53:19 +0000
Received: by mail-wg0-f47.google.com with SMTP id c11so5979221wgh.2
 for <ath10k@lists.infradead.org>; Sun, 20 Oct 2013 23:52:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mwm3uoep.fsf@kamboji.qca.qualcomm.com>
References: <1382090878-22216-1-git-send-email-bartosz.markowski@tieto.com>
 <87mwm3uoep.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 21 Oct 2013 08:52:54 +0200
Message-ID: <CACKGw+GgYwu-oQ12LjPm3FLKQ5PDG+KUVgoEM=KGH8q+SWvmBQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: remove P2P from supported interface modes for
 10.X FW
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

On 21 October 2013 08:30, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Bartosz Markowski <bartosz.markowski@tieto.com> writes:
>
>> FW 10.X does not support P2P, stop advertising it to mac80211.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>
> [...]
>
>> @@ -3478,7 +3504,11 @@ int ath10k_mac_register(struct ath10k *ar)
>>        */
>>       ar->hw->queues = 4;
>>
>> -     ar->hw->wiphy->iface_combinations = &ath10k_if_comb;
>> +     if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>> +             ar->hw->wiphy->iface_combinations = &ath10k_10x_if_comb;
>> +     else
>> +             ar->hw->wiphy->iface_combinations = &ath10k_if_comb;
>
> I think it would be better to have a separate feature flag for this,
> like NO_P2P or something like that. Just in case we want to disable P2P
> in other firmware branches.

Make sense. I will change this.


-- 
Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
