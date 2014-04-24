Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFD8-0006aj-5Z
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:40:50 +0000
Received: by mail-vc0-f169.google.com with SMTP id im17so2677195vcb.28
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 01:40:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 24 Apr 2014 16:40:24 +0800
Message-ID: <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Apr 24, 2014 at 4:22 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:
>
>> Firmware 999.999.0.636 does not allow stand alone monitor
>> mode. This means that bridging the STA mode and put it into
>> promiscuous mode will also cause the firmware to crash. Avoid
>> this.
>>
>> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
>
> [...]
>
>> @@ -647,10 +647,15 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
>>
>>  static int ath10k_monitor_start(struct ath10k *ar)
>>  {
>> -     int ret;
>> +     int ret = -1;
>
> I prefer to avoid initialising ret variables. And -1 is not a proper
> error value.
>
Ok.

>>       lockdep_assert_held(&ar->conf_mutex);
>>
>> +     if (ar->fw_version_build == 636) {
>
> Checking for firmware version in ath10k is a big no. For a functinality
> change like this you should add a new feature flag to enum
> ath10k_fw_features (and I need to then recreate the firmware image).
>
Should we just use the ATH10K_FW_FEATURE_WMI_10X?

>> +             ath10k_warn("stand alone monitor mode is not supported\n");
>
> I would prefer not to print a warning for a situation like this. Can't
> we instead return an error value back to the caller?
>
Yes.

>> +             return ret;
>
> return -EOPNOTSUPP or similar is better approach than initialising ret
> to -1.
Sure.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
