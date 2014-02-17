Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WFQmo-0003Ai-19
 for ath10k@lists.infradead.org; Mon, 17 Feb 2014 16:11:14 +0000
Message-ID: <5302348A.9090700@candelatech.com>
Date: Mon, 17 Feb 2014 08:10:50 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] wmi: Handle failure to start scan.
References: <1392318594-32540-1-git-send-email-greearb@candelatech.com>	<CA+BoTQmDCrmkB3FErCN-XDX6M_Vzk3BuAK3AXcNK00qePje7XA@mail.gmail.com>	<52FE3F35.4080308@candelatech.com>
 <CA+BoTQ=cojyffQrTGmq7zgpfUNSBB9nrZEPpy5hsngnBW2j3pA@mail.gmail.com>
In-Reply-To: <CA+BoTQ=cojyffQrTGmq7zgpfUNSBB9nrZEPpy5hsngnBW2j3pA@mail.gmail.com>
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

On 02/16/2014 11:42 PM, Michal Kazior wrote:
> On 14 February 2014 17:07, Ben Greear <greearb@candelatech.com> wrote:

>>> We already wait for EVENT_STARTED in mac.c (see ath10k_start_scan) and
>>> clean up stuff (ath10k_abort_scan). Why not add the missing bits in
>>> there? Or is it possible to get EVENT_START_FAILED *after*
>>> EVENT_STARTED? Or am I missing something else here?
>>
>>
>> I think a lot of this would be firmware dependent, and might change between
>> various versions of the firmware.
>
> It doesn't make any sense. That would suggest a really ugly firmware
> bug. Did you see this (i.e. START_FAILED after STARTED) on 636 or
> 10.1.467?

I am working on a 10.1.389 release currently...will move forward when
I can get access to newer source code.


>> It seems to me we should handle this case and do cleanup just to be safe,
>> but maybe cleanup is needed in failure case of ath10k_start_scan as well?
>
> If you really get START_FAILED then you shouldn't have received
> STARTED before that. ath10k_start_scan() already waits for the STARTED
> event with a timeout and if it fails it triggers a cleanup. If it
> doesn't work for you then what perhaps needs to be fixed is the
> current cleanup code?

I am not certain the patch is needed.  I was looking at my firmware and it
appeared that I could hit the START_FAILED case, but perhaps it was not
really possible, and maybe newer firmware keeps it from happening entirely.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
