Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWQx0-0005Km-M1
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 14:20:19 +0000
Message-ID: <5421818A.9040501@candelatech.com>
Date: Tue, 23 Sep 2014 07:19:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: request firmware flush in ath10k_flush.
References: <1411151304-31544-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQm1rZO+yBbYxihpgEvR1cGZWS4Pr0AP+KMODcG4jpd_jQ@mail.gmail.com>
In-Reply-To: <CA+BoTQm1rZO+yBbYxihpgEvR1cGZWS4Pr0AP+KMODcG4jpd_jQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>



On 09/23/2014 02:16 AM, Michal Kazior wrote:
> On 19 September 2014 20:28,  <greearb@candelatech.com> wrote:
> [...]
>> +       /* If we are CT firmware, ask it to flush all tids on all peers on
>> +        * all vdevs.  Normal firmware will just crash if you do this.
>> +        */
>> +       if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
>> +               ath10k_wmi_peer_flush(ar, 0xFFFFFFFF, peer_addr, 0xFFFFFFFF);
>
> I recall you've explained this some time ago, but can you refresh my
> memory, please? Is this any different from iterating over all peers
> and flushing each? Or does your firmware do so extra magic that is
> impossible to do with normal firmware commands?

My firmware does that iteration internally.

You could probably do that in the driver, but it would be a lot
of messages (for all vdevs, all peers, all tids)...
I was not sure if there were limits to the number
of commands you should attempt during the flush...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
