Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtLD-0001Pa-90
 for ath10k@lists.infradead.org; Tue, 01 Apr 2014 07:42:40 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Clean-ish rebase on top of 3.14.0 (final)?
References: <53399703.1060302@candelatech.com>
Date: Tue, 1 Apr 2014 10:42:10 +0300
In-Reply-To: <53399703.1060302@candelatech.com> (Ben Greear's message of "Mon, 
 31 Mar 2014 09:25:39 -0700")
Message-ID: <87ioqtsdgt.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

Ben Greear <greearb@candelatech.com> writes:

> Kalle:  In case you end up with your tree in a clean rebase
> on stock 3.14.0 (or as clean as is reasonable), could you let
> us know and give us a bit of time before pulling down more
> upstream stuff?
>
> The reason is that I would like to freeze a 3.14 kernel with whatever
>ath10k patches are currently in your tree and attempt to stabalize
>it...

Do you mean 3.14 plus only ath10k patches? Or are you willing to take
other wireless patches as well?

Basically I have two branches in my ath.git:

o ath-next: wireless-next + latest ath10k patches

o master: wireless-testing + ath-next (= latest ath10k patches)

I only merge latest wireless-next to ath-next seldomly, usually once
every 1-2 months. But I merge wireless-testing to master branch at least
weekly.

One idea would be that you merge 3.14 tag with ath-next. That way you
get latest wireless code on top of 3.14. Would that work?

I'm planning to merge wireless-next to ath-next once John opens his
trees again, which usually happens just after the merge window is
closed.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
