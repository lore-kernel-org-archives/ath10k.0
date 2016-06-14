Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bCqRI-0005Vf-Ev
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 15:39:41 +0000
Message-ID: <57600A3C.9000104@candelatech.com>
Date: Tue, 14 Jun 2016 06:44:28 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Regression in qca99x0 on x86 platform (kernel: 4.7.0-rc1-wt-ath
References: <f495d218d54a4c4c859849a85f38ab0c@aphydexm01b.ap.qualcomm.com>
 <57506C7A.7070109@candelatech.com>
 <c3facd0acc1c2f49f4a4638bf0c2a591@codeaurora.org>
 <57507269.1060108@candelatech.com>
 <ac15f3e10cedc20199051bab88b36eba@codeaurora.org>
In-Reply-To: <ac15f3e10cedc20199051bab88b36eba@codeaurora.org>
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
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: nbd@openwrt.org, ath10k@lists.infradead.org, "Manoharan,
 Rajkumar" <rmanohar@qti.qualcomm.com>, "Valo, Kalle" <kvalo@qca.qualcomm.com>, nbd@nbd.name



On 06/13/2016 11:21 PM, Rajkumar Manoharan wrote:
> On 2016-06-02 23:22, Ben Greear wrote:

>> At the time, I bisected to this commit as well, but I decided to just
>> live with it
>> since it seemed it fixed some other bug and we had a work-around.  My
>> understanding
>> is that without the patch above, some ARM systems failed to work.
>>
> Ben,
>
> I posted a fix for the freeze issue (https://patchwork.kernel.org/patch/9175029/). Can you please give a try with VT-d disabled?
>
> -Rajkumar

Yes, but it might be a bit.  I just ported my patches to 4.7, and will add yours
there.  We are mainly focussed on getting a stable 4.4+ out the door currently though.

Were you able to test on the ARM platform that originally had the problem that
Felix's patch was supposed to fix?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
