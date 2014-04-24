Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yh0-f54.google.com ([209.85.213.54])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFod-0003Ml-Da
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 09:19:35 +0000
Received: by mail-yh0-f54.google.com with SMTP id f73so1946695yha.13
 for <ath10k@lists.infradead.org>; Thu, 24 Apr 2014 02:19:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878uqvm7yz.fsf@kamboji.qca.qualcomm.com>
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
 <878uqvm7yz.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 24 Apr 2014 17:19:10 +0800
Message-ID: <CAEFj986VVHkgSnv=xGo_WAYg+n4Sp0_qJGkpmzjNk9thoizZCA@mail.gmail.com>
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

On Thu, Apr 24, 2014 at 4:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>>>> +     if (ar->fw_version_build == 636) {
>>>
>>> Checking for firmware version in ath10k is a big no. For a functinality
>>> change like this you should add a new feature flag to enum
>>> ath10k_fw_features (and I need to then recreate the firmware image).
>>>
>> Should we just use the ATH10K_FW_FEATURE_WMI_10X?
>
> That's a bit dangerous if in the future there's a new firmware which
> doesn't have ATH10K_FW_FEATURE_WMI_10X but still doesn't support stand
> alone monitor mode.
>

Then, we may need to introduce the new feature flag.

But then I just wondering if the firmware 636 claimed to support STA
mode "well" but then not allowed to be bridged. This may cause
confusion to end user which is the best firmware for STA mode. FYI, AP
firmware has no such issue if using as STA mode and put into
promiscuous mode.

----
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
