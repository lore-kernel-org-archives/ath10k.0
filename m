Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSORb-0002Js-Mt
 for ath10k@lists.infradead.org; Wed, 27 Jul 2016 13:00:17 +0000
From: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH 2/4] ath10k: Add provision for Rx descriptor abstraction
Date: Wed, 27 Jul 2016 12:59:47 +0000
Message-ID: <5798B042.4070604@qti.qualcomm.com>
References: <1469623006-13178-1-git-send-email-vthiagar@qti.qualcomm.com>
 <1469623006-13178-3-git-send-email-vthiagar@qti.qualcomm.com>
 <CA+BoTQ=kUP-Qtw1EWKKfM_aGtJS_4oQdz4tqD5tiJkF_k3-vOA@mail.gmail.com>
In-Reply-To: <CA+BoTQ=kUP-Qtw1EWKKfM_aGtJS_4oQdz4tqD5tiJkF_k3-vOA@mail.gmail.com>
Content-Language: en-US
Content-ID: <4D51314E6B60294AA37BD50549F0421D@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wednesday 27 July 2016 06:13 PM, Michal Kazior wrote:
> On 27 July 2016 at 14:36, Vasanthakumar Thiagarajan
> <vthiagar@qti.qualcomm.com> wrote:
>> There are slight differences in Rx hw descriptor information
>> among different chips. So far driver does not use those new
>> information for any functionalities, but there is one important
>> information which is available from QCA99X0 onwards to indicate
>> the number of bytes that hw padded at the begining of the rx
>> payload and this information is needed to undecap the rx
>> packet. Add an abstraction for Rx desc to make use of the
>> new desc information available. The callback that this patch
>> defines to retrieve the padding bytes will be used in follow-up
>> patch.
>>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
>> ---
>>   drivers/net/wireless/ath/ath10k/core.c | 12 ++++++++++++
>>   drivers/net/wireless/ath/ath10k/hw.c   | 13 +++++++++++++
>>   drivers/net/wireless/ath/ath10k/hw.h   | 12 ++++++++++++
>>   3 files changed, 37 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
>> index e889829..9c5e93b 100644
>> --- a/drivers/net/wireless/ath/ath10k/core.c
>> +++ b/drivers/net/wireless/ath/ath10k/core.c
>> @@ -68,6 +68,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>>                          .board_size = QCA988X_BOARD_DATA_SZ,
>>                          .board_ext_size = QCA988X_BOARD_EXT_DATA_SZ,
>>                  },
>> +               .hw_rx_desc_ops = &qca988x_rx_desc_ops,
> [...]
>> +struct ath10k_hw_rx_desc_ops {
>> +       int (*rx_desc_get_l3_pad_bytes)(struct htt_rx_desc *rxd);
>> +};
>
> Benjamin is trying to implement coverage class by poking hw registers
> over firmware's head [1]. I'm thinking the hw_rx_desc_ops could be
> generalized to hw_ops so it can be used for doing hw-specific hacks as
> well. What do you think?

Sure. Instead of reworking this patch set, can this be done in a separate patch?.

Vasanth
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
