Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go0va-00065J-Aw
 for ath10k@lists.infradead.org; Mon, 28 Jan 2019 07:01:57 +0000
MIME-Version: 1.0
Date: Mon, 28 Jan 2019 15:01:50 +0800
From: yiboz <yiboz@codeaurora.org>
Subject: Re: FW: [PATCH] ath10k: fix return value check in wake_tx_q op
In-Reply-To: <c77a1c0961f34ee68b7266444d2207f5@aptaiexm02e.ap.qualcomm.com>
References: <20180506132500.16888-1-erik.stromdahl@gmail.com>
 <6dc00772b826410e930306891fd13ed9@euamsexm01f.eu.qualcomm.com>
 <c77a1c0961f34ee68b7266444d2207f5@aptaiexm02e.ap.qualcomm.com>
Message-ID: <66a74025a23795f305de37989c1b8aa3@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kvalo@qca.qualcomm.com
Cc: erik.stromdahl@gmail.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Erik,

We have met performance issue on our two-core system after applying your 
patch. In WDS mode, we found that the peak throughput in TCP-DL and 
UDP-DL dropped more than 10% compared with previous one. And in some 
cases, though throughput stays the same, one CPU usage rises about 20% 
which leads to 10% in total CPU usage. With your change, I think driver 
will try its best to push as many packets as it can. During this time, 
the driver's queue lock will be held for too much time in one CPU and as 
a result, the other CPU will be blocked if it wants to acquired the same 
lock. Working in this way seems not efficiency.

So I think it is better to revert the change till we come up with a new 
solution.

>>  Subject: [PATCH] ath10k: fix return value check in wake_tx_q op
>> 
>>  ath10k_mac_tx_push_txq returns either a postive integer (length) on 
>> success
>>  or a negative error code on error.
>> 
>>  The "if (ret) break;" statement will thus always break out of the 
>> loop
>>  immediately after ath10k_mac_tx_push_txq has returned (making the 
>> loop
>>  pointless).
>> 
>>  A side effect of this fix is that we will iterate the queue until
>>  ath10k_mac_tx_push_txq returns -ENOENT. This will make sure the queue 
>> is
>>  not added back to ar->txqs when it is empty. This could potentially 
>> improve
>>  performance somewhat (I have seen a small improvement with SDIO 
>> devices).
>> 
>>  Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>  ---
>>   drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>>  diff --git a/drivers/net/wireless/ath/ath10k/mac.c
>>  b/drivers/net/wireless/ath/ath10k/mac.c
>>  index 3d7119ad7c7a..487a7a7380fd 100644
>>  --- a/drivers/net/wireless/ath/ath10k/mac.c
>>  +++ b/drivers/net/wireless/ath/ath10k/mac.c
>>  @@ -4290,7 +4290,7 @@ static void ath10k_mac_op_wake_tx_queue(struct
>>  ieee80211_hw *hw,
>> 
>>   	while (ath10k_mac_tx_can_push(hw, f_txq) && max--) {
>>   		ret = ath10k_mac_tx_push_txq(hw, f_txq);
>>  -		if (ret)
>>  +		if (ret < 0)
>>   			break;
>>   	}
>>   	if (ret != -ENOENT)
>>  --
>>  2.17.0

-- 
yibo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
