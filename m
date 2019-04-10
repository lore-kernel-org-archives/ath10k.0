Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEBhW-0005gT-T0
 for ath10k@lists.infradead.org; Wed, 10 Apr 2019 11:47:36 +0000
MIME-Version: 1.0
Date: Wed, 10 Apr 2019 17:17:33 +0530
From: Surabhi Vishnoi <svishnoi@codeaurora.org>
Subject: Re: [PATCH] ath10k: Fix the wrong value of enums for wmi tlv stats id
In-Reply-To: <CAJ-VmoncvErDWb4a2CNE38ECt2_8-vYr3sZ+AcjiPGCaPGuoCQ@mail.gmail.com>
References: <1554792193-22535-1-git-send-email-svishnoi@codeaurora.org>
 <CAJ-VmoncvErDWb4a2CNE38ECt2_8-vYr3sZ+AcjiPGCaPGuoCQ@mail.gmail.com>
Message-ID: <5e133105e60e45a48986c54a814b5a60@codeaurora.org>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2019-04-09 12:18, Adrian Chadd wrote:
> What about QCA6174 that uses TLV? Does this change its behaviour?
> 
> -a
> 

No, it will not break QCA6174, as earlier also same enum values 
(wmi_stats_id) were used for TLV targets,
enum wmi_stats_id {
         WMI_STAT_PEER = BIT(0),
         WMI_STAT_AP = BIT(1),
         WMI_STAT_PDEV = BIT(2),
         WMI_STAT_VDEV = BIT(3),
         WMI_STAT_BCNFLT = BIT(4),
         WMI_STAT_VDEV_RATE = BIT(5),
};

In the change f40a307eb92c ("ath10k: Fill rx duration for each peer in 
fw_stats for WCN3990), enum values for wmi_tlv_stats_id were wrongly 
added.

Thanks,
Surabhi Vishnoi


> On Mon, 8 Apr 2019 at 23:43, Surabhi Vishnoi <svishnoi@codeaurora.org>
> wrote:
> 
>> The enum value for WMI_TLV_STAT_PDEV, WMI_TLV_STAT_VDEV
>> and WMI_TLV_STAT_PEER is wrong, due to which the vdev stats
>> are not received from firmware in wmi_update_stats event.
>> 
>> Fix the enum values for above stats to receive all stats
>> from firmware in WMI_TLV_UPDATE_STATS_EVENTID.
>> 
>> Tested HW: WCN3990
>> Tested FW: WLAN.HL.3.1-00784-QCAHLSWMTPLZ-1
>> 
>> Fixes: f40a307eb92c ("ath10k: Fill rx duration for each peer in
>> fw_stats for WCN3990)
>> Signed-off-by: Surabhi Vishnoi <svishnoi@codeaurora.org>
>> ---
>> drivers/net/wireless/ath/ath10k/wmi.h | 7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h
>> b/drivers/net/wireless/ath/ath10k/wmi.h
>> index e1c40bb..12f57f9 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -4535,9 +4535,10 @@ enum wmi_10_4_stats_id {
>> };
>> 
>> enum wmi_tlv_stats_id {
>> -       WMI_TLV_STAT_PDEV       = BIT(0),
>> -       WMI_TLV_STAT_VDEV       = BIT(1),
>> -       WMI_TLV_STAT_PEER       = BIT(2),
>> +       WMI_TLV_STAT_PEER       = BIT(0),
>> +       WMI_TLV_STAT_AP         = BIT(1),
>> +       WMI_TLV_STAT_PDEV       = BIT(2),
>> +       WMI_TLV_STAT_VDEV       = BIT(3),
>> WMI_TLV_STAT_PEER_EXTD  = BIT(10),
>> };
>> 
>> --
>> 1.9.1

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
