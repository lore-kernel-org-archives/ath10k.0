Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dBe3J-0002lD-Mt
 for ath10k@lists.infradead.org; Fri, 19 May 2017 09:18:31 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k : Fix channel survey dump
Date: Fri, 19 May 2017 09:17:56 +0000
Message-ID: <87wp9durwe.fsf@kamboji.qca.qualcomm.com>
References: <1493217698-22451-1-git-send-email-c_vnaral@qti.qualcomm.com>
 <40f2b7a2-7276-6de6-afc6-407348c92e70@nbd.name>
In-Reply-To: <40f2b7a2-7276-6de6-afc6-407348c92e70@nbd.name> (Felix Fietkau's
 message of "Wed, 26 Apr 2017 17:29:16 +0200")
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
To: "nbd@nbd.name" <nbd@nbd.name>
Cc: Venkateswara Naralasettty <vnaralas@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Felix Fietkau <nbd@nbd.name> writes:

> On 2017-04-26 16:41, Venkateswara Rao Naralasetty wrote:
>> Channel active/busy time are showing incorrect
>> (less than previous or sometimes zero) for
>> successive survey dump command.
>> 
>> example:
>> Survey data from wlan0
>>         frequency:                      5180 MHz [in use]
>>         channel active time:            54995 ms
>>         channel busy time:              432 ms
>>         channel receive time:           0 ms
>>         channel transmit time:          59 ms
>> Survey data from wlan0
>>         frequency:                      5180 MHz [in use]
>>         channel active time:            32592 ms
>>         channel busy time:              254 ms
>>         channel receive time:           0 ms
>>         channel transmit time:          0 ms
>> 
>> This patch fix this issue by assigning 'wmi_bss_survey_req_type'
>> as 'WMI_BSS_SURVEY_REQ_TYPE_READ'.
>> 
>> Firmware ver 10.4-3.4-00082
>> Hardware QCA4019
>> 
>> Signed-off-by: Venkateswara Rao Naralasetty <c_vnaral@qti.qualcomm.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/mac.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index 9977829..87a9b55 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -6621,7 +6621,7 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>>  				  struct ieee80211_channel *channel)
>>  {
>>  	int ret;
>> -	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR;
>> +	enum wmi_bss_survey_req_type type = WMI_BSS_SURVEY_REQ_TYPE_READ;
>
> Does the firmware read the registers directly, or does it accumulate
> the results in a way that can't overflow? If you don't clear the
> counters on reset, the overflow will be problematic for the
> current-channel stats. I think a better approach would be to use
> READ_CLEAR for in-use channels and store the sum inside the driver.

Venkateswara, any comments?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
