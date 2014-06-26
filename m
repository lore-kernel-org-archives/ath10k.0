Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X0DXQ-0004kR-5x
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 17:32:45 +0000
Message-ID: <53AC5923.6080209@candelatech.com>
Date: Thu, 26 Jun 2014 10:32:19 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Firmware crash
References: <53ABFFAC.1050603@stackframe.org>
 <CA+BoTQkm9BOtuvwY6h-z38WSe9rNw34V89A3bomAcY--T1vE9g@mail.gmail.com>
 <53AC1ABF.4020906@candelatech.com>
 <CAANdOW6yrv-Z_+bXw_z3zrmz=Q4N=r0xh9YitwwCoUAQchChLg@mail.gmail.com>
 <53AC3AF1.8080808@candelatech.com>
 <CAANdOW7QyeNxJcG+kbXiUQZOXkF0ofZFh_RLbD6U1MjTyED+1Q@mail.gmail.com>
 <53AC3FCD.3010706@candelatech.com>
 <CAANdOW5bHeVqwqLVW7Ngr81mNJ6sa0tf3ojNDDFFzssrZTGvfw@mail.gmail.com>
In-Reply-To: <CAANdOW5bHeVqwqLVW7Ngr81mNJ6sa0tf3ojNDDFFzssrZTGvfw@mail.gmail.com>
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
To: Emanuel Taube <emanuel.taube@gmail.com>
Cc: Sven Schnelle <svens@stackframe.org>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 06/26/2014 10:12 AM, Emanuel Taube wrote:
> Hi Ben,
> 
> your latest firmware fixes the crashes I was able to reproduce before.

Excellent, thanks for confirming.  Looks like it was simple null-pointer
deref.  I'll roll this into my firmware, so next 'official' release will
have the fix as well.

I'll send QCA a note off-list on what fixes it in case they want to
put the fix upstream some day.

Thanks,
Ben

> 
> Thanks and regards,
> Emanuel
> 
> 
> 2014-06-26 17:44 GMT+02:00 Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>:
> 
>     On 06/26/2014 08:39 AM, Emanuel Taube wrote:
>     > Hi Ben,
>     >
>     > here is the dmesg output with your new community firmware:
> 
>     Looks like null-dereference (or possibly some other bad memory dereference),
>     not actually an assert (at least in my code).
> 
>     Can you re-download the firmware (same location) and see if that fixes the problem?
> 
>     Thanks,
>     Ben
> 
>     --
>     Ben Greear <greearb@candelatech.com <mailto:greearb@candelatech.com>>
>     Candela Technologies Inc  http://www.candelatech.com
> 
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
