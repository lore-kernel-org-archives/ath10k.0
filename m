Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdFIC-0008Dd-Kd
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:46:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
 <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
Date: Thu, 24 Apr 2014 11:45:24 +0300
In-Reply-To: <CAEFj986h0FtMOpbTbYYQzLxZrEcL_og0+qpQkfj36xMWM9LG5g@mail.gmail.com>
 (Yeoh Chun-Yeow's message of "Thu, 24 Apr 2014 16:40:24 +0800")
Message-ID: <878uqvm7yz.fsf@kamboji.qca.qualcomm.com>
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

>>> +     if (ar->fw_version_build == 636) {
>>
>> Checking for firmware version in ath10k is a big no. For a functinality
>> change like this you should add a new feature flag to enum
>> ath10k_fw_features (and I need to then recreate the firmware image).
>>
> Should we just use the ATH10K_FW_FEATURE_WMI_10X?

That's a bit dangerous if in the future there's a new firmware which
doesn't have ATH10K_FW_FEATURE_WMI_10X but still doesn't support stand
alone monitor mode.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
