Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bd0PC-000058-NS
 for ath10k@lists.infradead.org; Thu, 25 Aug 2016 19:33:39 +0000
Subject: Re: [PATCH 4/4] ath10k: fix spurious tx/rx during boot
References: <1468924452-23877-1-git-send-email-michal.kazior@tieto.com>
 <1468924452-23877-5-git-send-email-michal.kazior@tieto.com>
 <a9bf9a29-f020-7118-79ee-b6c1aaa95ffe@candelatech.com>
 <CA+BoTQk5GPFnC7tT5qoG6aiN0hSNbiDAVNv7O7j2SXgCvUUjBA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <f48178bc-0775-5b60-1c9a-cead97005fbb@candelatech.com>
Date: Thu, 25 Aug 2016 12:19:13 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk5GPFnC7tT5qoG6aiN0hSNbiDAVNv7O7j2SXgCvUUjBA@mail.gmail.com>
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
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, Marek Puzyniak <marek.puzyniak@tieto.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 08/24/2016 11:18 PM, Michal Kazior wrote:

>> I was looking at firmware to make sure that I fixed what I could there....
>>
>> From what I can tell, 10.4 should not have this bug.  Did you see this only
>> on 10.1/10.2 firmware?  It is of course possible that I am mis-understanding
>> 10.4....
>
> I did see it on 10.1 and 10.2. Don't recall seeing it on 10.4 though.
> If you didn't see warnings on 10.4 even after adding msleep() as per
> commit log then I guess it doesn't suffer from the bug.

I can still occasionally see that message with a 15000 ms sleep.

Based on debugging, it seems my firmware is now setting the mac-mask properly.

But, as you mention, the rxfilter is enabled very early.  So, probably
it is still possible to see packets early if they are multicast, bcast, etc.

I don't think it is worth re-working the entire rx-filter calc in
the concurrency logic properly for 10.1 firmware, so I'm going to figure
my fix is good enough as is as long as it sets the mac-mask properly.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
