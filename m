Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erfwu-0000fl-Vp
 for ath10k@lists.infradead.org; Fri, 02 Mar 2018 08:21:54 +0000
From: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH] ath10k: Add sta rx packet stats per tid
Date: Fri, 2 Mar 2018 08:21:25 +0000
Message-ID: <b1fcd67d-e149-acc4-ebbb-23da9a06da02@qti.qualcomm.com>
References: <1517400072-9204-1-git-send-email-vthiagar@codeaurora.org>
 <87606hs17h.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87606hs17h.fsf@kamboji.qca.qualcomm.com>
Content-Language: en-US
Content-ID: <4CDFA880336E8B419503696C58BCD4A8@qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Wednesday 28 February 2018 06:47 PM, Kalle Valo wrote:
> Vasanthakumar Thiagarajan <vthiagar@codeaurora.org> writes:
> 
>> Added per tid sta counters for the following
>>
>> - Total number MSDUs received from firmware
>> - Number of MSDUs received with errors like decryption, crc, mic ,etc.
>> - Number of MSDUs dropped in the driver
>> - A-MPDU/A-MSDU subframe stats
>> - Number of MSDUS passed to mac80211
>>
>> All stats other than A-MPDU stats are only for received data frames.
>> A-MPDU stats might have stats for management frames when monitor
>> interface is active where management frames are notified both in wmi
>> and HTT interfaces.
>>
>> These per tid stats can be enabled with tid bitmask through a debugfs
>> like below
>>
>>   echo <tid_bitmask> > /sys/kernel/debug/ieee80211/phyX/ath10k/sta_tid_stats_mask
>>
>>   tid 16 (tid_bitmask 0x10000) is used for non-qos data/management frames
>>
>> The stats are read from
>> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanX/stations/<sta_mac>/dump_tid_stats
>>
>> Sample output:
>>
>>   To enable rx stats for tid 0, 5 and 6,
>>
>>   echo 0x00000061 > /sys/kernel/debug/ieee80211/phy0/ath10k/sta_tid_stats_mask
>>
>> cat /sys/kernel/debug/ieee80211/phy0/netdev\:wlan15/stations/8c\:fd\:f0\:0a\:8e\:df/dump_tid_stats
>>
>>    		Driver Rx pkt stats per tid, ([tid] count)
>>                  ------------------------------------------
>> MSDUs from FW                   [00] 2567        [05] 3178        [06] 1089
>> MSDUs unchained                 [00] 0           [05] 0           [06] 0
>> MSDUs locally dropped:chained   [00] 0           [05] 0           [06] 0
>> MSDUs locally dropped:filtered  [00] 0           [05] 0           [06] 0
>> MSDUs queued for mac80211       [00] 2567        [05] 3178        [06] 1089
>> MSDUs with error:fcs_err        [00] 0           [05] 0           [06] 2
>> MSDUs with error:tkip_err       [00] 0           [05] 0           [06] 0
>> MSDUs with error:crypt_err      [00] 0           [05] 0           [06] 0
>> MSDUs with error:peer_idx_inval [00] 0           [05] 0           [06] 0
>>
>> A-MPDU num subframes upto 10    [00] 2567        [05] 3178        [06] 1087
>> A-MPDU num subframes 11-20      [00] 0           [05] 0           [06] 0
>> A-MPDU num subframes 21-30      [00] 0           [05] 0           [06] 0
>> A-MPDU num subframes 31-40      [00] 0           [05] 0           [06] 0
>> A-MPDU num subframes 41-50      [00] 0           [05] 0           [06] 0
>> A-MPDU num subframes 51-60      [00] 0           [05] 0           [06] 0
>> A-MPDU num subframes >60        [00] 0           [05] 0           [06] 0
>>
>> A-MSDU num subframes 1          [00] 2567        [05] 3178        [06] 1089
>> A-MSDU num subframes 2          [00] 0           [05] 0           [06] 0
>> A-MSDU num subframes 3          [00] 0           [05] 0           [06] 0
>> A-MSDU num subframes 4          [00] 0           [05] 0           [06] 0
>> A-MSDU num subframes >4         [00] 0           [05] 0           [06] 0
>>
>> Signed-off-by: Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
> 
> This added new ath10k-check warnings, I fixed those in the pending
> branch:
> 
> drivers/net/wireless/ath/ath10k/debug.h:203: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/debug.h:226: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:24: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:40: Alignment should match open parenthesis
> drivers/net/wireless/ath/ath10k/debugfs_sta.c:60: Alignment should match open parenthesis
> 
> Also I fixed the typo "rages" in debug.h. My changes:

Thanks for fixing it. In most of the cases, fixing above warnings would result in lines > 80 chars.
May be we need not be very strict about > 80 char limit?

Vasanth
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
