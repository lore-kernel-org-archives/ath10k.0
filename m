Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1azqKx-0006ZD-3w
 for ath10k@lists.infradead.org; Mon, 09 May 2016 18:55:23 +0000
Subject: Re: [PATCH v2 5/5] ath10k: Fix deadlock when peer cannot be created.
References: <1459545132-11295-1-git-send-email-greearb@candelatech.com>
 <1459545132-11295-5-git-send-email-greearb@candelatech.com>
 <5730C697.206@candelatech.com> <1462816487256.22920@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5730CFC7.5010901@candelatech.com>
Date: Mon, 9 May 2016 10:58:31 -0700
MIME-Version: 1.0
In-Reply-To: <1462816487256.22920@qti.qualcomm.com>
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
To: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 05/09/2016 10:54 AM, Manoharan, Rajkumar wrote:
>> On Monday, May 9, 2016 10:49 PM, greearb@candelatech.com wrote:
>>> On 04/01/2016 02:12 PM, greearb@candelatech.com wrote:
>>> From: Ben Greear <greearb@candelatech.com>
>>>
>>> We must not attempt to send WMI packets while holding the data-lock,
>>> as it may deadlock:
>>>
>>> BUG: sleeping function called from invalid context at drivers/net/wireless/ath/ath10k/wmi.c:1824
>>> in_atomic(): 1, irqs_disabled(): 0, pid: 2878, name: wpa_supplicant
>>>
>> Kalle:  I notice these 5 patches are not in the latest wireless-testing.
>>
>> Are they not acceptable, or???
>>
> Aah!.. I recently cooked up similar patch for BUG_ON issue. I think this one is stable candidate. no?

All 5 have a possibility of being worth stable I think, but at least they should probably
go into upstream!

They were not a lot of fun to find or fix, so it would be nice if no one else had to waste
time on it.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
