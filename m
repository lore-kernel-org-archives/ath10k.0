Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdGFG-0003OI-9S
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 09:47:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
 <878uqvm7yz.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986VVHkgSnv=xGo_WAYg+n4Sp0_qJGkpmzjNk9thoizZCA@mail.gmail.com>
Date: Thu, 24 Apr 2014 12:46:36 +0300
In-Reply-To: <CAEFj986VVHkgSnv=xGo_WAYg+n4Sp0_qJGkpmzjNk9thoizZCA@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Thu, 24 Apr 2014 17:19:10 +0800")
Message-ID: <874n1jm54z.fsf@kamboji.qca.qualcomm.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:

> On Thu, Apr 24, 2014 at 4:45 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>>
>>>>> +     if (ar->fw_version_build == 636) {
>>>>
>>>> Checking for firmware version in ath10k is a big no. For a functinality
>>>> change like this you should add a new feature flag to enum
>>>> ath10k_fw_features (and I need to then recreate the firmware image).
>>>>
>>> Should we just use the ATH10K_FW_FEATURE_WMI_10X?
>>
>> That's a bit dangerous if in the future there's a new firmware which
>> doesn't have ATH10K_FW_FEATURE_WMI_10X but still doesn't support stand
>> alone monitor mode.
>
> Then, we may need to introduce the new feature flag.

And that will create other problems. It's better to bite the bullet now
than trying to postpone it. Besides, adding the feature flag is trivial.

> But then I just wondering if the firmware 636 claimed to support STA
> mode "well" but then not allowed to be bridged. This may cause
> confusion to end user which is the best firmware for STA mode. FYI, AP
> firmware has no such issue if using as STA mode and put into
> promiscuous mode.

Yeah, maybe should change the documentation to recommend using 10.1
branch for AP, STA and monitor modes? And recommended main branch only
for Ad-Hoc and P2P?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
