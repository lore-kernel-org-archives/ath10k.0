Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmJeG-0004Qi-9s
 for ath10k@lists.infradead.org; Wed, 14 Oct 2015 10:51:08 +0000
From: "Kennady Rajan, Maharaja" <c_mkenna@qti.qualcomm.com>
Subject: Re: [PATCHv2] ath10k: Enable adaptive CCA
Date: Wed, 14 Oct 2015 10:50:27 +0000
Message-ID: <1444819835634.25550@qti.qualcomm.com>
References: <1444628598-806-1-git-send-email-c_mkenna@qti.qualcomm.com>,
 <87bnc2nfdi.fsf@kamboji.qca.qualcomm.com>,
 <1444817512360.4749@qti.qualcomm.com>
In-Reply-To: <1444817512360.4749@qti.qualcomm.com>
Content-Language: en-US
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> From: Maharaja <c_mkenna@qti.qualcomm.com>
>
>>> European Union has made it mandatory that all devices working in 2.4 GHz
>>> has to adhere to the ETSI specification (ETSI EN 300 328 V1.9.1)
>>> beginnig this year. The standard basically speaks about interferences
>>> in 2.4Ghz band.
>>> For example, when 802.11 device detects interference, TX must be stopped
>>> as long as interference is present.
>
>>> Adaptive CCA is a feature, when enabled the device learns from the
>>> environment and configures CCA levels adaptively. This will improve
>>> detecting interferences and the device can stop trasmissions till the
>>> interference is present eventually leading to good performances in
>>> varying interference conditions.
>
>>> The patch includes code for enabling adaptive CCA for 10.2.4 firmware on
>>> QCA988X.
>
>>> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
>>> Signed-off-by: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>

>>Please do not send untested code:

>>In function 'ath10k_core_get_fw_feature_str',
>>    inlined from 'ath10k_core_get_fw_features_str' at
>>    drivers/net/wireless/ath/ath10k/core.c:184:41:
>>drivers/net/wireless/ath/ath10k/core.c:161:2: error: call to
>>    '__compiletime_assert_162' declared with attribute error:
>>    BUILD_BUG_ON failed: ARRAY_SIZE(ath10k_core_fw_feature_str) !=
>>    ATH10K_FW_FEATURE_COUNT

>I have missed to add the wireless module in menuconfig while compilation. So I haven't see >the errors while running the compilation script. Now I changed and compilation error has >been resolved.

Apologize for that issue. I did the test cases by mistake. Regret for the inconvenience.

Regards,
Maha
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
