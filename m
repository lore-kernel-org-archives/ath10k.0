Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fAML8-0002MV-VY
 for ath10k@lists.infradead.org; Sun, 22 Apr 2018 21:16:08 +0000
Received: by mail-vk0-x22d.google.com with SMTP id r184so8203732vke.11
 for <ath10k@lists.infradead.org>; Sun, 22 Apr 2018 14:15:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180422.145420.1197041027922699603.davem@davemloft.net>
References: <1524119910.3024.12.camel@sipsolutions.net>
 <173c5f98-36bc-2e52-1e64-3a5f89008d46@candelatech.com>
 <1524151617.3024.25.camel@sipsolutions.net>
 <20180422.145420.1197041027922699603.davem@davemloft.net>
From: Roopa Prabhu <roopa@cumulusnetworks.com>
Date: Sun, 22 Apr 2018 14:15:53 -0700
Message-ID: <CAJieiUh8Pnu5GVSWz04WSZ5L0YVpVBmeY+H_MjhL0k6SWwbcqw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ethtool: Support ETHTOOL_GSTATS2 command.
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
To: David Miller <davem@davemloft.net>
Cc: netdev <netdev@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

On Sun, Apr 22, 2018 at 11:54 AM, David Miller <davem@davemloft.net> wrote:
> From: Johannes Berg <johannes@sipsolutions.net>
> Date: Thu, 19 Apr 2018 17:26:57 +0200
>
>> On Thu, 2018-04-19 at 08:25 -0700, Ben Greear wrote:
>>>
>>> Maybe this could be in followup patches?  It's going to touch a lot of files,
>>> and might be hell to get merged all at once, and I've never used spatch, so
>>> just maybe someone else will volunteer that part :)
>>
>> I guess you'll have to ask davem. :)
>
> Well, first of all, I really don't like this.
>
> The first reason is that every time I see interface foo become foo2,
> foo3 is never far behind it.
>
> If foo was not extensible enough such that we needed foo2, we beter
> design the new thing with explicitly better extensibility in mind.
>
> Furthermore, what you want here is a specific filter.  Someone else
> will want to filter on another criteria, and the next person will
> want yet another.
>
> This needs to be properly generalized.
>
> And frankly if we had moved to ethtool netlink/devlink by now, we
> could just add a netlink attribute for filtering and not even be
> having this conversation.


+1.

Also, the RTM_GETSTATS api was added to improve stats query efficiency
(with filters).
 we should look at it  to see if this fits there. Keeping all stats
queries in one place will help.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
