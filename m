Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp2.goneo.de ([2001:1640:5::8:33] helo=smtp2-2.goneo.de)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyHEh-0004hE-9q
 for ath10k@lists.infradead.org; Wed, 22 Jul 2020 16:04:52 +0000
Received: from localhost (localhost [127.0.0.1])
 by smtp2.goneo.de (Postfix) with ESMTP id 6E57923F6E0
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2020 18:04:45 +0200 (CEST)
Received: from smtp2.goneo.de ([127.0.0.1])
 by localhost (smtp2.goneo.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpMYKfhxc9iP for <ath10k@lists.infradead.org>;
 Wed, 22 Jul 2020 18:04:44 +0200 (CEST)
Received: from brot (ip-84-118-3-241.unity-media.net [84.118.3.241])
 by smtp2.goneo.de (Postfix) with ESMTPSA id 38A8E23F6EC
 for <ath10k@lists.infradead.org>; Wed, 22 Jul 2020 18:04:43 +0200 (CEST)
Date: Wed, 22 Jul 2020 18:04:42 +0200
From: "Leon M. George" <leon@georgemail.eu>
Subject: Re: duplicate authentications / excessive missing ACKs / deauth due
 to inactivity timer
Message-ID: <20200722180442.03b40f01@brot>
In-Reply-To: <cdba7890-62e4-4d99-bd0f-f1d458a4adc7@candelatech.com>
References: <20200722161812.329d7a10@brot>
 <cdba7890-62e4-4d99-bd0f-f1d458a4adc7@candelatech.com>
MIME-Version: 1.0
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
To: ath10k@lists.infradead.org

Hi Ben,

I was unclear in my last email.
Re-phrasing from my openwrt forum post:

I've tested various combinations of openwrt-trunk (now and early March) / 19.07, ath10k stock / ct driver, and stock / ct firmware.

regards,
Leon


On Wed, 22 Jul 2020 07:27:16 -0700
Ben Greear <greearb@candelatech.com> wrote:

> On 7/22/20 7:18 AM, Leon M. George wrote:
> > Hi :-)
> > 
> > I've encountered connection issues that appear to be strongly
> > related to the problem in this thread [1] (found via the arch linux
> > bug tracker [2]).
> 
> If this is ath10k-ct only problem, plz don't bother this list and
> send to just me and/or add to ath10k-ct bugtracker on github.
> 
> If it does affect upstream ath10k too, then that would be valid for
> this mailing list.
> 
> Thanks,
> Ben
> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
