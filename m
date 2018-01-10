Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x234.google.com ([2607:f8b0:4001:c0b::234])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZKuB-0006v4-Q1
 for ath10k@lists.infradead.org; Wed, 10 Jan 2018 18:15:17 +0000
Received: by mail-it0-x234.google.com with SMTP id p139so467090itb.1
 for <ath10k@lists.infradead.org>; Wed, 10 Jan 2018 10:15:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
References: <CALAE=UAPXYsCfO+QXxPsnEe2vkcMcCoknSAc8RVyOVk85MC-8Q@mail.gmail.com>
 <87vagh7kq2.fsf@kamboji.qca.qualcomm.com>
From: Robert Jones <rjones@gateworks.com>
Date: Wed, 10 Jan 2018 10:15:03 -0800
Message-ID: <CALAE=UD3kCG8_=o16D_JJ1_fN-PqQ+b0VxjWjxU8O_Sh1uHSFA@mail.gmail.com>
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
To: greearb@candelatech.com
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> There are more tcp related hacks that make ath10k useful for
> generating TCP traffic.  The tcp_tsq_limit_output_interval
> one in particular is helpful

> You can dig through my kernel and look for a commit related to
> tcp_tsq_limit_output_interval.  Try setting it to 5 or higher.

This solved the problem for me.

Link to commit for anyone else looking:
https://github.com/greearb/linux-ct-4.13/commit/dc201c3c310f805681dbf393484bdc9715745df1

Thanks!
Robert

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
