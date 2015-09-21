Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ze3NL-0003Gv-5z
 for ath10k@lists.infradead.org; Mon, 21 Sep 2015 15:51:31 +0000
Subject: Re: [PATCH] ath10k: Fix CCK rate definitions.
References: <1442362098-24859-1-git-send-email-greearb@candelatech.com>
 <CA+BoTQkXma5KXpGa3XnnFw=13GRVoTEth0_=K-YNEKru1CpaOA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <5600276E.6080408@candelatech.com>
Date: Mon, 21 Sep 2015 08:51:10 -0700
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkXma5KXpGa3XnnFw=13GRVoTEth0_=K-YNEKru1CpaOA@mail.gmail.com>
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

On 09/21/2015 12:33 AM, Michal Kazior wrote:
> On 16 September 2015 at 02:08,  <greearb@candelatech.com> wrote:
>> From: Ben Greear <greearb@candelatech.com>
>>
>> The old values did NOT match what is found in 10.1.467
>> firmware.  I figure it is likely it is wrong for the others
>> as well.
>
> Does this fix anything at all?

I'm adding support to CT firmware to set arbitrary ratectrl
masks, and I'm using that enum for part of the implementation.

In the 4.0 kernel, the 'hw-value' for CCK rates is broken since the enum doesn't
match firmware.

I'll check what code is using that enum and see if it can be fixed.  Otherwise,
I can fix it with a new enum with the values I need.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
