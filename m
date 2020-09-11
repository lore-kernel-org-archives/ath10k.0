Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGg5f-0002Jh-PO
 for ath10k@lists.infradead.org; Fri, 11 Sep 2020 10:15:36 +0000
MIME-Version: 1.0
Date: Fri, 11 Sep 2020 10:15:32 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: lockdep splat in kvallo ath tree
In-Reply-To: <87v9gk4soh.fsf@tynnyri.adurom.net>
References: <0ef69472-9613-c265-0635-ff2ef0cf274f@candelatech.com>
 <87v9gk4soh.fsf@tynnyri.adurom.net>
Message-ID: <010101747ca9badc-e3c2aebc-bd17-4dd2-a8a7-444cd8af043c-000000@us-west-2.amazonses.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-09-11 16:35, Kalle Valo wrote:
> + ath10k
> 
> Ben Greear <greearb@candelatech.com> writes:
> 
>> The patch below adds a call to ath10k_debug_fw_stats_request(ar),
>> which expects ar->conf_mutex to be held, but it is *not* held in
>> this code path.  This leads to warnings when lockdep is enabled.
>> 
>> 
>> greearb@bendt7 ath10k]$ git show 4913e675630ec
>> commit 4913e675630ec1a15c92651f426a63755c71b91b
>> Author: Wen Gong <wgong@codeaurora.org>
>> Date:   Thu Apr 23 10:27:58 2020 +0800
>> 
>>     ath10k: enable rx duration report default for wmi tlv
>> 
>>     When run command "iw dev wlan0 station dump", the rx duration is 
>> 0.
>>     When firmware indicate WMI_UPDATE_STATS_EVENTID, extended flag of
>>     statsis not set by default, so firmware do not report rx duration.
> 
> Wen, please investigate this.
Yes, Kalle, I will do that.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
