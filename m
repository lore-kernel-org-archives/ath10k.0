Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aihCt-0002S0-Ke
 for ath10k@lists.infradead.org; Wed, 23 Mar 2016 11:44:12 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] dt: bindings: add new dt entry for pre calibration in
 qcom,ath10k.txt
Date: Wed, 23 Mar 2016 11:43:45 +0000
Message-ID: <87twjxfmhb.fsf@kamboji.qca.qualcomm.com>
References: <1457604724-14378-1-git-send-email-rmani@qti.qualcomm.com>
 <20160318161823.GA5558@rob-hp-laptop>
In-Reply-To: <20160318161823.GA5558@rob-hp-laptop> (Rob Herring's message of
 "Fri, 18 Mar 2016 11:18:23 -0500")
Content-Language: en-US
Content-ID: <1E767CB5F073EA479609EB7535C9B298@qualcomm.com>
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
To: Rob Herring <robh@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Raja Mani <rmani@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Rob Herring <robh@kernel.org> writes:

> On Thu, Mar 10, 2016 at 03:42:04PM +0530, Raja Mani wrote:
>> There two things done in this patch,
>> 
>> 1) Existing device tree entry 'qcom,ath10k-calibration-data' carries
>>    not only calibration data, it carries board specific data too.
>>    So, make appropriate update in doc.
>> 
>> 2) ipq4019 wifi needs new devie tree entry to carry calibration
>>    data alone (called pre cal data, it doesn't include any other info).
>>    Using 'qcom,ath10k-calibration-data' for ipq4019 would alter
>>    the purpose of it. Hence, add new device tree entry called
>>    'qcom,ath10k-pre-calibration-data' to carry only pre calibration data.
>> 
>> Signed-off-by: Raja Mani <rmani@qti.qualcomm.com>
>> ---
>> 
>> Below patches covers the corresponding changes in the ath10k driver.
>> It's posted separately to ath10k and linux-wireless mailing list.
>
> Generally the series should be posted together. The rest should not be 
> merged until this patch is accepted.

I'll merge them together, this as the first patch.

>>   1) ath10k: pass cal data location as an argument to ath10k_download_cal_{file|dt}
>>   2) ath10k: move cal data len to hw_params
>>   3) ath10k: incorporate qca4019 cal data download sequence
>> 
>>  .../bindings/net/wireless/qcom,ath10k.txt          | 23 +++++++++++++++-------
>>  1 file changed, 16 insertions(+), 7 deletions(-)
>
> Acked-by: Rob Herring <robh@kernel.org>

Thanks.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
