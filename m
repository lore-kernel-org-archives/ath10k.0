Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR1oe-0001zK-Hb
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 15:57:05 +0000
Message-ID: <532C6138.7010201@candelatech.com>
Date: Fri, 21 Mar 2014 08:56:40 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix getting stats from firmware.
References: <1395360324-20433-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQn1B6g19Ks41kzcoVyhYbHAcJGTNAyucmPMupbRAy1SNg@mail.gmail.com>
In-Reply-To: <CA+BoTQn1B6g19Ks41kzcoVyhYbHAcJGTNAyucmPMupbRAy1SNg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/20/2014 11:33 PM, Michal Kazior wrote:
> On 21 March 2014 01:05,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Make the request command object the right size so that
>> firmware will not just throw it away.
>> Tested customized and upstream firmware.
> 
> Did you test 636 as well? 636 doesn't seem to support more than just `stats_id`.

The firmware source I have checks in such a way that sending too
large of a cmd should be fine, only too small of a command packet
causes it to be ignored.

I do not have the 636 firmware to test against.

>> Signed-off-by: Ben Greear <greearb@candelatech.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/wmi.h | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
>> index fa1b9e0..4946471 100644
>> --- a/drivers/net/wireless/ath/ath10k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
>> @@ -2766,6 +2766,11 @@ enum wmi_stats_id {
>>         WMI_REQUEST_AP_STAT     = 0x02
>>  };
>>
>> +struct wlan_inst_rssi_args {
>> +       __le16 cfg_retry_count;
>> +       __le16 retry_count;
>> +};
>> +
>>  struct wmi_request_stats_cmd {
>>         __le32 stats_id;
>>
>> @@ -2773,6 +2778,12 @@ struct wmi_request_stats_cmd {
>>          * Space to add parameters like
>>          * peer mac addr
>>          */
> 
> You can probably remove the comment now :-)

Ok, I can do that.

Thanks,
Ben



-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
