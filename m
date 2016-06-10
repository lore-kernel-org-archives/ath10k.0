Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bBMJ7-0006tK-Nd
 for ath10k@lists.infradead.org; Fri, 10 Jun 2016 13:17:06 +0000
Message-ID: <575ABDA2.9020609@candelatech.com>
Date: Fri, 10 Jun 2016 06:16:18 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: ath10k/QCA9980 - Issues introduced in wireless testing 2016-05
References: <ff65514a-47a3-2f32-658c-a2177401aa9a@bk.ru>
 <CA+BoTQmJ+JruxZ9WsG8Dnz=cwNY+e3Dy=g74-brS+0OE_5iu0Q@mail.gmail.com>
 <d836933e-ddbb-d10c-0715-6bce4396fd41@nbd.name>
 <877fdxfd2l.fsf@kamboji.qca.qualcomm.com> <575AB829.10101@candelatech.com>
 <f80db123-9b8a-289d-aed8-12531db13424@nbd.name>
In-Reply-To: <f80db123-9b8a-289d-aed8-12531db13424@nbd.name>
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
To: Felix Fietkau <nbd@nbd.name>, Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org, "A. Benz" <ash.benz@bk.ru>



On 06/10/2016 05:57 AM, Felix Fietkau wrote:
> On 2016-06-10 14:52, Ben Greear wrote:
>> This looks a lot like the problems I was having.
>>
>> Two of these 5 patches recently made it upstream (but may not be in LEDE yet),
>> but the other patches also were related to memory corruption.
>>
>> See my patches posted on 4/1/16:
>>
>> https://patchwork.kernel.org/project/ath10k/list/
>>
>> I don't know where the 5/5 patch ended up.
> I had already asked affected users to test with those patches (I have a
> commit that adds them in my staging tree), but it did not resolve the issue.

Ok, must be something else then.

If you can run on x86 under KASAN it may provide some clues..that is how I eventually
made progress on the issues I was seeing.  My rebase onto 3.7 has been slow and painful,
but I should be ready to start testing that sometime soon, maybe I can reproduce something
there.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
