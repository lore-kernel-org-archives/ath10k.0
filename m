Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlVRY-0000YH-UA
 for ath10k@lists.infradead.org; Mon, 12 Oct 2015 05:14:41 +0000
From: "Kennady Rajan, Maharaja" <c_mkenna@qti.qualcomm.com>
Subject: RE: [PATCH] ath10k: Enable adaptive CCA
Date: Mon, 12 Oct 2015 05:14:08 +0000
Message-ID: <e8ed6213bc5a4b458ae865bcaa23b804@APSANEXR01B.ap.qualcomm.com>
References: <1444210033-25901-1-git-send-email-c_mkenna@qti.qualcomm.com>
 <87io6gqfgn.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87io6gqfgn.fsf@kamboji.qca.qualcomm.com>
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

<c_mkenna@qti.qualcomm.com> writes:

> From: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
>
>> European Union has made it mandatory that all devices working in 2.4 
>> GHz has to adhere to the ETSI specification (ETSI EN 300 328 V1.9.1) 
>> beginnig this year. The standard basically speaks about interferences 
>> in 2.4Ghz band.
>> For example, when 802.11 device detects interference, TX must be 
>> stopped as long as interference is present.
>
>> Adaptive CCA is a feature, when enabled the device learns from the 
>> environment and configures CCA levels adaptively. This will improve 
>> detecting interferences and the device can stop trasmissions till the 
>> interference is present eventually leading to good performances in 
>> varying interference conditions.
>
>> The patch includes code for enabling adaptive CCA for 10.2.4 firmware 
>> on QCA988X.
>
> Signed-off-by: Maharaja Kennadyrajan <c_mkenna@qti.qualcomm.com>
> Signed-off-by: Manikanta Pubbisetty <c_mpubbi@qti.qualcomm.com>

>There are conflicts, please rebase and resend:

>Applying: ath10k: Enable adaptive CCA
>Using index info to reconstruct a base tree...
>Falling back to patching base and 3-way merge...
>Auto-merging drivers/net/wireless/ath/ath10k/wmi.h
>Auto-merging drivers/net/wireless/ath/ath10k/wmi.c
>CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi.c
>Auto-merging drivers/net/wireless/ath/ath10k/wmi-ops.h
>CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath10k/wmi-ops.h
>Auto-merging drivers/net/wireless/ath/ath10k/mac.c
>Auto-merging drivers/net/wireless/ath/ath10k/core.h
>Failed to merge in the changes.
>Patch failed at 0001 ath10k: Enable adaptive CCA

Sure, I will resend again after rebase.

Regards,
Maha

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
