Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x236.google.com ([2607:f8b0:4001:c0b::236])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZo51-0007zt-NZ
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 01:24:25 +0000
Received: by mail-it0-x236.google.com with SMTP id f190so7355359ita.5
 for <ath10k@lists.infradead.org>; Thu, 11 Jan 2018 17:24:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a0eebf0b-f24b-05f1-27c9-26c3a708f014@candelatech.com>
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
 <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
 <CALAE=UD3kCG8_=o16D_JJ1_fN-PqQ+b0VxjWjxU8O_Sh1uHSFA@mail.gmail.com>
 <a0eebf0b-f24b-05f1-27c9-26c3a708f014@candelatech.com>
From: Robert Jones <rjones@gateworks.com>
Date: Thu, 11 Jan 2018 17:24:11 -0800
Message-ID: <CALAE=UAmS33_sb1z0bVKwu-qb=WWn+m7vuRR2vYSnUFF6xLt2Q@mail.gmail.com>
Subject: Re: Bad TCP performance on WLE900VX
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Out of curiosity, did you try the patch that Kalle suggested?

I did not unfortunately. I have other cards to qualify but if I can
come back to this I'll post the results.

On Thu, Jan 11, 2018 at 2:50 PM, Ben Greear <greearb@candelatech.com> wrote:
> On 01/10/2018 10:15 AM, Robert Jones wrote:
>>>
>>> There are more tcp related hacks that make ath10k useful for
>>> generating TCP traffic.  The tcp_tsq_limit_output_interval
>>> one in particular is helpful
>>
>>
>>> You can dig through my kernel and look for a commit related to
>>> tcp_tsq_limit_output_interval.  Try setting it to 5 or higher.
>>
>>
>> This solved the problem for me.
>>
>> Link to commit for anyone else looking:
>>
>> https://github.com/greearb/linux-ct-4.13/commit/dc201c3c310f805681dbf393484bdc9715745df1
>
>
> Out of curiosity, did you try the patch that Kalle suggested?
>
> I'd be curious how that performed in comparison...
>
>
> Thanks,
> Ben
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>



-- 
Robert Jones - Software Engineer
Gateworks Corporation - http://www.gateworks.com/
3026 S. Higuera St. San Luis Obispo CA 93401
805-781-2000

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
