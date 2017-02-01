Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYz0Z-0007mz-DQ
 for ath10k@lists.infradead.org; Wed, 01 Feb 2017 17:47:53 +0000
MIME-Version: 1.0
Date: Wed, 01 Feb 2017 23:17:30 +0530
From: Ashok Raj Nagarajan <arnagara@codeaurora.org>
Subject: Re: [PATCH v2 2/2] mac80211: store tx power value from user to station
In-Reply-To: <35c617ff-c07a-b221-5742-b1487618bce7@candelatech.com>
References: <1485888101-23454-1-git-send-email-arnagara@qti.qualcomm.com>
 <1485888101-23454-2-git-send-email-arnagara@qti.qualcomm.com>
 <eff562d4-7dd8-4b5a-812c-58f4f690cde3@candelatech.com>
 <7584a5235b49b7799a2c15f91fb03794@codeaurora.org>
 <35c617ff-c07a-b221-5742-b1487618bce7@candelatech.com>
Message-ID: <cef8a7325bc010dc26de0bbd006ceff3@codeaurora.org>
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, johannes@sipsolutions.net, Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, ath10k@lists.infradead.org

On 2017-02-01 23:02, Ben Greear wrote:
> On 02/01/2017 09:29 AM, Ashok Raj Nagarajan wrote:
>> On 2017-02-01 00:30, Ben Greear wrote:
>>> On 01/31/2017 10:41 AM, Ashok Raj Nagarajan wrote:
>>>> This patch introduce a new driver callback drv_sta_set_txpwr. This 
>>>> API will
>>>> copy the transmit power value passed from user space and call the 
>>>> driver
>>>> callback to set the tx power for the station.
>>>> 
>>>> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
>>>> ---
>>>>  include/net/mac80211.h    |  6 ++++++
>>>>  net/mac80211/cfg.c        |  7 +++++++
>>>>  net/mac80211/driver-ops.c | 21 +++++++++++++++++++++
>>>>  net/mac80211/driver-ops.h |  5 +++++
>>>>  net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
>>>>  5 files changed, 66 insertions(+)
>>>> 
>>>> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
>>>> index 5345d35..e059d5a 100644
>>>> --- a/include/net/mac80211.h
>>>> +++ b/include/net/mac80211.h
>>>> @@ -1777,6 +1777,8 @@ struct ieee80211_sta_rates {
>>>>   *    This is defined by the spec (IEEE 802.11-2012 section 8.3.2.2 
>>>> NOTE 2).
>>>>   * @support_p2p_ps: indicates whether the STA supports P2P PS 
>>>> mechanism or not.
>>>>   * @max_rc_amsdu_len: Maximum A-MSDU size in bytes recommended by 
>>>> rate control.
>>>> + * @txpwr: indicates the tx power, in dBm, to be used when sending 
>>>> data frames
>>>> + *    to the STA. Value of 0 means, automatic (default) tx power.
>>> 
>>> Atheros NICs use 1/2 dBm increments internally, so maybe pass down 
>>> mBm
>>> to the driver so you don't
>>> loose the granularity?  (Other NICs may potentially have even finer 
>>> control.)
>>> 
>> 
>> ath10k firmware expects values to be in dBm and the calculations 
>> regarding 1/2 dBm is taken care in firmware.
> 
> Other drivers may want more precision, so I still think you should
> store this in mBm instead
> of throwing away precision in the API.
> 

Okay point taken! Instead of having the conversion happening now in API, 
I will push it down to the ath10k driver.

> A new and improved ath10k firmware may support 1/2 dBm units directly,
> for instance.
> 
> Thanks,
> Ben
> 
>> 
>> Thanks,
>> Ashok
>>> Thanks,
>>> Ben
>> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
