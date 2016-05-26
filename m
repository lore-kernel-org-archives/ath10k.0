Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b5z9U-0000XB-Py
 for ath10k@lists.infradead.org; Thu, 26 May 2016 17:32:57 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/2] ath10k: Add support for QCA9887
Date: Thu, 26 May 2016 17:32:30 +0000
Message-ID: <87mvnc67yq.fsf@kamboji.qca.qualcomm.com>
References: <1568876.Six5hABE57@bentobox>
In-Reply-To: <1568876.Six5hABE57@bentobox> (Sven Eckelmann's message of "Fri, 
 20 May 2016 16:40:46 +0200")
Content-Language: en-US
Content-ID: <BA4CB8A4A5E10A4C85C6F18289866AE8@qualcomm.com>
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
To: Sven Eckelmann <sven.eckelmann@open-mesh.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@open-mesh.com> writes:

> the QCA9887 chip is similar to the QCA988x chips. But it requires a special
> firmware and uses a different calibration data source. Unfortunately, no
> working firmware currently exists. But it is possible to create a semi working
> one by binary patching the current version.

So what works and what doesn't?

>     # download new fw + set ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX+ATH10K_FW_FEATURE_NO_P2P
>     curl -o firmware-5.bin https://raw.githubusercontent.com/kvalo/ath10k-firmware/master/QCA9887/firmware-5.bin_10.2.3.31.7-1
>     echo -en '\x0c'|dd conv=notrunc bs=1 seek=231112 of=firmware-5.bin
>     mkdir -p /lib/firmware/ath10k/QCA9887/hw1.0/
>     mv firmware-5.bin /lib/firmware/ath10k/QCA9887/hw1.0/firmware-5.bin
>
> I am also guessing that ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT should
> also be set but this would require a ie_len of 2.

I can upload a new version. So I need to add these flags:

ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX
ATH10K_FW_FEATURE_NO_P2P
ATH10K_FW_FEATURE_SUPPORTS_SKIP_CLOCK_INIT

Anything else?

> The QCA9887 support should be considered really experimental because we don't
> have any information how the interface to firmware actually looks like. The
> workarounds mentioned above were just implemented because we saw the firmware
> crashing and then guessed the most plausible reason for it.

Should we add a warning message to ath10k that the QCA9887 support is
experimental? That way users don't need to wonder why there are so many
problems.

There were some conflicts in patch 1. I fixed those now and pushed the
patches to the pending branch for further testing:

https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git/log/?h=master-pending

Unfortunately I don't have QCA9887 myself so I can't test these myself.
I hope I didn't break anything.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
