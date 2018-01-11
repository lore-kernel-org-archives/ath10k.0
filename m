Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZlg0-0005g3-WE
 for ath10k@lists.infradead.org; Thu, 11 Jan 2018 22:50:26 +0000
Subject: Re: Bad TCP performance on WLE900VX
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
 <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
 <CALAE=UD3kCG8_=o16D_JJ1_fN-PqQ+b0VxjWjxU8O_Sh1uHSFA@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <a0eebf0b-f24b-05f1-27c9-26c3a708f014@candelatech.com>
Date: Thu, 11 Jan 2018 14:50:06 -0800
MIME-Version: 1.0
In-Reply-To: <CALAE=UD3kCG8_=o16D_JJ1_fN-PqQ+b0VxjWjxU8O_Sh1uHSFA@mail.gmail.com>
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
To: Robert Jones <rjones@gateworks.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 01/10/2018 10:15 AM, Robert Jones wrote:
>> There are more tcp related hacks that make ath10k useful for
>> generating TCP traffic.  The tcp_tsq_limit_output_interval
>> one in particular is helpful
>
>> You can dig through my kernel and look for a commit related to
>> tcp_tsq_limit_output_interval.  Try setting it to 5 or higher.
>
> This solved the problem for me.
>
> Link to commit for anyone else looking:
> https://github.com/greearb/linux-ct-4.13/commit/dc201c3c310f805681dbf393484bdc9715745df1

Out of curiosity, did you try the patch that Kalle suggested?

I'd be curious how that performed in comparison...

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
